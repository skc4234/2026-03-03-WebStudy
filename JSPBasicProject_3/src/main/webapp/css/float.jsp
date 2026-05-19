<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	유동 속성
	float : right / left
	사용법
		float: right / float: left
		---------------- 레이아웃
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container {
	width: 800px;
	height: 200px;
	border: 1px dotted black;
}
.box {
	width: 100px;
	height: 100px;
	background: #f0f;
}
.a {
	float: left;
}
.b {
	float: right;
}
</style>
</head>
<body>
	<div class="container">
		<div class="box a">left</div>
		<div class="box b">right</div>
	</div>
</body>
</html>