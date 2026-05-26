<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>고전 방식</h1>
	<%
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
	%>
	ID : <%=id %><br>
	PWD : <%=pwd %><br>
	<h1>현재 방식</h1>
	ID : ${param.id }<br>
	PWd : ${param.pwd }
	<hr>
	<h1>고전 방식(getParameterValues())</h1>
	<%
		String[] hobby = request.getParameterValues("hobby");
		for(String h : hobby) {
	%>
			<%=h %><br>
	<%} %>
	<h1>현재 방식(paramValues)</h1>
	${paramValues.hobby[0] }
</body>
</html>