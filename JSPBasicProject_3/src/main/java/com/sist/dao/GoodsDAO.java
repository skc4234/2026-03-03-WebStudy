package com.sist.dao;
import java.util.ArrayList;
// 반드시 싱글턴 사용
// jsp 한개당 _jspService()를 따로 가지고 있다
// 톰캣에 의해 값이 채워진다
// 호출마다 request/response가 달라진다 => 초기화
import java.util.List;
import java.sql.*;
public class GoodsDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final static String URL="jdbc:oracle:thin:@localhost:1521:XE";
	private static GoodsDAO dao;
	private final static int ROWSIZE=12;
	
	public GoodsDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	// 싱글턴 => new를 사용하지 않고 재사용 가능 => 메모리 절약
	public static GoodsDAO newInstance() {
		if(dao==null) dao=new GoodsDAO();
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
	
	
	// javascript => jquery => ajax => vuejs => vuex => pinia
	// reactjs => redux => tanstack-query(typescript) => nodejs
	// nextjs
	public List<GoodsVO> goodsAllData(int page) {
		List<GoodsVO> list = new ArrayList<GoodsVO>();
		try {
			getConnection();
			String sql="SELECT no, goods_name, goods_price, goods_discount, "
					+ "goods_first_price, goods_poster, hit "
					+ "FROM goods_all "
					+ "ORDER BY no ASC "
					+ "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
			ps=conn.prepareStatement(sql);
			int start=(page*ROWSIZE)-ROWSIZE;
			ps.setInt(1, start);
			ps.setInt(2, ROWSIZE);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				GoodsVO vo = new GoodsVO();
				vo.setNo(rs.getInt(1));
				vo.setGoods_name(rs.getString(2));
				vo.setGoods_price(rs.getString(3));
				vo.setGoods_discount(rs.getInt(4));
				vo.setGoods_first_price(rs.getString(5));
				vo.setGoods_poster(rs.getString(6));
				vo.setHit(rs.getInt(7));
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
	
	// 총 페이지 수
	public int goodsTotalPage() {
		int total = 0;
		try {
			getConnection();
			String sql="SELECT CEIL(COUNT(*)/?) FROM goods_all";
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
	 GOODS_NAME                                NOT NULL VARCHAR2(1000)
	 GOODS_SUB                                          VARCHAR2(1000)
	 GOODS_PRICE                               NOT NULL VARCHAR2(50)
	 GOODS_DISCOUNT                                     NUMBER
	 GOODS_FIRST_PRICE                                  VARCHAR2(20)
	 GOODS_DELIVERY                            NOT NULL VARCHAR2(20)
	 GOODS_POSTER                                       VARCHAR2(260)
	 HIT                                                NUMBER
	 */
	
	public GoodsVO goodsDetailData(int no) {
		GoodsVO vo = new GoodsVO();
		try {
			getConnection();
			String sql="UPDATE goods_all SET hit=hit+1 WHERE no="+no;
			ps=conn.prepareStatement(sql);
			ps.executeUpdate();
			sql="SELECT no, goods_name, goods_sub, goods_price, goods_discount, "
					+ "goods_first_price, goods_delivery, goods_poster, hit "
					+ "FROM goods_all "
					+ "WHERE no="+no;
			ps=conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setGoods_name(rs.getString(2));
			vo.setGoods_sub(rs.getString(3));
			vo.setGoods_price(rs.getString(4));
			vo.setGoods_discount(rs.getInt(5));
			vo.setGoods_first_price(rs.getString(6));
			vo.setGoods_delivery(rs.getString(7));
			vo.setGoods_poster(rs.getString(8));
			vo.setHit(rs.getInt(9));
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return vo;
	}
	
} 
