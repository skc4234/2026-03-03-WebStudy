package com.sist.dao;

import java.util.*;
import java.sql.*;
// DBCP
import javax.sql.*;

import com.sist.vo.MemberVO;

import javax.naming.*;
/*
 * 	MyBatis
 * 1. XML 기반
 * 	---------> XML 파싱 => Spring 구조
 * 2. Annotation 기반 => Spring
 * 
 * 	JQuery : 데이터 읽기 => JSON
 * 	
 * 	크롤링: 오라클
 * JSoup / 셀레니움 / PlayWeight
 * Vue/React/Ajax => 크롤링 불가능
 * 
 * 
 * 기초
 * 	자바/오라클/HTML/CSS/JavaScript/JSP
 * 	이외에는 라이브러리 활용 => 실제 사이트 구축
 * 
 *  DBCP : DataBase ConnectionPool
 *  	- 데이터베이스 연결 시에 가장 시간이 걸림
 *  	=> 연결 시간을 줄이기 위해서 미리 연결해둔 상태
 * 		- MyBatis 설정
 *	사용법
 *		- server.xml에 등록 => 톰캣이 실행
 * 		- 저장된 Connection 주소 읽기
 * 		- JDNI => 가상 탐색기 형식
 * 			- java://comp/env/ => c:\\
 * 		- Connection 주소 대입
 * 			- conn = ds.getConnection()
 * 		- getConnection / disConnection
 * 
 * 		사용하지 않음 => 유지보수
 * 		SpringBoot + ThymeLeaf + Vue(Pinia) + MyBatis
 * 		SpringBoot+NodeJS+React+JPA
 * 
 */
public class MemberDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static MemberDAO dao;
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
	public static MemberDAO newInstance() {
		if(dao==null) dao=new MemberDAO();
		return dao;
	}
	
	// 기능
	public MemberVO memberLogin(String id, String pwd) {
		MemberVO vo = new MemberVO();
		try {
			getConnection();
			String sql="SELECT COUNT(*) FROM member "
					+ "WHERE id=?";
			ps=conn.prepareStatement(sql);
			// ? 에 값을 채운다 => sql Injection 방지
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			rs.close();
			if(count==0) {
				vo.setMsg("NOID");
			}
			else {
				sql = "SELECT id,name,pwd,isadmin,post,addr1,addr2,phone "
						+ "FROM member "
						+ "WHERE id =?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, id);
				rs=ps.executeQuery();
				rs.next();
				String mid=rs.getString(1);
				String name = rs.getString(2);
				String db_pwd=rs.getString(3);
				String isadmin = rs.getString(4);
				String post = rs.getString(5);
				String addr1=rs.getString(6);
				String addr2=rs.getString(7);
				String phone=rs.getString(8);
				if(pwd.equals(db_pwd)) {
					// 로그인 성공
					vo.setId(mid);
					vo.setName(name);
					vo.setIsadmin(isadmin);
					vo.setPost(post);
					vo.setAddr1(addr1);
					vo.setAddr2(addr2);
					vo.setPhone(phone);
					vo.setMsg("OK");
				}
				else {
					// 비밀번호 틀린 경우
					vo.setMsg("NOPWD");
				}
				rs.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return vo;
	}
	
}
