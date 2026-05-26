<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
	EL 데이터 읽는 경우
	- request에 있는 값
		request.setAttribute("name","홍길동");
	- response에 있는 값
	- application에 있는 값
	- param => 다른 jsp에서 보낸 값
		${param.name} => param.getParameter("name")
	- paramValues => 여러개 동시에 받는 경우
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//request.setAttribute("name", "홍길동");
		session.setAttribute("name", "박문수");
		application.setAttribute("name", "심청이");
	%>
		이름 : ${name }
</body>
</html>