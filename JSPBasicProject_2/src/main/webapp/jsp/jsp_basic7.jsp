<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%--
	JSP에서 자바 코딩은 <%%> 영역을 벗어나면 일반 문자열로 인식
	- 위치 속성
		- static : 태그 코딩에 따라 순서대로 배치(default)
		- relative : 상대적 좌표에 따라 배치
		- absolute : 절대 좌표
		- fixed : 고정 좌표
		- sticky : 스크롤 시마다 고정
	- 위치 설정
		- top
		- left
		- right
		- bottom
	- 유동 속성
		float => 메뉴/버튼 ==> left / right
		z-index => 레이어 개념 => 이미지 앞으로 가져오기

 --%>
 <%
 	List<String> images = new ArrayList<String>();
 	images.add("../images/m1.jpg");
 	images.add("../images/m2.jpg");
 	images.add("../images/m3.jpg");
 	images.add("../images/m4.jpg");
 	images.add("../images/m5.jpg");
 	
 	List<String> key = new ArrayList<>();
 	key.add("a");
 	key.add("b");
 	key.add("c");
 	key.add("d");
 	key.add("e");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div.wrap {
	width: 800px;
	height: 900px;
	border: 1px solid red;
	position: absolute;
}
img {
	width: 200px;
	height: 300px;
	position: absolute;
}
.a {
	top: 0px;
	left: 0px;
}
.b {
	top: 0px;
	right: 0px;
}
.c {
	bottom: 0px;
	left: 0px;
}
.d {
	bottom: 0px;
	right: 0px;
}
.e {
	top:300px;
	left:300px;
}
</style>
</head>
<body>
	<h1>Absolute</h1>
	<div class="wrap">
		<%
			for(int i=0; i<images.size(); i++) {
		%>		<img src="<%=images.get(i) %>" class="<%=key.get(i) %>">		
		<%	}
		%>
	</div>
</body>
</html>