package com.sist.dao;

/*
 * 	데이터베이스 연동
 * JDBC => DBCP => ORM(데이터베이스 처리하는 라이브러리 집합, MyBatis, JPA 등)
 * 
 *	MyBatis(3버전) => 오픈소스 라이브러리
 *		1. 특징	
 *			- SQL 작성 => MyBatis로 전송(SQL에 맞게 자동으로 처리(연결, 전송, 실행, 결과값 담기))
 *			- XML 파일에 설정값(sql문장, vo설정, 매개변수 값 채우기 등) 등록 후 사용
 * 
 *  	2. 동작 구조
 *  		- Config.xml => Connection => 한개만 설정
 *  		- mapper.xml => PreparedStatement / ResultSet => 테이블 당 하나 생성
 *  				=> SQL 문장 들어갈 파일
 *  		- 동작
 *  			1. Config.xml을 이용해서 getConnection() / desConnection(0
 *  			2. mapper를 읽어서 JDBC 이용해서 처리
 *  
 *  	3. 장점
 *  		- SQL문장 직접 제어 => 개발자
 * 			- 성능 최적화 => 튜닝
 * 			- 복장한 SQL 문장 제어
 * 	
 * 		4. 단점
 * 			- SQL문장 직접 제작 => JPA에서는 SQL문장 자동화
 * 			- DB 변경 시 수정해야함
 * 			- 객체 지향 ORM이 약하다
 * 	
 *		---------------------------
 *  
 *  SQL 문장은 동일 / 동적 쿼리(다중 검색) / #{} : ?에 값 채우기 / ${}:''없이 처리 => table명, column명
 *  
 *  - mapper.xml
 *  	- resultType : 결과값 담기(ResultSet) => return 타입 설정
 *  	- parameterType : ?에 값이 들어간다 => ? 들어올 값 타입 설정
 *  		1. ?가 여러개인 경우 => VO로 묶어서 넣기
 *  		2. VO에 없는 변수 여러개 => Map
 *  
 *  - DAO에서 사용하는 클래스
 *	  	- SessionFactory : SqlSession 생성 / XMl 파싱
 *			=> Config.xml파일을 읽어서 Connection을 생성한다
 *  	- SqlSession : PreparedStatement / ResultSet 담당
 *  		=> SessionFactory ssf.openSession() => getConnection()
 *  		- SqlSession session 메소드 정리
 *  			- selectList : 반환값이 List형일때
 *  			- selectOne : 반환값이 객체거나 데이터형일때
 *  			- update(), insert(), delete() => DML에 따라 사용
 *  
 */
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.DataBoardVO;

import java.io.*;
public class DataBoardDAO {
	// 1. XML 파싱
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			// classpath 영역(src/main/java)에 파일 저장 => 경로명 없이 파일명만 사용 가능
			ssf=new SqlSessionFactoryBuilder().build(reader);
			/*
			 *  map.put("id","sql")
			 *  map1.put("id","resultType")
			 *  map2.put("id","parameterType")
			 * 
			 */
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 2. 기능
	public static List<DataBoardVO> databoardListData(int start) {
		List<DataBoardVO> list = new ArrayList<DataBoardVO>();
		SqlSession session = null;
		try {
			session=ssf.openSession();
			list = session.selectList("databoardListData", start);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return list;
	}
	
	public static int databoardTotalPage() {
		int total = 0;
		SqlSession session = null;
		try {
			session=ssf.openSession();
			total = session.selectOne("databoardTotalPage");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return total;
	}
	
	// 데이터 추가
	/*
	 * <insert id="databoardInsert" parameterType="DataBoardVO">
		<!-- 
		#{name} == vo.getName()
		 -->
		INSERT INTO mvcDataBoard VALUES(
			mdb_no_seq.nextval,
			#{name},
			#{subject},
			#{content},
			#{pwd},
			SYSDATE,
			0,
			#{filename},
			#{filesize}
		)
	</insert>
	 * 
	 */
	// 1. 파일명 중복 처리
	// 2. 여러 파일 동시에 업로드
	// 3. 
	
	public static void databoardInsert(DataBoardVO vo) {
		SqlSession session = null;
		try {
			session = ssf.openSession(true); // ssf.openSession() => conn.setAutoCommit(false)
			session.insert("databoardInsert",vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null)
				session.close();
		}
		
	}
	
	/*
	 *  selectOne() => 1 ROW (상세보기, 총페이지)
	 *  selectList() => 다중 ROW (목록)
	 *  update(), insert(), delete()
	 * 
	 */
	
	
	// 상세보기
	/*
	 * <!-- 상세보기 -->
	<!-- 조회수 증가 -->
	<update id="hitIncrement" parameterType="int">
		UPDATE mvcDataBoard SET hit=hit+1
		<include refid="where-no" />
	</update>
	<!-- 실제 데이터 읽기 -->
	<select id="dataBoardDetailData" parameterType="int" resultType="DataBoardVO">
		SELECT no,name,subject,content,hit,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,filesize,filename 
		FROM mvcDataBoard 
		<include refid="where-no" />
	</select>
	 */
	public static DataBoardVO dataBoardDetailData(int no) {
		DataBoardVO vo = new DataBoardVO();
		SqlSession session = null; // PreparedStatement+ResultSet
		try {
			session = ssf.openSession();
			session.update("hitIncrement", no);
			session.commit();
			vo=session.selectOne("dataBoardDetailData", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return vo;
	}
}
