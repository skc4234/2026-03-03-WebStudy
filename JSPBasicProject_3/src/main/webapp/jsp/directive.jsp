<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%--
	JSP 동작 과정
	JSP(Java Server Page) : 서버에서 실행되는 자바 파일
	JSP는 내부 Servlet으로 인해 자바로 변환됨
	
	JSP ------ Servlet 변환 ------ 컴파일 ------ 실행
											 ----
											 out.write("<html>");
											 --------------------
											 메모리에 저장 => 출력 버퍼
											 해당 브라우저에서 읽엇 ㅓ출력
	JSP 실행과정
	1. 클라이언트에서 요청(URL)
	2. 웹 서버에서 주소를 받는다
	3. a.jsp파일을 찾는다
		- 존재하면 톰캣으로 전송
		- 존재하지 않으면 404 페이지 전송
	4. 톰캣
		a.jsp => class a_jsp extends Http
				public void _jspInit()
				public void _jspService()
				{
				}
				}
		=> a_jsp.class => 서블릿 파일 => 실행
 	5. 실행결ㄹ과를 브라우저에 출력
 		브라우저 요청
 		JSP 파일 확인
 		JSP=>Servlet
 		Servet 컴파일
 		서블릿 객체 생성
 		_jspInit()
 		_jspService()
 		HTML
 		_jspDestory
 		
 		----------------------------------
 		         Servlet             Java
 		----------------------------------
 		 중심      Java                HTML
		----------------------------------
		 화면UI out.write("<html>")    html
		----------------------------------
		 유지보수   어렵다                쉽다
		----------------------------------
		 역할   Controller            View
		----------------------------------
	  	 실무   Servlet+JSP : MVC(SpringFramework)
	  	 	=> 현재
	  	 		SpringBoot + ThymeLeaf => 배포 시 배포파일 작다
	  	 		SpringBoot + VueJS//ReactJS => CI
	  	 		
	  - JSP 학습
	  	1. 동작 과정
	  	2. 스크립트 : 자바/HTML <% %>
	  	3. 지시자
	  		- page : 파일에 대한 정보 => import / buffer / session / ...
	  		- taglib : 태그를 사용하여 자바 제어문/라이브러리 => 태그로 제작
	  		- include : 특정 위치에 다른 JSP를 추가 => 조립식
	  	4. 내장 객체
	  		request/response/pageContext/session/out/application
	  	5. JSP 액션 태그
	  		<jsp:forward> / <jsp:include> / ...
	  	6. Cookie 사용법
	  	7. 데이터베이스 연동 : ConnectionPool
	  	-------------------------------------jsp
	  	8. JSTL / EL
	  	9. MVC 구조
	  	
	  	
	  	- 지시자
	  		- page
	  			- 가장 많이 사용되는 지시자 => JSP 시작 코드
	  			형식) <%@ page 속성="값" %>
	  			1) <%@ page language="java" %>
	  				=> 다른 언어는 불가 => 기능 만들기 전에 오라클에 인수되어서
	  			2) <%@ contentType="text/xml" %>
	  	                                 plain => JSON
	  	        3) import: 자바 라이브러리 로드
	  	        	- 다른 속성은 한번만 사용 가능하지만 import는 여러개 사용 가능
	  	        	- 유일하게 <%@ page import=""%>를 독립적으로 사용가능
	  	        4) pageEncoding : 한글 깨짐 방지
	  	        	- pageEncoding="UTF=8"
	  	        5) errorPage
	  	        	- 예외발생 시 이동 페이지 설정
	  	        	- errorPage="이동할 페이지"
	  	        
 --%>
<%
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String today = sdf.format(date);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>오늘 날짜</h1>
	<h2><%=today %></h2>
</body>
</html>