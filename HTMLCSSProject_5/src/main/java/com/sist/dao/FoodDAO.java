package com.sist.dao;
/*
 *  검색 => like 
 *  
 *  SELECT+페이지
 *  JSP 핵심 : 데이터베이스 연동
 *  
 *  1. 드라이버 등록(한번만) => Class.forname("DriverName")
 *  2. 오라클 연결 => Connection conn = DriverManager.getConnection("URL","","");
 *  3. SQL 문장 생성 => String sql = "SQL 문장";
 *  4. SQL 문장 전송 => PreparedStatement ps = conn.preparedStatement(sql);
 *  5. 결과값 받기 => ResultSet rs = ps.executeQuery()
 *  6. List, VO 에 값을 담는다 => while(rs.next()) { ... }
 *  7. 커넥션 닫기 => rs.close(); ps.close(); conn.close();
 * 
 * 
 *  요구사항 분석 : 어떤 데이터/화면이 필요한지
				-------  ----------
			 데이터베이스 설계  화면 UI
			
			
			
 */									

import java.util.ArrayList;
import java.util.List;
import java.sql.*;
public class FoodDAO {
	// 공통 사용 부분(변수, 메소드)
	private Connection conn; // 오라클 연결 객체
	private PreparedStatement ps; // 오라클과 송수신
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	
	// 1. 드라이버 등록 - 생성자
	public FoodDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// MySQL : com.mysql.cj.Driver
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	// 2. 커넥션 열기
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(URL, "hr", "happy");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	// 3. 커넥션 닫기
	public void disConnection() {
		try {
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	// 에러 발생 => 소스를 보는게 아니라 output 창에서 에러 내용 보기 => printstack
	// 1. Driver 에러 / SQL문장 오류 등
	// 디버깅
	
	// 기능
	// 한식, 양식, 중식, 일식, 분식 분리
	public List<FoodVO> foodListData(int page, String type) {
		List<FoodVO> list = new ArrayList<FoodVO>();
		try {
			getConnection();
			String sql="SELECT no, poster, name "
					+ "FROM food "
					+ "WHERE type LIKE '%'||?||'%' "
					+ "ORDER BY no ASC "
					+ "OFFSET ? ROWS FETCH NEXT 12 ROWS ONLY";
			// offset은 시작 번호가 0
			ps = conn.prepareStatement(sql);
			ps.setString(1, type);
			ps.setInt(2, (page*12)-12);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				FoodVO vo = new FoodVO();
				vo.setNo(rs.getInt(1));
				vo.setPoster(rs.getString(2));
				vo.setName(rs.getString(3));
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
	
	// 총 페이지 수 구하기
	public int foodTotalPage(String type) {
		int total=0;
		try {
			getConnection();
			String sql="SELECT CEIL(COUNT(*)/12.0) FROM food "
					+ "WHERE type LIKE '%'||?||'%'";
			ps = conn.prepareStatement(sql);
			ps.setString(1, type);
			ResultSet rs = ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return total;
	}
	
	// 검색(type, address, name)
	public List<FoodVO> foodFindData(String column, String fd) {
		List<FoodVO> list = new ArrayList<FoodVO>();
		try {
			getConnection();
			String sql = "SELECT no, poster, name "
					+ "FROM food "
					+ "WHERE "+column+" LIKE '%'||?||'%' "
					+ "ORDER BY no ASC";
			// column을 ?로 받으면 ''가 붙기 때문에 문자열 결합으로 사용
			ps = conn.prepareStatement(sql);
			ps.setString(1, fd);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				FoodVO vo = new FoodVO();
				vo.setNo(rs.getInt(1));
				vo.setPoster(rs.getString(2));
				vo.setName(rs.getString(3));
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
}
