<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	JSP
		- 지시자
			- page : contentType, import, errorPage, isErrorPage => web.xml
			- taglib : prefix, uri => jstl
		- 내장 객체
			- request : getParameter
			- response : sendRedirect
			- session : 
			- application
		- Cookie
		- File Upload
		- DB 연동 : JDBC, DBCP
		==========================
		+ EL / JSTL => <% %> => 자바파일, ${}로 변경
		+ MV / MVC 구조
		=> Spring에서 모두 사용
		=> 유지보수 용이, 협업 가능(Front/Back)
		
	
	- EL/JSTL
		- HTML+Java+DB => 유지보수가 어렵다 => 분리 =>  EL/JSTL
	- EL(Expression Language) : 표현식
		- <% %> 대체(화면 출력)
		- 사용 목적
			- JSP에서 Java 코드를 줄이고 데이터를 간단하게 출력하기 위해 사용
			ex) <%= request.getParameter("name") %>
				 =>  ${name}
		- 사용법
			- ${값}
		- 연산자
			- Java 구조가 아님 => C#과 비슷
			- 산술연산자(+,-,*,/,%)
				- + : 순수한 덧셈만 가능 / 문자열 결합은 +=
				- / : div로 사용 가능, 정수/정수 = 실수  ex)${5/2} == %{5 div 2}
				- % : mod로 사용 가능  ex) %{5%2} == %{5 mod 2}
				- null : 0으로 인식  ex) ${5+null} => 5
				- 자동 정수형 변경 => ${"5"+"4"} => 9
				- 문자열로 결합하려면 += 사용 => ${"5"+="4"} => 54
			- 비교연산자
			- 논리연산자
			- 삼항연산자
			- Empty
		- 내장 객체
			- requestScope => request.getAttribute() 호출
			- sessionScope => session.getAttribute() 호출 ====
			- applicationScope => application.getAttribute() 호출
			- param => request.getParameter()
			- paramValues => request.getParameterValues()
			
	- JSTL
	
	
	
	- $ : &#36;
	
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>EL 연산자 : 조건문 처리</h1>
 	<h3>- 산술 연산자(생략)</h3>
<%--
	&#36;{10+10}=${10+10 }<br>
	&#36;{10+null}=${10+null }<br> null=0
	&#36;{"10"+10}=${"10"+10 }<br> 자동으로 정수형 변경
	&#36;{"10"+=10}=${"10"+=10 }<br> 문자열 결합시 +=
	&#36;{10/3}=${10/3 }<br> 정수/정수 = 실수
	&#36;{10 div 3}=${10 div 3}<br>
	&#36;{10%3}=${10%3 }<br>
	&#36;{10 mod 3}=${10 mod 3 }
	/ : div , % : mod
--%>
	<hr>
	<h3>- 비교 연산자 => 조건식으로 많이 사용(결과 true/false)</h3>
	<h4>==(eq) / !=(ne) / >(gt) / <(lt) / >=(ge) / <=(le)</h4>
	<h5>비교 연산자는 문자열 / 날짜 / 숫자 비교시에도 사용</h5>
<%--
	&#36;{10==10}=${10==10}<br>
	&#36;{10 eq 10}=${10 eq 10}<br>
	&#36;{10!=10}=${10!=10}<br>
	&#36;{10 ne 10}=${10 ne 10 }<br>
	&#36;{"hong" ne "shim"}=${"hone" ne "shime" }<br>
	&#36;{10<10}=${10<10 }<br>
	&#36;{10 lt 10}=${10 lt 10 }<br>
	&#36;{10>10}=${10>10 }<br>
	&#36;{10 gt 10}=${10 gt 10 }<br>
	&#36;{10<=10}=${10<=10 }<br>
	&#36;{10 le 10}=${10 le 10 }<br>
	&#36;{10>=10}=${10>=10 }<br>
	&#36;{10 ge 10}=${10 ge 10 }<br>
--%>
	<hr>
	<h3>- 논리 연산자</h3>
	<h4>and, or, not</h4>
<%--
	&#36;{10==10 and 10!=10}=${10==10 and 10!=10}<br>
	and 연산자는 좌우 조건이 true일때만 true, 나머진 false
	&#36;{10==10 or 10!=10}=${10==10 or 10!=10}<br>
	or 연산자는 좌우 조건 중 하나만 true여도 true
	&#36;{not(10==10)}=${not(10==10)}<br>
--%>
	<hr>
	<h3>Empty 연산자</h3>
	<h4>공백이 있으면 true 없으면 false</h4>
	<%
		// ${}는 일반변수가 아닌 session/request에 있는 값 출력
		// String name=""; 이면 ${name}에서 값 못받음
		request.setAttribute("name", "");
	%>
	&#36;{empty name}=${empty name}<br>
	<% 
		String name1="심청이";
		session.setAttribute("name", name1); // 키가 같으면 request가 우선
	%>
	default 이름:${name}<br>
	sessionScope 이름:${sessionScope.name}<br>
	<hr>
	<h3>삼항 연산자</h3>
<%-- 	&#36;{10==10?"T":"F"}=${10==10?"T":"F"}<br> --%>
	<%-- 출력 용도(%= 대체) --%>
</body>
</html> 