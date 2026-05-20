package com.sist.dao;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;
public class FoodsDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final static String URL="jdbc:oracle:thin:@localhost:1521:XE";
	private static FoodsDAO dao;
	private final static int ROWSIZE=12;
	
	public FoodsDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	// 싱글턴 => new를 사용하지 않고 재사용 가능 => 메모리 절약
	public static FoodsDAO newInstance() {
		if(dao==null) dao=new FoodsDAO();
		return dao;
	}
	
	public void getConnection() {
		try {
			conn=DriverManager.getConnection(URL,"hr","happy");
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
	

	
	// 목록 출력
	public List<FoodsVO> foodsListData(int page) {
		List<FoodsVO> list = new ArrayList<FoodsVO>();
		try {
			getConnection();
			String sql="SELECT no, name, poster, score "
					+ "FROM food "
					+ "ORDER BY no ASC "
					+ "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
			ps=conn.prepareStatement(sql);
			int start = (page*ROWSIZE)-ROWSIZE;
			ps.setInt(1, start);
			ps.setInt(2, ROWSIZE);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				FoodsVO vo = new FoodsVO();
				vo.setNo(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setPoster(rs.getString(3));
				vo.setScore(rs.getDouble(4));
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
	
	// 총페이지
	public int foodsTotalPage() {
		int total=0;
		try {
			getConnection();
			String sql="SELECT CEIL(COUNT(*)/?) FROM food";
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
	
	/*
 NO                                        NOT NULL NUMBER
 NAME                                               VARCHAR2(100)
 TYPE                                               VARCHAR2(100)
 PHONE                                              VARCHAR2(30)
 ADDRESS                                            VARCHAR2(260)
 SCORE                                              NUMBER(2,1)
 PARKING                                            VARCHAR2(200)
 POSTER                                             VARCHAR2(260)
 TIME                                               VARCHAR2(50)
 CONTENT                                            CLOB
 THEME                                              VARCHAR2(4000)
 PRICE                                              VARCHAR2(100)
	 */
	
	// 상세보기
	public FoodsVO foodDetailData(int no) {
		FoodsVO vo = new FoodsVO();
		try {
			getConnection();
			String sql="SELECT no, name, poster, type, phone, address, score, parking, time, content, "
					+ "theme, price "
					+ "FROM food "
					+ "WHERE no="+no;
			ps=conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setPoster(rs.getString(3));
			vo.setType(rs.getString(4));
			vo.setPhone(rs.getString(5));
			vo.setAddress(rs.getString(6));
			vo.setScore(rs.getDouble(7));
			vo.setParking(rs.getString(8));
			vo.setTime(rs.getString(9));
			vo.setContent(rs.getString(10));
			vo.setTheme(rs.getString(11));
			vo.setPrice(rs.getString(12));
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return vo;
	}
	
	// 검색
	public List<FoodsVO> foodsFindData(int page, String address) {
		List<FoodsVO> list = new ArrayList<FoodsVO>();
		try {
			getConnection();
			String sql="SELECT no, name, poster, score "
					+ "FROM food "
					+ "WHERE address LIKE '%'||?||'%' "
					+ "ORDER BY no ASC "
					+ "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
			ps=conn.prepareStatement(sql);
			int start = (page*ROWSIZE)-ROWSIZE;
			ps.setString(1, address);
			ps.setInt(2, start);
			ps.setInt(3, ROWSIZE);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				FoodsVO vo = new FoodsVO();
				vo.setNo(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setPoster(rs.getString(3));
				vo.setScore(rs.getDouble(4));
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
	
	// 검색결과 총페이지
	public int foodsFindTotalPage(String address) {
		int total=0;
		try {
			getConnection();
			String sql="SELECT CEIL(COUNT(*)/?) FROM food WHERE address LIKE '%'||?||'%'";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, ROWSIZE);
			ps.setString(2, address);
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
	
}
