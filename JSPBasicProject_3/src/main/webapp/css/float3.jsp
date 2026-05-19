<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	float 사용처
		- 이미지 카드 / 로그인 버튼 / 메뉴 바
		- 최근에는 flex / grid로 대체 

 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div.gallery {
	margin: 5px;
	border: 1px solid #CCC;
	float: left;
	width: 180px;
}
div.gallery img {
	width: 100%;
	height: 250px;
}
div.desc {
	float: left;
	padding: 15px;
	text-align: center;
}

</style>
</head>
<body>
	<div class="gallery">
		<img src="../images/m1.jpg">
		<div class="desc">
			<보헤미안 랩소디> 제작진과 팝의 황제 ‘마이클 잭슨’의 만남!
		</div>
	</div>
	<div class="gallery">
		<img src="../images/m2.jpg">
		<div class="desc">
			<보헤미안 랩소디> 제작진과 팝의 황제 ‘마이클 잭슨’의 만남!
		</div>
	</div>
	<div class="gallery">
		<img src="../images/m3.jpg">
		<div class="desc">
			<보헤미안 랩소디> 제작진과 팝의 황제 ‘마이클 잭슨’의 만남!
		</div>
	</div>
	<div class="gallery">
		<img src="../images/m4.jpg">
		<div class="desc">
			<보헤미안 랩소디> 제작진과 팝의 황제 ‘마이클 잭슨’의 만남!
		</div>
	</div>
	<div class="gallery">
		<img src="../images/m5.jpg">
		<div class="desc">
			<보헤미안 랩소디> 제작진과 팝의 황제 ‘마이클 잭슨’의 만남!
		</div>
	</div>
</body>
</html>