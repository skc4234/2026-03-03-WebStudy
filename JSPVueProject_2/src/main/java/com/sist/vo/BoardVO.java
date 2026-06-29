package com.sist.vo;

import lombok.Data;
import java.util.*;
/*
NO      NOT NULL NUMBER         
NAME    NOT NULL VARCHAR2(51)   
SUBJECT NOT NULL VARCHAR2(2000) 
CONTENT NOT NULL CLOB           
PWD     NOT NULL VARCHAR2(10)   
REGDATE          DATE           
HIT              NUMBER
 */
// 오라클과 변수명이 다를 경우(MyBatis) => 컬럼명 as 변수명
// SELECT no,name,TO_CHAR(regdate, 'YYYY-MM-DD') as dbday
//       setNo(), setName(),  setDbday()
@Data
public class BoardVO {
	private int no,hit;
	private String name,subject,content,pwd,dbday;
	private Date regdate;
}
