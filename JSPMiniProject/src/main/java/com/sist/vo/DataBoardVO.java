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
 *   1. MVC 세팅 => Project
 *   2. VO => Table 설정
 *   3. Mapper
 *   4. DAO
 *   5. Model
 *   6. JSP => 출력
 *   ------------------
 *   1. 벤치마킹 => 화면 UI (페이지 분석) => 화면 캡쳐
 *   2. 요구사항 => 기능
 *   3. 벤치마킹 화면 => 프로젝트에 필요한 데이터 추출
 *   4. DB 설계
 *   5. DB 수집(크롤링)
 *   6. 메인화면 => 공통 => Git
 *   7. 회원가입/로그인
 *   8. 역할 분담
 *   9. 완성 후 테스트(JUnit: 단위 테스트)
 *   10. 배포 => AWS
 *   ------------------
 *   CRUD 정리, 파일 업로드/다운로드
 *   => 갤러리 게시판 / 후기 게시판 => 이미지 출력
 */
import java.util.*;
import lombok.Data;

@Data
public class DataBoardVO {
	private int no,hit,filesize;
	private String name,subject,content,pwd,dbday,filename;
	private Date regdate;
}
