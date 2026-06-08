package com.sist.dao;
import java.util.*;

import lombok.Data;
@Data
public class EmpVO {
	private int empno,mgr,sal,comm,deptno;
	private String ename, job,dbday;
	private Date hiredate;
	private DeptVO dvo=new DeptVO(); // 포함클래스 => JOIN
}
