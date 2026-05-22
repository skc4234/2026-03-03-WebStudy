package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.sist.vo.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class FoodDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static FoodDAO dao;
	private static final int ROWSIZE=12;
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
	public static FoodDAO newInstance() {
		if(dao==null) dao=new FoodDAO();
		return dao;
	}
	
	public List<FoodVO> foodsListData(int page) {
		List<FoodVO> list = new ArrayList<FoodVO>();
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
				FoodVO vo = new FoodVO();
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
	
	// 상세보기
		public FoodVO foodDetailData(int no) {
			FoodVO vo = new FoodVO();
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
}
