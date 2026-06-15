<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	removeClass / addClass
	<a class=""> 삭제/추가
	=> Menu에서 주로 사용
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
	box-sizing: border-box;
}
.menu {
	display: flex;
	list-style: none;
	background-color: #333;
}
.menu li {
	padding: 15px 25px;
	cursor: pointer;
	color: white;
}

.menu li.active {
	background-color: cyan;
}

.content {
	display: none;
	padding: 20px;
	border: 1px solid #ddd;
}

.content.active {
	display: block;
}
</style>
<%-- JQuery 4 버전 --%>
<script type="text/javascript" src="http://code.jquery.com/jquery-4.0.0-rc.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$('.menu li').on('click',function(){
		$('.menu li').removeClass('active')
		$(this).addClass('active')
		
		$('.content').removeClass('active')
		
		const tab=$(this).data('tab')
		$('#tab'+tab).addClass('active')
	})
})

</script>
</head>
<body>
<%-- 태그는 사용자 정의가 없다 / 속성은 사용자 정의 가능 --%>
<ul class="menu">
	<li class="active" data-tab="1">홈</li>
	<li data-tab="2">회원</li>
	<li data-tab="3">묻고답하기</li>
</ul>
<div id="tab1" class="content active">
홈 메뉴 입니다
</div>
<div id="tab2" class="content">
회원 관련 메뉴 입니다
</div>
<div id="tab3" class="content">
묻고답하기 입니다
</div>
</body>
</html>