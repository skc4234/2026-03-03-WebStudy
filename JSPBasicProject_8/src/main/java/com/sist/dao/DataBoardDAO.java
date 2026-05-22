package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sist.vo.DataBoardVO;

// **MyBatis** VS JPA : SQL 문장 자동화
// findByAll => SELECT * FROM table
// findByName(String n) => SELECT * FROM table WHERE name=n


public class DataBoardDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static DataBoardDAO dao;
	private static final int ROWSIZE=10;
	public void getConnection() {
		try {
			// Pool 연결
			Context init = new InitialContext();
			Context c=(Context)init.lookup("java://comp/env/");
			DataSource ds = (DataSource)c.lookup("jdbc/oracle");
			conn = ds.getConnection();
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
	public static DataBoardDAO newInstance() {
		if(dao==null) dao=new DataBoardDAO();
		return dao;
	}
	
	// 기능
	// 목록 출력
	public List<DataBoardVO> databoardListData(int page) {
		List<DataBoardVO> list = new ArrayList<DataBoardVO>();
		try {
			getConnection();
			String sql="SELECT no,name,subject,TO_CHAR(regdate,'YYYY-MM-DD'),hit "
					+ "FROM databoard "
					+ "ORDER BY no DESC "
					+ "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
			ps=conn.prepareStatement(sql);
			int start=(page*ROWSIZE)-ROWSIZE;
			ps.setInt(1, start);
			ps.setInt(2, ROWSIZE);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				DataBoardVO vo = new DataBoardVO();
				vo.setNo(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setSubject(rs.getString(3));
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
	
	// 총 페이지
	public int databoardTotalPage() {
		int total=0;
		try {
			getConnection();
			String sql="SELECT CEIL(COUNT(*)/?) FROM databoard";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, ROWSIZE);
			ResultSet rs = ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return total;
	}
	
	// 추가 + 파일 업로드
	public void databoardInsert(DataBoardVO vo) {
		try {
			getConnection();
			String sql="INSERT INTO databoard(no, name, subject, content, pwd, filename, filesize) "
					+ "VALUES(db_no_seq.nextval, ?,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getPwd());
			ps.setString(5, vo.getFilename());
			ps.setInt(6, vo.getFilesize());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
	}
	
	
	// 상세보기 + 다운로드
	public DataBoardVO databoardDetailData(int no) {
		DataBoardVO vo = new DataBoardVO();
		try {
			getConnection();
			String sql="SELECT no,name,subject,content,pwd,TO_CHAR(sysdate,'YYYY-MM-DD'),hit,filename,filesize "
					+ "FROM databoard "
					+ "WHERE no="+no;
			ps=conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			
			vo.setDbday(rs.getString(4));
			vo.setHit(rs.getInt(5));
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return vo;
	}
	
	
	// 수정
	
	// 삭제 + 파일도 삭제
	
	// 저장 폴더 => realPath에 저장 => application.getContextPath()
	// 리눅스에서도 실행이 되게 호환
}
