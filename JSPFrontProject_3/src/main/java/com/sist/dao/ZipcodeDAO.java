package com.sist.dao;

import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.*;
public class ZipcodeDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf=new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 기능
	/*
<select id="postFind" resultType="ZipcodeVO" parameterType="String">
	SELECT zipcode,sido,gugun,dong,NVL(bunji,' ') as bunji
	FROM zipcode
	WHERE dong LIKE '%'||#{dong}||'%'
</select>
	 */
	public static List<ZipcodeVO> postFind(String dong) {
		List<ZipcodeVO> list = new ArrayList<ZipcodeVO>();
		SqlSession session = null;
		try {
			session=ssf.openSession();
			list=session.selectList("postFind",dong);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return list;
	}
	
	/*
<select id="postFindCount" resultType="int" parameterType="String">
	SELECT COUNT(*)
	FROM zipcode
	WHERE dong LIKE '%'||#{dong}||'%'
</select>
	 */
	public static int postFindCount(String dong) {
		int count=0;
		SqlSession session = null;
		try {
			session=ssf.openSession();
			count=session.selectOne("postFindCount",dong);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return count;
	}
}
