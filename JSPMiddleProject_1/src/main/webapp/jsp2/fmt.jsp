<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.text.*"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Java 날짜 변환</h1>
	<%
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(date);
	%>
	오늘 날짜 : <%=today %>
	<hr>
	<%-- 사용빈도가 거의 없다 => TO_CHAR(regdate, 'YYYY-MM-DD') --%>
	<h1>JSTL 날짜 변환</h1>
	<c:set var="today" value="<%=new Date() %>"></c:set>
	<fmt:formatDate value="${today }" pattern="yyyy-MM-dd"/>
	
	<h1>Java 숫자 변환</h1>
	<%-- Java/Oracle에서 우선 처리 => 나중에 필요시 JSTL에서 처리 --%>
	<%-- 숫자 변환 : 1000000 => 1,000,000 --%>
	<%-- 자바스크립트 : toLocaleString() --%>
	<%
		int won=1234567;
		DecimalFormat df = new DecimalFormat("#,###,###");
		String data=df.format(won);
	%>
	<%=data %>
	<h1>JSTL 숫자 변환</h1>
	<fmt:formatNumber value="1234567" type="currency"/>
	<%-- 오라클에서 TO_CHAR() 등으로 사용 --%>
	<br>
	<fmt:setLocale value="en_US"/> <%--달러 표기 --%>
	<fmt:formatNumber value="1234567" type="currency"/>
	<br>
	<fmt:formatNumber value="0.75" type="percent"/> <%-- 특가, 할인율 등 --%>
</body>
</html>