<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	position(위치 속성)
		-----------------
			  top
		left		right
			 bottom
		-----------------
		- static(default) : HTML 기본 흐름에 따라 배치
		- absolute : 절대 좌표(가장 가까운 태그 기준)
		- relative : 상대 좌표(원래 자리에서 지정한 좌표만큼 이동)
		- fixed : 고정 좌표(스크롤 영향 x)
		- sticky : 스크롤 시 고정됨
		
		position: absolute;
		
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container {
	border: 2px dashed gray;
	margin: 30px;
	height: 250px;
	position: relative;
	padding: 10px;
}
.box {
	width: 100px;
	height: 50px;
	color: #fff;
	font-weight: bold;
	line-height: 50px;
	text-align: center;
	margin: 5px;
}
.static {
	background: orange;
	position: static;
}
.relative {
	background: #6fa8dc;
	position: relative;
	top:20px;
	left: 30px;
}
.absolute {
	background: #93c47d;
	position: absolute;
	
}
.sticky {
	
}
.scrol-area {
	height: 300px;
	overflow: auto;
	border: 2px solid;
}
.sticky {
	background: #8e7cc3;
	position: sticky;
	top:0;
}
</style>
</head>
<body>
	<h1>CSS 위치 속성</h1>
	<h2>1. static(기본)</h2>
	<div class="container">
		<div class="box static">static</div>
	</div>
	<p>문서의 기본 흐름에 따라 배치 <code>top/right/bottom/left</code> 적용이 안됨</p>
	<h2>2. relative(상대 좌표)</h2>
	<div class="container">
		<div class="box relative">relative</div>
	</div>
	<p>원래 자리에서 <code>top: 20px; left: 30px;</code> 만큼 이동</p>
	<h2>3. absolute(절대 좌표)</h2>
	<div class="container">
		<div class="box absolute">absolute</div>
	</div>
	<p>가장 가까운 태그를 기준점으로 위치 <code>position: relative</code></p>
	<h2>4. sticky</h2>
	<div class="container">
		<div class="box sticky">sticky</div>
	</div>
	<p>sticky 박스는 스크롤마다 <code>top: 20px; left: 30px;</code> 만큼 이동</p>
	
</body>
</html>