<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%--
	prefix="접두어 결정" : c
 --%>
<%
	List<String> names = new ArrayList<String>();
	names.add("홍길동");
	names.add("심청이");
	names.add("김두한");
	names.add("이순신");
	names.add("John");
%>
<c:set var="list" value="<%=names %>" />
<%--
	JSTL은 xml로 되어 있다
	XML 기본 문법
		1. 여는/닫는 태그 반드시 일치, 단독 태그 사용
		2. 대소문자 구분
		3. 값 입력시 반드시 "" 사용
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>고전 방식(자바이용)</h1>
	<%
		for(int i=1; i<=10; i++) {
	%>
			<%=i %>&nbsp;
	<%} %>
	<hr>
	<h1>현재 방식(JSTL 이용)</h1><%-- 태그만 이용해서 출력하는 방식 --%>
	<c:forEach var="i" begin="1" end="10" step="1">
		${i }&nbsp;
	</c:forEach>
</body>
</html>