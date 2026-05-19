<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%--
	uri => import
	prefix => 접두어(직접설정 가능)
	태그 이름
	<c:for>
	<c:if> => <c:else>는 없다
	=>
	<c:choose>
		<c:when test=""></c:when>
		<c:when test=""></c:when>
		<c:when test=""></c:when>
	</c:choose>
	
	<c:set> : 변수
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>일반 자바</h1>
	<%
		for(int i=1; i<=10; i++) {
	%>		<%= i %> &nbsp; 
	<%	}
	%>
	<h1>JSTL</h1>
	<c:forEach var="i" begin="1" end="10">
		${i }&nbsp;
	</c:forEach>
</body>
</html>