package com.sist.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.*;
import com.sist.vo.*;
public class FoodDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	// 기능
	// 1. 목록출력
/*
 <select id="foodListData" resultType="FoodVO" parameterType="int">
 	SELECT no,name,poster,address,phone,likecount,replycount,theme,content
 	FROM food
 	ORDER BY no ASC
 	OFFSET #{start} ROWS FETCH NEXT 12 ROWS ONLY
 </select>
 */
	public static List<FoodVO> foodListData(int start) {
		// 1. 연결
		SqlSession session=ssf.openSession();
		
		// 2. SQL문장 실행 => 결과값 받기
		List<FoodVO> list=session.selectList("foodListData",start);
		
		// 3. Session 닫기 => Connection 반환
		if(session!=null) session.close();
		
		return list;
	}
	
	// 1-1. 총페이지
/*
 <select id="foodTotalPage" resultType="int">
 	SELECT CEIL(COUNT(*)/12.0) FROM food
 </select>
 */
	public static int foodTotalPage() {
		SqlSession session=ssf.openSession();
		int total=session.selectOne("foodTotalPage");
		if(session!=null) session.close();
		return total;
	}

	// 2. 상세보기
/*
 <!-- 1. 조회수 증가 -->
 <update id="foodHitIncrement" parameterType="int">
 	UPDATE SET food hit=hit+1 WHERE no=#{no}
 </update>
 <!-- 2. 상세보기 데이터 출력 -->
 <select id="foodDetailData" resultType="FoodVO" parameterType="int">
 	SELECT *
 	FROM food
 	WHERE no=#{no}
 </select>
 */
	public static FoodVO foodDetailData(int no){
		SqlSession session=ssf.openSession(true);
		session.update("foodHitIncrement",no);
		FoodVO vo=session.selectOne("foodDetailData",no);
		if(session!=null) session.close();
		return vo;
	}
	

	// 3. 근처 맛집
/*
 <!-- 3. 근처 맛집 -->
 <select id="foodRearData" resultType="FoodVO" parameterType="string">
 	SELECT no,name,poster,address,rownum
 	FROM food
 	WHERE address LIKE '%'||#{address}||'%'
 	AND rownum&lt;=7
 </select>
 */
	public static List<FoodVO> foodRearData(String address) {
		SqlSession session=ssf.openSession();
		List<FoodVO> list=session.selectList("foodRearData",address);
		if(session!=null) session.close();
		
		return list;
	}
	
	
	// 4. 카테고리 선택
/*
 <select id="foodCategoryData" resultType="FoodVO" parameterType="string">
 	SELECT no,name,poster
 	FROM food
 	WHERE type LIKE '%'||${type}||'%'
 	ORDER BY no ASC
 </select>
 */
	public static List<FoodVO> foodCategoryData(String type){
		SqlSession session=ssf.openSession();
		List<FoodVO> list=session.selectList("foodCategoryData",type);
		if(session!=null) session.close();
		return list;
	}
}
