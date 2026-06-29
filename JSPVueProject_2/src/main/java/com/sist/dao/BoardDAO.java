package com.sist.dao;

import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.*;
import com.sist.vo.*;

public class BoardDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			// 프레임워크 => xml 자동 파싱
			Reader reader=Resources.getResourceAsReader("Config.xml");
			ssf=new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 기능
	// 1. 목록 출력
	/*
	<select id="boardListData" resultType="BoardVO" parameterType="int">
		SELECT no,name,subject,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,hit
		FROM jspboard
		ORDER BY no DESC
		OFFSET #{start} ROWS FETCH NEXT 12 ROWS ONLY
	</select>
	*/
	public static List<BoardVO> boardListData(int start) {
		SqlSession session=ssf.openSession();
		List<BoardVO> list=session.selectList("boardListData",start);
		session.close();
		return list;
	}
	
	// 1-1. 목록 총 개수 출력
	/*
	<select id="boardRowCount" resultType="int">
		SELECT COUNT(*) FROM jspboard
	</select>
	 */
	public static int boardRowCount() {
		SqlSession session=ssf.openSession();
		int count=session.selectOne("boardRowCount");
		session.close();
		return count;
	}
	
	// 2. 글쓰기
	/*
	<insert id="boardInsert" parameterType="BoardVO">
		<!-- 자동 증가 번호(squence 없을때) -->
		<selectKey keyProperty="no" resultType="int" order="BEFORE">
			SELECT NVL(MAX(no)+1,1) as no FROM jspboard
		</selectKey>
		<!-- #{}: '', ${}: 일반 문자열(column명, table명) -->
		INSERT INTO jspboard VALUES(#{no},#{name},#{subject},#{content},#{pwd},SYSDATE,0)
	</insert>
	 */
	public static void boardInsert(BoardVO vo) {
		SqlSession session=ssf.openSession(true); // commit
		session.insert("boardInsert",vo);
		session.close();
	}
	
	// 3. 상세보기
	/*
	<update id="hitIncrement" parameterType="int">
		UPDATE jspboard SET hit=hit+1 WHERE no=#{no}
	</update>
	<select id="boardDetailData" resultType="BoardVO" parameterType="int">
		SELECT * FROM jspboard WHERE no=#{no}
	</select>
	 */
	public static BoardVO boardDetailData(int no) {
		SqlSession session=ssf.openSession(true);
		session.update("hitIncrement",no);
		BoardVO vo=session.selectOne("boardDetailData",no);
		session.close();
		return vo;
	}
	
	// 4. 게시물 삭제
	/*
	<select id="boardGetPassword" resultType="string" parameterType="int">
		SELECT pwd FROM jspboard WHERE no=#{no}
	</select>
	<delete id="boardDelete" parameterType="int">
		DELETE FROM jspboard WHERE no=#{no}
	</delete>
	 */
	// Spring에서는 password 리턴 => service에서 처리
	public static boolean boardDelete(int no, String pwd) {
		boolean bCheck=false;
		// autocommit(false) => 트랜잭션
		SqlSession session=ssf.openSession(true); // insert/update/delete
		String dbpwd=session.selectOne("boardGetPassword",no);
		if(dbpwd.equals(pwd)) {
			session.delete("boardDelete",no);
			bCheck=true;
		}
		session.close();
		return bCheck;
	}
	
	// primary key => 중복x
	// <태그 id=""> => 중복x => MyBatis/Spring(클래스 관리자 => 클래스 찾기)
	// Annotation
	// 5. 수정
	// 5-1. 이전 데이터 출력
	public static BoardVO boardUpdateData(int no) {
		SqlSession session=ssf.openSession();
		BoardVO vo=session.selectOne("boardDetailData",no);
		session.close();
		return vo;
	}
	
	// 5-2. 비밀번호 비교 후 수정
	/*
	<update id="boardUpdate" parameterType="BoardVO">
		UPDATE jspboard SET
		name=#{name},subject=#{subject},content=${content}
		WHERE no=#{no}
	</update>
	 */
	// mapper에 있는 SQL문장 재사용 가능
	public static boolean boardUpdate(BoardVO vo) {
		boolean bCheck=false;
		// autocommit(false) => 트랜잭션
		SqlSession session=ssf.openSession(true); // insert/update/delete
		String dbpwd=session.selectOne("boardGetPassword",vo.getNo());
		if(dbpwd.equals(vo.getPwd())) {
			session.update("boardUpdate",vo);
			bCheck=true;
		}
		session.close();
		return bCheck;
	}
}
