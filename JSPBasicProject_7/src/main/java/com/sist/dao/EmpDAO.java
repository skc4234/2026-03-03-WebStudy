package com.sist.dao;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import javax.sql.*; // DataSource : 데이터베이스 정보를 가지고 있음
import javax.naming.*; // Context : 이름으로 객체를 생성
// 이름으로 객체를 찾는 경우 : lookup("mydb") => 객체를 찾는다
// JNDI : Java Naming Directory Interface
// Pool : 메모리 공간 => java://comp/env/  => c:\\
// DBCP는 웹에서만 사용 가능 => Tomcat이 관리하기 때문
public class EmpDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static EmpDAO dao;
	
	// 미리 생성된 Connection 객체의 주소값 얻기
	public void getConnection() {
		try {
			// 가상 탐색기 형식으로 저장(JNDI)
			// 1. 탐색기를 연다
			Context init = new InitialContext();
			// 2. C드라이브를 연다
			Context c = (Context)init.lookup("java://comp/env/"); // Connection 객체가 들어있음
			// 3. 해당 파일을 얻는다
			DataSource ds = (DataSource)c.lookup("jdbc/oracle");
			// 4. Connection 객체 저장
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 재사용을 위해 Pool로 반환
	public void disConnection() {
		try {
			if(ps!=null) ps.close();
			if(conn!=null) conn.close(); // close가 아닌 반환
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 싱글턴
	public static EmpDAO newInstance() {
		if(dao==null) dao=new EmpDAO();
		return dao;
	}
	
	// 기능
	public List<EmpBean> empListData() {
		List<EmpBean> list = new ArrayList<EmpBean>();
		try {
			// 주소값 얻기
			getConnection();
			String sql = "SELECT empno, ename, job, TO_CHAR(hiredate, 'YYYY-MM-DD'), sal "
					+ "FROM emp "
					+ "ORDER BY empno ASC";
			ps=conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				EmpBean b = new EmpBean();
				b.setEmpno(rs.getInt(1));
				b.setEname(rs.getString(2));
				b.setJob(rs.getString(3));
				b.setDbday(rs.getString(4));
				b.setSal(rs.getInt(5));
				list.add(b);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return list;
	}
}
