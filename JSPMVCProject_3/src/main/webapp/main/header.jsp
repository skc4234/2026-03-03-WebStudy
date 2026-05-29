<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      <a class="navbar-brand" href="../main/main.do">MVC</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="${mode==1?'active':'' }"><a href="../main/main.do">Home</a></li>
      <li class="${mode==2?'active':'' }"><a href="../goods/list.do">스토어</a></li>
      <li class="${mode==3?'active':'' }"><a href="../food/detail.do">자료실</a></li>
      <li class="${mode==4?'active':'' }"><a href="#">JSON</a></li>
    </ul>
  </div>
</nav>
</body>
</html>