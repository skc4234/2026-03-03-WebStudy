<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	position : 위치 속성
	- static : 소스 순서대로 배치
		- top / left / right / bottom => 무시
	- 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.static {
	position: static;
	width: 100px;
	height: 100px;
	background-color: red;
	top: 20px;
	left: 20px;
}
</style>
</head>
<body>
	<%-- top, left, right, bottom을 무시한다 --%>
	<div class="static">static</div>
</body>
</html>