package com.sist.commons;

import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
public class DBCPUtil {
	private Connection conn;
	public Connection getConnection() {
		// dao는 하나의 Connection만 사용하게 함
		try {
			Context init = new InitialContext();
			Context c = (Context)init.lookup("java://comp/env");
			DataSource ds = (DataSource)c.lookup("jdbc/oracle");
			conn=ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public void disConnection(Connection conn, PreparedStatement ps) {
		try {
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
