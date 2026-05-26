<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%--
	JSTL(Java Standard Tag Library)
	- core
		- 변수 설정 : <c:set var="vo" value="<%=new SawonVO()%>">
			=> request.setAttribute("vo", new SawonVO());
		- 화면 출력 : <c:out value=""> : JavaScript에서 출력 시 사용
		- 제어문 : <c:forEach> : 반복문, <c:if> : 조건문, <c:choose> : 다중 조건문, <c:forTokens> : StringTokenizer
		- URL => 화면 이동 : <c:redirect url=""> => response.sendRedirect(url)
	==== Java에서 미리 처리 =======================================
	- fmt
		- 날짜 변경 : <fmt:formatDate> : SimpleDateFormat
		- 숫자 변경 : <fmt:formatNumber> : DecimalFormat
	- fn
		- String 클래스 메소드
			- fm:length(), fn:substring(), fn:trim(), ...
	===========================================================
	- sql, xml은 사용x
--%>
<%
	String name="홍길동"; // ${name} (x)
	request.setAttribute("name", name);
%>
<c:set var="name1" value="싱청이" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	이름 : ${name }<br>
	이름 : ${nam1e1 }<br>
</body>
</html>