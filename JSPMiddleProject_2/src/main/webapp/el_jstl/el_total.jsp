<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	EL은 JSTL과 관련이 없다
	- EL은 독립적 표현식(자바 기본 J2EE 라이브러리), JSTL은 외부 라이브러리
	- Expression Language => 표현식 => <%=값%> ==> ${값}
	=> JSP에서는 자바를 사용하지 않는다
	  SpringFramework / SpringBoot
VIEW:      JSP           JSP/HTML
	     				   ---- **ThymeLeaf(EL 사용, 자체 라이브러리 사용)
 
 	- 사용법 => ${값}
 	- 목적
 		- JSP파일에서 자바 코드를 최소화 하기 위해서
 		- 자바 코드를 포함하면 css 적용/유지보수 등이 어렵기 때문에
 	- 연산자
 		- 산술연산자(+,+=), 비교연산자(==,!=), 논리연산자(not, or, and), 삼항연산자(조건식?값1:값2), Empty(${empty 변수} => 변수가 null/''이면 true)
 			5/2=>실수     ==(eq), !=(ne)                             페이징 기법
 	- 내장 객체
 		---MVC---
 		pageContext  => 경로 설정
 		requestScope => requset.getAttribute("")
 		sessionScope => session.getAttribute("")
 		---JSP---
 		applicationScope
 		param => getParameter()
 		paramValues => getParameter
 		
 	- ${값} => 일반변수값 출력x, request/session에 저장된 값 호출
 	- 한번 사용 => 인스턴스 변수
 	- 화면 출력을 위해 넘겨준 값만 출력 가능
  	
 	
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>