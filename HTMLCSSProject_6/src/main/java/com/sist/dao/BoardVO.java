package com.sist.dao;
/*
NO      NOT NULL NUMBER         
NAME    NOT NULL VARCHAR2(51)   
SUBJECT NOT NULL VARCHAR2(2000) 
CONTENT NOT NULL CLOB           
PWD     NOT NULL VARCHAR2(10)   
REGDATE          DATE           
HIT              NUMBER

한 개의 게시물 정보 저장 => 사용자 요청 시 한번에 전송

 *
 * 매칭
 * 	오라클          자바               MySQL/MariaDB
 *  CHAR            				 VARCHAR
 *  VARCHAR2     String	             TEXT
 *  CLOB
 *  
 *  NUMBER       int                 int
 *  NUMBER(2,1)  double              double
 *  
 *  DATE        java.util.Date        DATETIME / LocalDateTime
 *  =============================
 *  
 */
import java.util.*;
// 읽기(getter) 쓰기(setter) => lombok @Data
import lombok.Data;
@Data
public class BoardVO {
	private int no, hit;
	private String name, subject, content, pwd, dbday;
	private Date regdate;
}

