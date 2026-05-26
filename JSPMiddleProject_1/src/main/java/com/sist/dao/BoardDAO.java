package com.sist.dao;
import java.sql.*;
import java.util.*;
// ConnectionPool
import javax.sql.*;

import com.sist.vo.BoardVO;

import javax.naming.*;
public class BoardDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static BoardDAO dao;
	private static final int ROWSIZE = 10;
	public static BoardDAO newInstance() {
		if(dao==null) dao=new BoardDAO();
		return dao;
	}
	
	/*
	 *  Connection Pool 사용순서
	 *  1. 요청 받는다
	 *  2. Pool 안에 저장된 Connection 객체를 가지고 온다
	 *  3. SQL 문장 => SQL 실행 => 결과값 받기
	 *  4. 사용 후에 Pool로 반환
	 *  => Connection 객체 관리 => 메모리 누수현상 방지
	 *  => 미리 Connection이 연결된 상태이기 때문에 연결 소모 시간을 줄일 수 있다
	 *  => Connection 재사용 => 쉽게 서버가 다운되지 않는다
	 *  => 웹사이트 일반 DB 연동은 ConnectionPool
	 */
	
	// Connection과 관련 => 연결/닫기만 처리
	
	public void getConnection() {
		try {
			Context init = new InitialContext(); // 탐색기 열기
			Context c = (Context)init.lookup("java://comp/env"); // c드라이브
			// 커넥션 객체 얻기
			DataSource ds = (DataSource)c.lookup("jdbc/oracle");
			conn=ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void disConnection() {
		try {
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 기능
	// 1. 전체 데이터 가져오기
	public List<BoardVO> boardListData(int page) {
		List<BoardVO> list = new ArrayList<BoardVO>();
		try {
			getConnection();
			String sql="SELECT no,subject,name,TO_CHAR(regdate, 'YYYY-MM-DD'),hit "
					+ "FROM jspboard "
					+ "ORDER BY no DESC "
					+ "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
			ps=conn.prepareStatement(sql);
			int start = (page*ROWSIZE)-ROWSIZE;
			ps.setInt(1, start);
			ps.setInt(2, ROWSIZE);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setDbday(rs.getString(4));
				vo.setHit(rs.getInt(5));
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
	
	// 1-1. 총 페이지 수
	public int boardTotalPage() {
		int total=0;
		try {
			getConnection();
			String sql="SELECT CEIL(COUNT(*)/?) FROM jspboard";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, ROWSIZE);
			ResultSet rs = ps.executeQuery();
			rs.next();
			total = rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return total;
	}
	
	// 2. 추가
	public void boardInsert(BoardVO vo) {
		try {
			getConnection();
			// no => auto_increment
			String sql="INSERT INTO jspboard(name, subject, content, pwd) "
					+ "VALUES(?,?,?,?)";
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
	
	// 상세보기
	public BoardVO boardDetailData(int no) {
		BoardVO vo = new BoardVO();
		try {
			getConnection();
			String sql="UPDATE jspboard SET hit=hit+1 WHERE no="+no;
			ps=conn.prepareStatement(sql);
			ps.executeUpdate();
			sql="SELECT no,name,subject,content,hit,TO_CHAR(regdate, 'YYYY-MM-DD') "
					+ "FROM jspboard "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setHit(rs.getInt(5));
			vo.setDbday(rs.getString(6));
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return vo;
	}
}
