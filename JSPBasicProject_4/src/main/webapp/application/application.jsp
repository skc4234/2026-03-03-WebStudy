<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	application : ServletContext
		- 서버 정보 / 자원 정보 / 로그 정보
		- 서버 정보
			- getMajorVersion : Servlet 버전 6.0 => 6
			- getMinorVersion : Servlet 버전 6.0 => 소수점 뒷자리
			- getServerInfo()
		- 자원 정보
			- *getRealPath()* : 실제 저장되는 위치
		- 로그 정보
			- *log*
			- *getInitParameter()* : web.xml param 정보 읽기
		
		내장객체
		request / response / session
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	Servlet 버전 : <%= application.getMajorVersion()+"."+application.getMinorVersion() %>
	<br>
	서버 이름 : <%=application.getServerInfo() %>
	<%
		String driver=application.getInitParameter("driver");
		String url=application.getInitParameter("url");
		String user=application.getInitParameter("username");
		String pwd=application.getInitParameter("password");
		
		application.log("driver : " + driver);
		application.log("url : " + url);
		application.log("user : " + user);
		application.log("pwd : " + pwd);
	%>
	<br>
	<%= application.getRealPath("/") %>
</body>
</html>