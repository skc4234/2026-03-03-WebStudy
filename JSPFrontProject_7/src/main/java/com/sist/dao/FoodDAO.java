package com.sist.dao;
/*
 * 	 food/list.do
 * 		 | => @WebServlet("*.do")
 * 	 DispatcherServlet : 모든 요청을 받아서 Model을 찾아주는 역할
 * 		 |
 * 	 Model에서 메소드를 찾는다 => 메소드 수행 => 결과값을 JSP에 전송
 * 		 |
 * 	    1. 결과값 request로 전송 : return "../main/main.jsp"
 * 		2. request를 초기화해서 화면 이동 : return "redirect:list.do"
 * 	    3. Ajax를 이용한 방식 : void => JSON
 * 	- Model 클래스 전체를 찾는다 : Singletone, Factory 패턴
 * 	- 클래스 메모리 할당: @Autowried
 */
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
	
	// 3. 검색
/*
<select id="foodFindData" resultType="FoodVO" parameterType="hashmap">
	SELECT no,name,poster,address
	FROM food
	WHERE ${column} LIKE '%'||#{fd}||'%'
	ORDER BY no ASC
	OFFSET #{start} ROWS FETCH NEXT 12 ROWS ONLY
</select>
*/
	public static List<FoodVO> foodFindData(Map map) {
		SqlSession session=ssf.openSession();
		List<FoodVO> list=session.selectList("foodFindData",map);
		if(session!=null) session.close();
		return list;
	}
	
	// 3-1. 검색리스트 총페이지
	/*
	<select id="foodFindTotalPage" resultType="int" parameterType="hashmap">
		SELECT CEIL(COUNT(*)/12.0) FROM food WHERE ${column} LIKE '%'||#{fd}||'%'
	</select>
	 */
	public static int foodFindTotalPage(Map map) {
		SqlSession session=ssf.openSession();
		int total=session.selectOne("foodFindTotalPage",map);
		if(session!=null) session.close();
		return total;
	}
}
