package com.sist.dao;

import java.util.*;
import java.sql.*;
/*import javax.sql.*;
import javax.naming.*;*/
public class MusicDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	private static final int ROWSIZE = 20;
	private static MusicDAO dao;
	
	public static MusicDAO newInstance() {
		if(dao==null) dao=new MusicDAO();
		return dao;
	}
	
	// 드라이버 등록
	public MusicDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(URL,"hr","happy");
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
	// 목록 출력
	public List<MusicVO> musicListData(int page) {
		List<MusicVO> list = new ArrayList<MusicVO>();
		try {
			getConnection();
			String sql="SELECT no,title,singer,album,poster,state,idcrement "
					+ "FROM genie_music "
					+ "WHERE cno=1 "
					+ "ORDER BY no ASC "
					+ "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
			ps=conn.prepareStatement(sql);
			int start=(page*ROWSIZE)-ROWSIZE;
			ps.setInt(1, start);
			ps.setInt(2, ROWSIZE);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				MusicVO vo = new MusicVO();
				vo.setNo(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setSinger(rs.getString(3));
				vo.setAlbum(rs.getString(4));
				vo.setPoster(rs.getString(5));
				vo.setState(rs.getString(6));
				vo.setIdcrement(rs.getInt(7));
				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace(); // 테스트 방법 => JUnit(단위 테스트)
		} finally {
			disConnection();
		}
		return list;
	}
	
	// 총 페이지 수
	public int musicTotalPage() {
		int total=0;
		try {
			getConnection();
			String sql="SELECT CEIL(COUNT(*)/?) FROM genie_music WHERE cno=1";
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
}
