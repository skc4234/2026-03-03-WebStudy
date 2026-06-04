package com.sist.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.*;
import com.sist.vo.*;
public class FoodDAO {
	private static SqlSessionFactory ssf;
	static {
		// 공통 => 반복 제거 
		ssf=CreateSqlSessionFactory.getSsf();
	}
	// 기능
	// 1. 목록
	public static List<FoodVO> foodListData(int start) {
		// 매개변수 : parameterType, 리턴형 : resultType
		SqlSession session=null;
		List<FoodVO> list = new ArrayList<FoodVO>();
		try {
			session=ssf.openSession();
			// 값이 여러개 => selectList / 값이 하나 => selectOne
			list=session.selectList("foodListData",start);
		} catch (Exception e) {
			// MyBatis의 단점 : 에러 위치 찾기 힘듦 => XML오류가 대부분
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return list;
	}
	
	/*
	<select id="foodTotalPage" resultType="int">
		SELECT CEIL(COUNT(*)/12.0) FROM food
	</select>
	 */
	// 1-1. 총페이지
	public static int foodTotalPage() {
		int total=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			total=session.selectOne("foodTotalPage");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return total;
	}
	
	/*
	<select id="foodDetailData" resultType="FoodVO" parameterType="int">
		SELECT *
		FROM food
		WHERE no=#{no}
	</select>
	 */
	// 2. 상세보기
	public static FoodVO foodDetailData(int no) {
		FoodVO vo = new FoodVO();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			vo=session.selectOne("foodDetailData",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return vo;
	}
}
