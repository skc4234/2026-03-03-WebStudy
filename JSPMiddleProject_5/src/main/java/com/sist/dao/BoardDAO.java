package com.sist.dao;

import java.util.*;
import java.sql.*;
import javax.sql.*; // DataSource => 데이터베이스 연결에 필요한 정보
import javax.naming.*; // Context => Pool 안에 있는 Connection 주소 얻기
// MyBatis / JPA => ConnectionPool 기반
public class BoardDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static BoardDAO dao;
	private static final int ROW = 10;
	
	// 1. Pool 안에 있는 Connection 대여 => 미리 오라클에 연결된 상태
	public void getConnection() {
		try {
			Context init = new InitialContext();
			Context c=(Context)init.lookup("java://comp/env/");
			DataSource ds = (DataSource)c.lookup("jdbc/oracle");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 2. 사용 후에 Pool로 반환
	public void disConnection() {
		try {
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 3. 메모리 누수현상 방지 => 싱글턴
	public static BoardDAO newInstance() {
		if(dao==null) dao=new BoardDAO();
		return dao;
	}
	
	/*
		try {
			getConnection();
			String sql="";
			ps=conn.prepareStatement(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
	 */
	
	// 4. 기능
	// 4-1. 목록 출력
	
	public List<BoardVO> boardListData(int page) {
		List<BoardVO> list = new ArrayList<BoardVO>();
		try {
			getConnection();
			String sql="SELECT no,name,subject,TO_CHAR(regdate, 'YYYY-MM-DD'),hit,group_tab "
					+ "FROM jspreplyboard "
					+ "ORDER BY group_id DESC, group_step ASC "
					+ "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
			ps=conn.prepareStatement(sql);
			int start = (page*ROW)-ROW;
			ps.setInt(1, start);
			ps.setInt(2, ROW);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setNo(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setSubject(rs.getString(3));
				vo.setDbday(rs.getString(4));
				vo.setHit(rs.getInt(5));
				vo.setGroup_tab(rs.getInt(6));
				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return list;
	}
	
	// 4-1-1. 총 row 수
	public int boardRowCount() {
		int count=0;
		try {
			getConnection();
			String sql="SELECT COUNT(*) FROM jspreplyboard";
			ps=conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			count = rs.getInt(1);
			rs.close();
		} catch (Exception e) { 
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return count;
	}
	
	// 4-2. 게시물 추가
	public void boardInsert(BoardVO vo) {
		try {
			getConnection();
			String sql="INSERT INTO jspreplyboard(no,name,subject,content,pwd,group_id) "
					+ "VALUES(jrb_no_seq.nextval,?,?,?,?,"
					+ "(SELECT NVL(MAX(group_id)+1,1) FROM jspreplyboard))";
			// JOIN => select만 사용, SubQuery는 DML 전체 사용 가능
			// JOIN => table+table => 필요한 데이터 추출
			// SubQuery => SQL+SQL => 한개의 SQL문
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getPwd());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
	}
	
	// 4-3. 상세보기 => 조회수 증가+SELECT
	public BoardVO boarDetail(int no) {
		BoardVO vo = new BoardVO();
		try {
			getConnection();
			String sql="UPDATE jspreplyboard SET hit=hit+1 WHERE no="+no;
			ps=conn.prepareStatement(sql);
			ps.executeUpdate();
			sql="SELECT no,name,subject,content,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS'),hit "
					+ "FROM jspreplyboard "
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
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return vo;
	}
	
	// 4-4. 수정하기(수정 전 정보 가져오기 + 수정 후 update)
	public BoardVO boardUpdateData(int no) {
		BoardVO vo = new BoardVO();
		try {
			getConnection();
			String sql="SELECT no,name,subject,content "
					+ "FROM jspreplyboard "
					+ "WHERE no=?";
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
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return vo;
	}
	
	// 비밀번호 일치여부 => 맞으면 수정, 틀리면 false
	public boolean boardUpdate(BoardVO vo) {
		boolean bCheck = false;
		try {
			getConnection();
			String sql="SELECT pwd FROM jspreplyboard WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, vo.getNo());
			ResultSet rs = ps.executeQuery();
			rs.next();
			String db_pwd = rs.getString(1);
			rs.close();
			if(db_pwd.equals(vo.getPwd())) { // 비밀번호가 일치하면
				bCheck=true;
				sql="UPDATE jspreplyboard SET name=?,subject=?,content=? WHERE no=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, vo.getName());
				ps.setString(2, vo.getSubject());
				ps.setString(3, vo.getContent());
				ps.setInt(4, vo.getNo());
				ps.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return bCheck;
	}
	
	// ------------------
	// 4-5. 답변 올리기 => SQL 문장 4개 수행
	// int pno = 질문글 번호
	// 일괄처리 => 동시 commit / 동시 rollback
	// 비절차적 => Error가 생겨도 멈추지 않음
	// 트랜잭션 => Atomatic(원자성)
	// SAVEPOINT
	public void boardReply(int pno, BoardVO vo) {
		try {
			getConnection();
			conn.setAutoCommit(false); // 트랜잭션을 위해 autocommit false
			// 1. 답변 대상(질문글) 정보 얻기
			String sql="SELECT group_id,group_step,group_tab "
					+ "FROM jspreplyboard "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, pno);
			ResultSet rs = ps.executeQuery();
			rs.next();
			int gi = rs.getInt(1);
			int gs = rs.getInt(2);
			int gt = rs.getInt(3);
			rs.close();
			
			// 2. 답변의 root값
			/*             gi  gs  gt
			 *   aaa        1   0   0
			 *    =>bbb     1   1   1
			 *     =>ccc    1   2   2
			 *    =>ddd     1   ?   1
			 *    
			 *    
			 *   aaa        1   0   0
			 *    =>ddd     1   1   1
			 *    =>bbb     1   1+1 1
			 *     =>ccc    1   2+1 2
			 *   
			 *    
			 */
			// 질문 빼고 gs값 +1
			// 새 답변을 최상단으로
			sql="UPDATE jspreplyboard SET group_step=group_step+1 "
					+ "WHERE group_id=? AND group_step>?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, gi);
			ps.setInt(2, gs);
			ps.executeUpdate();
			
			// 3. 답변 insert
			// 답변 추가
			sql="INSERT INTO jspreplyboard(no,name,subject,content,pwd,group_id,group_step,group_tab,root) "
					+ "VALUES(jrb_no_seq.nextval,?,?,?,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getPwd());
			ps.setInt(5, gi);
			ps.setInt(6, gs+1);
			ps.setInt(7, gt+1);
			ps.setInt(8, pno);
			ps.executeUpdate();
			
			// 4. 답변 개수 체크
			// Depth 증가
			sql="UPDATE jspreplyboard SET depth=depth+1 WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, pno);
			ps.executeUpdate();
			
			
			conn.commit(); // All or Nothing => 원자성
			// 여러개의 SQL 문장 => 순서확인
			/*
			 * 1. 상위 게시물의 정보
			 * => 답변 정보 : group_id : 질문,답변,대댓글 그룹번호
			 * 			   group_step : 답변 출력 순서
			 * 			   group_tab : 간격 설정
			 *             root : 상위 게시물 / depth : 답변 개수
			 * 	- 질문 지우기
			 * 		- 비밀번호 확인
			 * 		- depth=0(답변이 없는 경우) : 본인 게시물 삭제 가능
			 *      - dept>0(답변이 있는 경우) : 제목/내용만 변경 가능 / 삭제 불가
			 *      					=> 관리자가 삭제 가능
			 *      
			 *  - MVC 응용 : 대댓글 / 실시간 채팅 / 실시간 상담
			 *  - Spring AI : 챗봇
			 *             
			 *             
			 */
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback(); // 트랜잭션 취소
			} catch (Exception e2) {
				
			}
		} finally {
			try {
				conn.setAutoCommit(true); // 수행 후 다시 autocommit true
			} catch (Exception e2) {
				
			}
			disConnection();
		}
	}
	
	// 4-6. 삭제하기 => SQL 문장 4개 수행
	// ==> 트랜잭션 처리(일괄)
	public boolean boardDelete(int no, String pwd) {
		boolean bCheck=false;
		try {
			getConnection();
			conn.setAutoCommit(false);
			// 1. 비밀번호,root,depth 검색
			String sql="SELECT pwd,root,depth FROM jspreplyboard WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			rs.next();
			String db_pwd = rs.getString(1);
			int db_root = rs.getInt(2);
			int db_depth = rs.getInt(3);
			rs.close();
			
			// 2. 비밀번호 일치 여부
			if(db_pwd.equals(pwd)) {
				bCheck=true;
				// 3. 삭제 가능한 게시물(depth==0) 여부
				if(db_depth==0) {
					// 3-1. depth==0 => delete
					sql="DELETE FROM jspreplyboard WHERE no=?";
					ps=conn.prepareStatement(sql);
					ps.setInt(1, no);
					ps.executeUpdate();
				}
				else {
					// 3-2. depth>0 => update
					String msg="관리자가 삭제한 게시물입니다";
					sql="UPDATE jspreplyboard SET subject=?, content=? "
							+ "WHERE no=?";
					ps=conn.prepareStatement(sql);
					ps.setString(1, msg);
					ps.setString(2, msg);
					ps.setInt(3, no);
					ps.executeUpdate();
				}
				sql="UPDATE jspreplyboard SET "
						+ "depth=depth-1 "
						+ "WHERE no=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, db_root);
			}
			
			conn.commit();
			
			
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		} finally {
			try {
				conn.setAutoCommit(true);
			} catch (Exception e) {
				e.printStackTrace();
			}
			disConnection();
		}
		return bCheck;
	}
	
}
