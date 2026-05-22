<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	String admin = (String)session.getAttribute("admin");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="main.jsp">JSP Basic</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="main.jsp">Home</a></li>
      <%-- Cookie, Session --%>
      <li><a href="#">스토어</a></li>
      <%-- File Upload
      cos.jar => commons-fileupload.jar
       --%>
      <li><a href="main.jsp?mode=3">자료실</a></li>
      <%
      	if(id!=null) { // 로그인이 된 상태
      		if(admin.equals("y")) {
      %>
      <li><a href="#">관리자페이지</a></li>
      <%} else { %>
      <li><a href="#">메인페이지</a></li>
      <%}} %>
    </ul>
  </div>
</nav>
</body>
</html>