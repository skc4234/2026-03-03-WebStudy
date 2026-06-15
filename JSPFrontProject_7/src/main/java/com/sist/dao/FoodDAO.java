package com.sist.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
import com.sist.commons.*;
public class FoodDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	// 기능
	/*
<select id="foodListData" resultType="FoodVO" parameterType="int">
	SELECT no,name,poster,address
	FROM food
	ORDER BY no ASC
	OFFSET #{start} ROWS FETCH NEXT 12 ROWS ONLY
</select>
<select id="foodTotalPage" resultType="int">
	SELECT CEIL(COUNT(*)/12.0) FROM food
</select>
<select id="foodDetailData" resultType="FoodVO" parameterType="int">
	SELECT * FROM food WHERE no=#{no}
</select>
	 */
	// 1. 목록 출력
	public static List<FoodVO> foodListData(int start) {
		SqlSession session=ssf.openSession();
		List<FoodVO> list=session.selectList("foodListData",start);
		if(session!=null) session.close();
		return list;
	}
	
	// 1-1. 총페이지
	public static int foodTotalPage() {
		SqlSession session=ssf.openSession();
		int total=session.selectOne("foodTotalPage");
		if(session!=null) session.close();
		return total;
	}
	
	// 2. 상세보기
	public static FoodVO foodDetailData(int no) {
		SqlSession session=ssf.openSession();
		FoodVO vo=session.selectOne("foodDetailData",no);
		if(session!=null) session.close();
		return vo;
	}
}
