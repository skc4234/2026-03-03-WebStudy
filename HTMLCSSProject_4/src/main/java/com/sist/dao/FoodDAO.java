package com.sist.dao;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;
/*
 *  1. 드라이버 등록 => Class.forName("");
 *  2. 오라클 연결
 *  3. 오라클 연결
 *  4. 오라클 닫기
 *  5.
 *  웹-70% DB연동 / 20% 화면 디자인 / 10% 자바스크립트
 */
public class FoodDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	private static final int ROWSIZE = 12;
	
	// 1. 드라이버 등록
	public FoodDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	// 2. 오라클 연결
	public void getConnection() {
		try {
			conn=DriverManager.getConnection(URL,"hr","happy");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	//3. 연결 해제
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
	 * FoodVO vo = new FoodVO();
				vo.setNo(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setType(rs.getString(3));
				vo.setPhone(rs.getString(4));
				vo.setAddresss(rs.getString(5));
				vo.setScore(rs.getDouble(6));
				vo.setParking(rs.getString(7));
				vo.setPoster(rs.getString(8));
				vo.setTime(rs.getString(9));
				vo.setContent(rs.getString(10));
				vo.setTheme(rs.getString(11));
				vo.setPrice(rs.getString(12));
	 * 
	 */
	
	// 기능
	// 1. 목록=>페이지=>한 파일에 12개행 출력
	public List<FoodVO> foodListData(int page) {
		List<FoodVO> list = new ArrayList<FoodVO>();
		try {
			getConnection();
			String sql="SELECT no, name, poster "
					+ "FROM food "
					+ "ORDER BY no ASC "
					+ "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
			int start=(page*ROWSIZE)-ROWSIZE;
			ps=conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, ROWSIZE);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				FoodVO vo = new FoodVO();
				vo.setNo(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setPoster(rs.getString(3));
				//System.out.println(vo.getNo()+". "+vo.getName()+" - "+vo.getPoster());
				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			disConnection();
		}
		return list;
	}
	
	// 총 페이지 수
	public int totalPage() {
		int total = 0;
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
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return total;
	}
	
	// web 흐름 : 이동하는 파일
	
	
	// 상세보기
	public FoodVO foodDetailData(int no) {
		FoodVO vo = new FoodVO();
		try {
			getConnection();
			String sql="SELECT no, name, type, phone, address, score, parking, poster, "
					+ "time, content, theme, price " 
					+ "FROM food "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setType(rs.getString(3));
			vo.setPhone(rs.getString(4));
			vo.setAddresss(rs.getString(5));
			vo.setScore(rs.getDouble(6));
			vo.setParking(rs.getString(7));
			vo.setPoster(rs.getString(8));
			vo.setTime(rs.getString(9));
			vo.setContent(rs.getString(10));
			vo.setTheme(rs.getString(11));
			vo.setPrice(rs.getString(12));
			//System.out.println(vo.getNo()+". "+vo.getName()+" - "+vo.getAddresss());
			rs.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return vo;
	}
	
}
