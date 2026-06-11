package com.sist.dao;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.FoodVO;

public class FoodDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf=new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 1. 목록 출력
	/*
	<select id="foodListData" resultType="FoodVO" parameterType="int">
		SELECT no,name,poster
		FROM food
		ORDER BY no ASC
		OFFSET #{start} ROWS FETCH NEXT 12 ROWS ONLY
	</select>
	 */
	public static List<FoodVO> foodListData(int start) {
		List<FoodVO> list = new ArrayList<FoodVO>();
		SqlSession session = null;
		try {
			session=ssf.openSession();
			list=session.selectList("foodListData",start);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return list;
	}
	
	public static int foodTotalPage() {
		SqlSession session=ssf.openSession();
		int total=session.selectOne("foodTotalPage");
		if(session!=null) session.close();
		return total;
	}
	
	public static FoodVO foodDetailData(int no) {
		FoodVO vo=new FoodVO();
		SqlSession session=ssf.openSession();
		vo=session.selectOne("foodDetailData",no);
		if(session!=null) session.close();
		return vo;
	}
	
}
