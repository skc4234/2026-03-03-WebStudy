package com.sist.dao;
/*
 * 	1. FoodVO
 * 	2. FoodDAO
 * 	3. JSP
 * 	+Model, +Controller => MVC => Spring
 *  
 *  JDBC=>DBCP=>MyBatis=>MariaDB
 *  Git Action=>Docker=>Docker-compose => 쿠바네티스=>
 *  5. 
 *  6. Spring AI
 */
// JDBC : 시간이 오래 걸림 / 보안 취약
// DBCP : JDBC 단점 보완
// DBCP기반 MyBatis
// XML => JSP(MVC), Annotation => Spring, JPA => Spring Boot
// DBCP 단점 : 웹에서만 사용 가능
import java.sql.*;
import java.util.*;
import javax.sql.*;
import javax.naming.*;
/*
 * 1. Pool 안에 여러개의 Connection을 저장(Pool : 저장 메모리 공간)
 * 	    maxActive                maxIdle
 *  접근자의 최대 커넥션 개수   Pool안에 존재하는 커넥션개수
 * 2. 사용자 요청시에 Pool에서 Connection 객체를 가지고 온다
 */
public class FoodDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static FoodDAO dao;
	
	public static FoodDAO newInstance() {
		if(dao==null) dao=new FoodDAO();
		return dao;
	}
	
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
	
	public void disConnection() {
		try {
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public List<FoodVO> foodListData(int page) {
		List<FoodVO> list = new ArrayList<FoodVO>();
		try {
			getConnection();
			String sql="SELECT no,poster,name,address "
					+ "FROM food "
					+ "ORDER BY no ASC "
					+ "OFFSET ? ROWS FETCH NEXT 12 ROWS ONLY";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, (page*12)-12);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				FoodVO vo = new FoodVO();
				vo.setNo(rs.getInt(1));
				vo.setPoster(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setAddress(rs.getString(4));
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
	
	public int foodTotalPage() {
		int total=0;
		try {
			getConnection();
			String sql="SELECT CEIL(COUNT(*)/12.0) FROM food";
			ps=conn.prepareStatement(sql);
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

