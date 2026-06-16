package com.sist.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
import com.sist.commons.*;
public class EmpDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	// 기능
	// 1. 검색
/*
<select id="empFindData" resultType="EmpVO" parameterType="EmpVO">
	SELECT empno,ename,job,sal,TO_CHAR(hiredate,'YYYY-MM-DD') as dbday, deptno
	FROM emp
	<where> <!-- 자동으로 WHERE 절 생성, 첫번째 행 OR/AND 제거 -->
		<if test="empno!=null">
			AND empno=#{empno}
		</if>
		<if test="ename!=null and ename!=''">
			AND ename LIKE '%'||#{ename}||'%'
		</if>
		<if test="deptno!=null">
			AND deptno=#{deptno}
		</if>
	</where>
<!-- 	ORDER BY empno ASC -->
</select>
 */
	public static List<EmpVO> empFindData(EmpVO vo) {
		SqlSession session=ssf.openSession();
		List<EmpVO> list=session.selectList("empFindData",vo);
		if(session!=null) session.close();
		return list;
	}
	
	// 2. 검색(bind)
/*
<select id="empFindData2" resultType="EmpVO" parameterType="String">
	<bind name="keyword" value="'%'+ename+'%'"/>
	SELECT empno,ename,job,sal,hiredate, deptno
	FROM emp
	WHERE ename LIKE #{keyword}
</select>
 */
	// bind
	public static List<EmpVO> empFindData2(String ename) {
		SqlSession session=ssf.openSession();
		List<EmpVO> list=session.selectList("empFindData2",ename);
		if(session!=null) session.close();
		return list;
	}
	
	// choose~when~otherwise
	public static List<EmpVO> empFindData3(String job) {
		SqlSession session=ssf.openSession();
		List<EmpVO> list=session.selectList("empFindData3",job);
		if(session!=null) session.close();
		return list;
	}
	
/*
<select id="empFindData4" resultType="EmpVO" parameterType="hashmap">
	SELECT empno,ename,job,sal,TO_CHAR(hiredate,'YYYY-MM-DD') as dbday, deptno
	FROM emp
	WHERE empno IN <!-- (7788,7700,7811) -->
	<foreach collection="data" item="emp" separator="," open="(" close=")">
		#{emp}
	</foreach>
</select>
*/
	// foreach
	public static List<EmpVO> empFindData4(Map map) {
		SqlSession session=ssf.openSession();
		List<EmpVO> list=session.selectList("empFindData4",map);
		if(session!=null) session.close();
		return list;
	}

/*
<select id="empGetData" resultType="EmpVO">
	SELECT empno,ename
	FROM emp
	ORDER BY empno ASC
</select>
 */
	public static List<EmpVO> empGetData() {
		SqlSession session=ssf.openSession();
		List<EmpVO> list=session.selectList("empGetData");
		if(session!=null) session.close();
		return list;
	}

/*
<select id="empFindData5" resultType="EmpVO" parameterMap="EmpVO">
	SELECT empno,ename,job,sal,TO_CHAR(hiredate,'YYYY-MM-DD') as dbday, deptno
	FROM emp
	<trim prefix="WHERE" prefixOverrides="AND|OR">
		<if test="ename!=null and ename!=''">
			AND ename LIKE '%'||#{ename}||'%'
		</if>
		<if test="job!=null and job!=''">
			AND job LIKE '%'||#{job}||'%'
		</if>
	</trim>
</select>
 */
	public static List<EmpVO> empFindData5(EmpVO vo) {
		SqlSession session=ssf.openSession();
		List<EmpVO> list=session.selectList("empFindData5",vo);
		if(session!=null) session.close();
		return list;
	}
	
	
}
