package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
import com.sist.commons.*;
/*
 *   	SQL(오라클)
 *   		|
 *   --------------------------------
 *   |		|		|		|		|
 *  DQL	   DML     DDL     DCL     TCL
 * SELECT INSERT  CREATE  GRANT    COMMIT 
 *        UPDATE  ALTER   REVOKE   ROLLBACK
 *        DELTET  DROP             SAVEPOINT
 *                TRUNCATE
 *                RENAME
 * 
 *    1. SELECT : 데이터 검색
 *    	=> SELECT column
 *    	   FROM table/view
 *    	   [WHERE,GROUP BY,HAVING,ORDER BY]
 * 		- 실행순서: FROM-WHERE-GROUP BY-HAVING-SELECT-ORDER BY
 * 		- *JOIN/SubQuery => 가장 많이 사용
 * 			- INNER JOIN: EQUI JOIN
 * 				- SELECT A.col B.col FROM A JOIN B WHERE A.col = B.col
 * 			- OUTER JOIN
 * 				- LEFT OUTER JOIN
 * 					- SELECT A.col B.col FROM A JOIN B WHERE A.col = B.col(+)
 * 					- SELECT A.col B.col FROM A LEFT OUTER JOIN B WHERE A.col = B.col
 * 				- RIGHT OUTER JOIN
 * 					- SELECT A.col B.col FROM A JOIN B WHERE A.col(+) = B.col
 * 					- SELECT A.col B.col FROM A RIGHT OUTER JOIN B WHERE A.col = B.col
 * 	    	- SubQuery
 * 				- 인라인 뷰 : FROM 절에서 서브쿼리 사용 => Table 대체
 * 					- SELECT * FROM (SELECT * FROM ~)
 * 				- 스칼라 서브쿼리 : SELECT 절에서 사용 => Column 대체
 * 					- SELECT (SELECT * FROM ~) FROM
 * 		- 복잡한 쿼리 => View/Function으로 제어
 * 		- 공통으로 사용되는 부분: 댓글, 좋아요, 찜하기
 * 			=> *PROCEDURE 사용
 * 		- 다른 테이블과 연결: TRIGGER
 * 
 *    2. INSERT: 데이터 추가
 *    	- INSERT INTO table VALUES(전체 column) => 전체 값 지정(DEFAULT 적용 X)
 *    	- INSERT INTO table(컬럼1, 컬럼2) VALUES(값1, 값2) => 지정된 컬럼만
 *    	- VARCHAR2, CLOB => '' 사용
 *    	- 오늘 날짜 => SYSDATE
 *    	- 예약일 => 'yy/mm/dd', VARCHAR2
 *    3. UPDATE: 데이터 수정
 *    	- UPDATE table SET 컬럼=값,... (WHERE 조건) => 없을 시 전체 적용
 *    4. DELETE: 데이터 삭제
 *    	- DELETE FROM table (WHERE 조건) => 없을 시 전체 삭제
 *   ====> INSERT/UPDATE/DELETE는 COMMIT 필요
 *   ==========================================
 *    - DDL
 *    	1. 
 * 
 */ 
public class DataBoardDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	// 기능
	// 1. 목록 출력
/*
<select id="boardListData" resultType="DataBoardVO" parameterType="int">
	SELECT no,subject,name,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,hit
	FROM mvcdataboard
	ORDER BY no DESC
	OFFSET #{start} ROWS FETCH NEXT 10 ROWS ONLY
</select>
*/
	public static List<DataBoardVO> boardListData(int start) {
		SqlSession session=ssf.openSession();
		List<DataBoardVO> list=session.selectList("boardListData", start);
		session.close();
		return list;
	}
	
	// 1-1. 총 게시물 수
/*
<select id="boardRowCount" resultType="int">
	SELECT COUNT(*) FROM mvcdataboard
</select>
 */
	public static int boardRowCount() {
		SqlSession session=ssf.openSession();
		int count=session.selectOne("boardRowCount");
		session.close();
		return count;
	}
	
	// 2. 게시물 추가
/*
<insert id="boardInsert" parameterType="DataBoardVO">
	<!-- SEQUENCE -->
	<selectKey keyProperty="no" resultType="int" order="BEFORE">
		SELECT NVL(MAX(no)+1,1) as no FROM mvcdataboard
	</selectKey>
		INSERT INTO mvcdataboard(no,name,subject,content,pwd,filename,filesize)
		VALUES(#{no},#{name},#{subject},#{content},#{pwd},#{filename},#{filesize})
</insert>
 */
	public static void boardInsert(DataBoardVO vo) {
		SqlSession session=ssf.openSession(true);
		session.insert("boardInsert",vo);
		session.close();
	}
	
	// 게시물 수정
/*
<select id="boardGetPassword" resultType="string" parameterType="int">
	SELECT password FROM mvcdataboard WHERE no=#{no}s
</select>
<update id="boardUpdate" parameterType="DataBoardVO">
	UPDATE mvcdataboard SET
	name=#{name},subject=#{subject},content=#{content},filename=#{filename},filesize=#{filesize}
	WHERE no=#{no}
</update>
 */
	public static DataBoardVO boardUpdateData(int no) {
		SqlSession session=ssf.openSession();
		DataBoardVO vo=session.selectOne("boardDetailData",no);
		session.close();
		return vo;
	}
	public static boolean boardUpdate(DataBoardVO vo) {
		boolean bCheck=false;
		SqlSession session=ssf.openSession(true);
		String db_pwd=session.selectOne("boardGetPassword",vo.getNo());
		if(db_pwd.equals(vo.getPwd())) {
			bCheck=true;
			session.update("boardUpdate",vo);
		}
		session.close();
		return bCheck;
	}
	
	// 게시물 상세보기
/*
<update id="boardHitIncrement" parameterType="int">
	UPDATE mvcdataboard SET hit=hit+1 WHERE no=#{no}
</update>
<select id="boardDetailData" resultType="DataBoardVO" parameterType="int">
	SELECT no,name,subject,content,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as dbday,
	hit,filename,filesize
	FROM mvcdataboard WHERE no=#{no}
</select>
 */
	public static DataBoardVO boardDetailData(int no) {
		SqlSession session=ssf.openSession(true);
		session.update("boardHitIncrement",no);
		DataBoardVO vo=session.selectOne("boardDetailData",no);
		session.close();
		return vo;
	}
}
