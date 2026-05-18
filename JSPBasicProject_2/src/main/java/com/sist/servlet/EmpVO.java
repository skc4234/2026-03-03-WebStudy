package com.sist.servlet;
/*
EMPNO    NOT NULL NUMBER(4)    
ENAME             VARCHAR2(10) 
JOB               VARCHAR2(9)  
MGR               NUMBER(4)    
HIREDATE          DATE         
SAL               NUMBER(7,2)  
COMM              NUMBER(7,2)  
DEPTNO            NUMBER(2)
 */
import java.util.*;
import lombok.Data;
@Data
public class EmpVO {
	private int empno, mgr, deptno;
	private String ename, job, dbday;
	private Date date;
	private double sal, comm;
	// 자바에서 조인은 포함 클래스 => MyBatis, JPA도 동일
	private DeptVO dvo = new DeptVO();
}
