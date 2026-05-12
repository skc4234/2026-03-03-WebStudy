package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.vo.*;
// 브라우저에 출력 => HTML
// 자바 => 오라클+브라우저 연결을 가능하게 해줌
// 오라클 => 데이터 저장소
public class EmpDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	private static final int ROWSIZE = 20;
	private static EmpDAO dao = null;
	private static EmpDAO newInstance() {
		if(dao==null) dao=new EmpDAO();
		return dao;
	}
	public EmpDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(URL,"hr","happy");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	public void disConnection() {
		try {
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	// 기능
	/*
	 EMPNO                                     NOT NULL NUMBER
 ENAME                                     NOT NULL VARCHAR2(50)
 JOB                                       NOT NULL VARCHAR2(50)
 HIREDATE                                  NOT NULL DATE
 SAL                                       NOT NULL NUMBER(10,2)
 DEPTNO                                    NOT NULL NUMBER
 ISADMIN                                            CHAR(1)
	 */
	public List<EmpVO> empListData() {
		List<EmpVO> list = new ArrayList<EmpVO>();
		try {
			getConnection();
			String sql = "SELECT empno, ename, job, TO_CHAR(hiredate,'YYYY-MM-DD'), sal, deptno, isadmin "
					+ "FROM emp2 "
					+ "ORDER BY empno ASC";
					//+ "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
			ps = conn.prepareStatement(sql);
			//ps.setInt(1, (page*ROWSIZE)-ROWSIZE);
			//ps.setInt(2, ROWSIZE);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				EmpVO vo = new EmpVO();
				vo.setEmpno(rs.getInt(1));
				vo.setEname(rs.getString(2));
				vo.setJob(rs.getString(3));
				vo.setDbday(rs.getString(4));
				vo.setSal(rs.getInt(5));
				vo.setDeptno(rs.getInt(6));
				vo.setIsadmin(rs.getString(7));
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
	
	public int totalPage() {
		int total = 0;
		try {
			getConnection();
			String sql = "SELECT CEIL(COUNT(*)/?) FROM emp2";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, ROWSIZE);
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
	
	public static void main(String[] args) {
		EmpDAO dao = EmpDAO.newInstance();
		List<EmpVO> list = dao.empListData();
		for(EmpVO vo : list) {
			System.out.println(vo.getEmpno()+". "+vo.getEname()+" "+vo.getDbday()+" "+vo.getSal());
		}
	}
}
