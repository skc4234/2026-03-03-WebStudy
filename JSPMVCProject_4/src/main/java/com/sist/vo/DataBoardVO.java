package com.sist.vo;
/*
NO       NOT NULL NUMBER         
NAME     NOT NULL VARCHAR2(51)   
SUBJECT  NOT NULL VARCHAR2(2000) 
CONTENT  NOT NULL CLOB           
PWD      NOT NULL VARCHAR2(10)   
REGDATE           DATE           
HIT               NUMBER         
FILENAME          VARCHAR2(260)  
FILESIZE          NUMBER
 */
/*
 * 	SELECT name,subject,TO_CHAR(regdate,'YYYY-MM-DD') as dbday ...
 * 		   ---- ------- -----------------------------
 * 			setName, setSubject, setDbday => 컬럼이 없음 => 별칭으로 컬럼 만들기
 */
import java.util.*;

import lombok.Data;
@Data
public class DataBoardVO {
	private int no,hit,filesize;
	// MyBatis는 반드시 컬럼명 일치, 다르면 별칭
	private String name,subject,content,pwd,filename,dbday;
	private Date regdate;
}
