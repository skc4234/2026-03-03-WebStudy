package com.sist.vo;
/*
 *    MyBatis
 *    1. CRUD : <select> <insert> <update> <delete>
 *    	- resultType / parameterType
 *    2. JOIN
 *    	- resultMap: dvo.dname =>  getDvo().setName()
 *    3. 동적 쿼리 : JSTL과 비슷
 *    	- <if test="">
 *    	- <choose>
 *    		<when test=""></when>
 *    		...
 *    		<otherwise></otherwise>		
 *        </choose>
 *      - <foreach var="" items=""> : IN
 *      - <where>
 *      - <set>
 *      - <trim>
 *      - <bind>
 *    	
 */
import java.util.*;
import lombok.Data;
@Data
public class EmpVO {
	private int empno,sal,deptno;
	private String ename,job,dbday;
	private Date hiredate;
}
