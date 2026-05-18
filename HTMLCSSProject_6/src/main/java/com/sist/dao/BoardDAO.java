package com.sist.dao;
// 1. 드라이버 등록 
// 2. 오라클 연결
// 3. SQL 전송
// 4. 결과값 받기
// 5. List에 값 채우기
// 6. 닫기

import java.util.ArrayList;
// 오라클
// JOIN / SUBQUERY / VIEW / INDEX / PROCEDURE / TRIGGER
import java.util.List;
import java.sql.*;
public class BoardDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	private static final int ROWSIZE = 10;

	public BoardDAO() {
		try {
			// 리플렉션 : 클래스 이름으로 제어 => 메모리 할당 / 멤버변수 설정 / 생성자 / 메소드 호출 가능
			// MyBatis / Spring 에서 주로 사용
			// 설정파일 : .xml / 구분 : Annotation
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public void getConnection() {
		try {
			conn=DriverManager.getConnection(URL,"hr","happy");
			// SQL Plus를 열어준다 => conn hr/happy
			/*
			 * 			DriverManager
			 * 		          |
			 * 	   ------------------------
			 * 	   |      |       |       |
			 * 	Oracle  MySQL  MariaDB  MsSQL => 금융권, 공기업, 학교
			 * 
			 *	연습용 : SQL Lite(소형) => 핸드폰 / 브라우저에 내장
			 */
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public void disConnection() {
		try {
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
			// 연결한 순서 역순으로 닫기
			/*
			 * - 연결
			 * Connection => PreparedStatement => ResultSet
			 * --------------------------------------------
			 * - 해제
			 * ResultSet : 데이터 저장하는 메모리 공간 => 전역으로 사용하면 안됨
			 * 		|
			 * PreparedStatement : 통신 => OutputStream / BufferedReader
			 * 		|
			 * Connection : 연결(TCP) => Socket
			 */
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	// 기능
	// 목록 => 페이징(적당한 크기만 화면에 띄워서 가독성을 높임)
	// 보통 한 페이지에 10~20개, 이미지는 12~20개
	// 페이지가 적을 경우 : 이전/다음 버튼
	// 페이지가 많을 경우 : 1 2 3 4 5 ... 블록별 처리
	// 면접 => 인라인 뷰 / OFFSET
	// 객체 저장 공간 => 배열(크기 고정), List
	
	
	// 목록
	/*
	 * 	   -------------------------------------
	 * 		no   subject   name   regdate   hit
	 * 	   -------------------------------------
	 * 		1									=> rs.next
	 * 	   -------------------------------------
	 * 		2
	 *     -------------------------------------
	 * 		3									=> rs.previous
	 * 	   -------------------------------------
	 * 
	 * 		ResultSet => 단위가 Record => 한 줄 전체를 읽어온다
	 */
	public List<BoardVO> boardListData(int page) {
		List<BoardVO> list = new ArrayList<BoardVO>();
		try {
			getConnection();
			String sql="SELECT no, name, subject, TO_CHAR(regdate, 'YYYY-MM-DD'), hit "
					+ "FROM jspBoard "
					+ "ORDER BY no DESC "
					+ "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY"; // 12c
			/* 인라인뷰를 이용한 페이징 기법
			 	SELECT no, name, subject, TO_CHAR(regdate, 'YYYY-MM-DD'), hit, num
			 	FROM (SELECT no,name,subject,regdate,hit,rownum as num
			 			FROM (SELECT no,name,subject,regdate,hit
			 					FROM jspBoard ORDER BY no DESC))
			 	WHERE num BETWEEN ? AND ?
			*/
			// java.sql / java.io / java.net => 반드시 예외처리 필요
			ps = conn.prepareStatement(sql);
			ps.setInt(1, (page*ROWSIZE)-ROWSIZE); // 정수: setInt /실수: setDouble /문자: setString /날짜: setDate
			// setString, setDate는 자동으로 ''붙임
			ps.setInt(2, ROWSIZE);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				// rs.getXxx(String 컬럼명) / rs.getXxx(int 인덱스)
				// rs.getInt("no") == rs.getInt(1)
				vo.setNo(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setSubject(rs.getString(3));
				vo.setDbday(rs.getString(4));
				vo.setHit(rs.getInt(5));
				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return list;
	}
	
	// 총 페이지 수 => 순차적 출력
	public int boardRowCount() {
		int count=0;
		try {
			getConnection();
			//String sql="SELECT CEIL(COUNT(*)/?) FROM jspBoard";
			String sql="SELECT COUNT(*) FROM jspBoard";
			ps=conn.prepareStatement(sql);
			//ps.setInt(1, ROWSIZE);
			ResultSet rs = ps.executeQuery();
			rs.next();
			count=rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return count;
	}
	
	// 상세보기
	public BoardVO boardDetailData(int no) {
		BoardVO vo = new BoardVO();
		try {
			getConnection();
			String sql = "UPDATE jspBoard SET hit=hit+1 WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ps.executeUpdate();
			
			sql="SELECT no, name, subject, content, TO_CHAR(regdate, 'YYYY-MM-DD HH24:MI:SS'), hit, pwd "
					+ "FROM jspBoard "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setDbday(rs.getString(5));
			vo.setHit(rs.getInt(6));
			vo.setPwd(rs.getString(7));
			rs.close();
			// 기능 수행 => SQL 문장이 한개가 아닌 경우도 있다
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return vo;
	}
	
	// CURD
	// 추가 => INSERT
	public void boardInsertData(BoardVO vo) {
		try {
			getConnection();
			String sql="INSERT INTO jspBoard(name, subject, content, pwd) "
					+ "VALUES(?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getPwd());
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			disConnection();
		}
	}
	// 수정 전 단계 => 기존 정보를 출력
	public BoardVO boardUpdateData(int no) {
		BoardVO vo = new BoardVO();
		try {
			getConnection();
			String sql="SELECT no, name, subject, content FROM jspBoard WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			rs.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return vo;
	}
	
	// 실제 수정 => Update
	public boolean boardUpdate(BoardVO vo) {
		boolean bCheck = false;
		try {
			getConnection();
			String sql = "SELECT pwd FROM jspBoard WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, vo.getNo());
			ResultSet rs = ps.executeQuery();
			rs.next();
			String dbpwd = rs.getString(1);
			rs.close();
			if(dbpwd.equals(vo.getPwd())) {
				// 비밀번호가 맞다면
				sql="UPDATE jspBoard SET subject=?, content=?, name=?"
						+ "WHERE no=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, vo.getSubject());
				ps.setString(2, vo.getContent());
				ps.setString(3, vo.getName());
				ps.setInt(4, vo.getNo());
				ps.executeUpdate();
				bCheck=true;
			}
			
		} catch (Exception e) {
			// TODO: handle 
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return bCheck;
	}
	
	// 삭제 => DELETE
	public boolean boardDeleteData(int no, String pwd) {
		boolean bCheck = false; 
		try {
			getConnection();
			String sql="SELECT pwd FROM jspBoard WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			rs.next();
			String dbpwd = rs.getString(1);
			rs.close();
			if(dbpwd.equals(pwd)) {
				// 비밀번호가 맞으면
				sql="DELETE FROM jspBoard WHERE no=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, no);
				ps.executeUpdate();
				bCheck=true;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return bCheck;
	}
	
	/*
	EMPNO    NOT NULL NUMBER       
ENAME    NOT NULL VARCHAR2(50) 
JOB      NOT NULL VARCHAR2(50) 
HIREDATE NOT NULL DATE         
SAL      NOT NULL NUMBER(10,2) 
DEPTNO   NOT NULL NUMBER       
ISADMIN           CHAR(1)
	 */
	
	public List<EmpVO> empListData(int page) {
		List<EmpVO> list = new ArrayList<EmpVO>();
		try {
			getConnection();
			String sql="SELECT empno, ename, job, TO_CHAR(hiredate, 'YYYY-MM-DD'), sal, deptno "
					+ "FROM emp2 "
					+ "ORDER BY empno ASC "
					+ "OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY";
			ps=conn.prepareStatement(sql);
			int start = (page*10)-10;
			ps.setInt(1, start);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				EmpVO vo = new EmpVO();
				vo.setEmpno(rs.getInt(1));
				vo.setEname(rs.getString(2));
				vo.setJob(rs.getString(3));
				vo.setDbday(rs.getString(4));
				vo.setSal(rs.getInt(5));
				vo.setDeptno(rs.getInt(6));
				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return list;
	}
	
	public int empTotalCount() {
		int count=0;
		try {
			getConnection();
			String sql = "SELECT COUNT(*) FROM emp2";
			ps=conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			count = rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			// TODO: handle 
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return count;
	}
	
	public boolean EmpNew(String date1, String date2) {
		boolean bCheck=false;
		String year1 = date1.substring(0, date1.indexOf("-"));
		String year2 = date2.substring(0, date2.indexOf("-"));
		String month1 = date1.substring(date1.indexOf("-")+1,date1.lastIndexOf("-"));
		String month2 = date2.substring(date2.indexOf("-")+1,date2.lastIndexOf("-"));
		String day1 = date1.substring(date1.lastIndexOf("-")+1,date1.length());
		String day2 = date1.substring(date2.lastIndexOf("-")+1,date2.length());
		if(Integer.parseInt(year1)<Integer.parseInt(year2)) bCheck=true;
		else if(Integer.parseInt(year1)==Integer.parseInt(year2)) {
			if(Integer.parseInt(month1)<Integer.parseInt(month2)) bCheck=true;
			else if(Integer.parseInt(month1)==Integer.parseInt(month2)) {
				if(Integer.parseInt(day1)<=Integer.parseInt(day2)) bCheck=true;
			}
		}
		
		
		return bCheck;
	}
	
}
