package com.sist.dao;

import java.io.*;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
public class MusicDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf=new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/*
	 *    - 동적 쿼리 : 다중조건(검색필터)
	 *    - 
	 *    - '<' 기호는 mapper에서 오류 ==> &lt; 사용
	 */
	
	// 기능
	public static List<MusicVO> musicListData() {
		List<MusicVO> list = new ArrayList<MusicVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("musicListData");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return list;
	}
}
