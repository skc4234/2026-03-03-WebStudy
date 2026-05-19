<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	include 지시자
		=> 파일 여러개를 모아서 한번에 컴파일
		=> 조립식 프로그램
		
	실무에서는 page/taglib 사용 =>  include는 사용빈도가 없다
		<jsp:include>로 주로 사용 : 동적
		=> 소스를 통합
		
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" bordercolor="black" style="width: 800; height: 600">
	<tr>
		<td colspan="2" height="100" align="center">
		<%@ include file="header.jsp" %>
		</td>
	</tr>
	<tr>
		<td width="200" height="400" align="center">
		<%@ include file="aside.jsp" %></td>
		<td width="600" height="400" align="center">
		<%@ include file="section.jsp" %></td>
	</tr>
	<tr>
		<td colspan="2" height="100" align="center">
		
		<%@ include file="footer.jsp" %>
		</td>
	</tr>
	</table>
</body>
</html>