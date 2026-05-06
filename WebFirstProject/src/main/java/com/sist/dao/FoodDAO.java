package com.sist.dao;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import com.sist.vo.*;
public class FoodDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	
	// 싱글턴
	private static FoodDAO dao;
	public static FoodDAO newInstance() {
		if(dao==null) dao = new FoodDAO();
		return dao;
	}
	
	// 드라이버 등록
	public FoodDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	// 오라클 연결
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(URL,"hr","happy");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	// 오라클 닫기
	public void disConnection() {
		try {
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	/*
	NO      NOT NULL NUMBER         
NAME             VARCHAR2(100)  
TYPE             VARCHAR2(100)  
PHONE            VARCHAR2(30)   
ADDRESS          VARCHAR2(260)  
SCORE            NUMBER(2,1)    
PARKING          VARCHAR2(200)  
POSTER           VARCHAR2(260)  
TIME             VARCHAR2(50)   
CONTENT          CLOB           
THEME            VARCHAR2(4000) 
PRICE            VARCHAR2(100)
	 */
	
	// 기능
	// 총 데이터를 20개씩
	public List<FoodVO> foodListData(int page) {
		List<FoodVO> list = new ArrayList<FoodVO>();
		try {
			getConnection();
			String sql = "SELECT no, name, type, phone, address, score, parking, "
					+ "poster, time, content, theme, price "
					+ "FROM food "
					+ "ORDER BY no ASC "
					+ "OFFSET ? ROWS FETCH NEXT 20 ROWS ONLY";
			int start = (page*20)-20;
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				FoodVO vo = new FoodVO();
				vo.setNo(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setType(rs.getString(3));
				vo.setPhone(rs.getString(4));
				vo.setAddress(rs.getString(5));
				vo.setScore(rs.getDouble(6));
				vo.setParking(rs.getString(7));
				vo.setPoster(rs.getString(8));
				vo.setTime(rs.getString(9));
				vo.setContent(rs.getString(10));
				vo.setTheme(rs.getString(11));
				vo.setPrice(rs.getString(12));
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
	
	// 총 페이지 수
	public int foodTotalPage() {
		int total = 0;
		try {
			getConnection();
			String sql = "SELECT CEIL(COUNT(*)/20.0) FROM food";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			total = rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return total;
	}
}
