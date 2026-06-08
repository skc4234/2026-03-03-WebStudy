package com.sist.dao;

import java.io.*;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
public class EmpDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			// XML 파싱
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf=new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// MyBatis : CRUD
	/*
	 * 	List : selectList()
	 * 	VO : selectOne()
	 * 
	 * 	- 동적 쿼리
	 * 	<if> <forEach> <where> <choose> <trim> : 다중 검색
	 * 
	 * 	- Annotation 사용
	 * 	- MyBatis의 단점 : SQL 문장을 한번에 하나만 처리
	 * 	- 여러개 처리
	 * 		<select>
	 * 			BEGIN
	 * 			{}
	 * 			END
	 * 		</select>
	 */
	
	public static List<EmpVO> empListData() {
		List<EmpVO> list = new ArrayList<EmpVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("empListData");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return list;
	}
}
