package com.sist.dao;
import java.io.Reader;
/*
 * 	  MyBatis
 * 		- Config.xml : Connection
 * 		- mapper.xml : SQL문장 => PreparedStatement, ResultSet
 * 		- VO : 한 개의 정보 저장하는 단위 
 * 		- DAO : XML + 자바 연결
 * 		==> 분업 가능
 */
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.*;

public class FoodDAO {
	// XML 데이터를 읽는 클래스 => SqlSessionFactory
	private static SqlSessionFactory ssf;
	
	// XML 파싱 => 초기화 블록 => 자동 호출 / 상속 예외
	static {
		try {
			// XML 읽기 => Config.xml에 모든 XML 정보가 담겨있다
			Reader reader = Resources.getResourceAsReader("Config.xml");
			// XML 파싱(필요한 데이터 저장)
			ssf=new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 기능
	
	/*
	 <!--  1. 맛집 리스트 출력 -->
	<select id="foodListData" parameterType="int" resultType="FoodVO">
	 SELECT no,name,poster,address
	 FROM food
	 ORDER BY no ASC
	 OFFSET #{start} ROWS FETCH NEXT 12 ROWS ONLY
	</select>
	 */
	// 목록
	public static List<FoodVO> foodListData(int start) {
		List<FoodVO> list = new ArrayList<FoodVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("foodListData", start);
		} catch (Exception e) {
			e.printStackTrace(); // XML의 SQL문장 에러
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
	
	// 총 페이지 수
	public static int foodTotalPage() {
		int total=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			total=session.selectOne("foodTotalPage");
		} catch (Exception e) {
			e.printStackTrace(); // XML의 SQL문장 에러
		} finally {
			if(session!=null) session.close();
		}
		return total;
	}
	
	
	
	/*
	<select id="foodDetailData" parameterType="int" resultType="FoodVO">
		SELECT *
		FROM food
		WHERE no=#{no}
	</select>
	 */
	// 상세보기
	public static FoodVO foodDetailData(int no) {
		FoodVO vo = new FoodVO();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			vo=session.selectOne("foodDetailData",no);
		} catch (Exception e) {
			e.printStackTrace(); // XML의 SQL문장 에러
		} finally {
			if(session!=null) session.close();
		}
		return vo;
	}
}
