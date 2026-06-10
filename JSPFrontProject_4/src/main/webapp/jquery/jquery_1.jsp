<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	JQuery
	- 3버전은 유지보수용, 4버전
	- 라이브러리가 작아졌다 => 최적화
	- JavaScript 라이브러리 => 프레임워크 형식(소스 통일화)
	- 교육 최소화 : Spring, SpringBoot, MyBatis, JPA
	- 과거 : Spring+MyBatis+JQuery3
	- 현재 : SpringBoot(NodeJS)+JPA+React(Vue)
	------------------------------------
	web2.0 : 동적 / web3.0 : 블록체인 => AI보다 강세 => 스타벅스 오디세이
	-------------------------------------
	C/S => cloud => 예측/분석 => AI => 감성 컴퓨팅
					 빅데이터
					 
	태그,속성을 제어하는 프로그램 : 문서 객체 모델(DOM)
	doucment.querySelector('#btn')
	document.querySelectorAll('#btn')
	document.getElementById('btn')
	---------------------------------------> $('#btn') 통일
	$('CSS 선택자') : 모든 태그 읽기
	---------------------------
	조작
	1. 문자 조작 : <b>변경 대상</b>
		- textContent => .text() / innerHTML => .html()
	2. 스타일 조작
		```
		// 태그.style.속성명 => css()
		// 바닐라 JS
		btn.style.color="red"
		
		// JQuery3
		$('#btn').css("color","red")
		
		// JQuery4
		css({
			"color":"red",
			"backgroundColor":"yellow"
		})
		```
	3. 속성 조작
		```
		// <img src="">
		// 바닐라 JS
		let img=document.querySelector('img')
		img.src=""
		
		// JQuery3
		$('img').attr("src","")
		
		// 값읽기 : <input type="text">
		let input=document.querySelector('input')
		input.value
		
		// JQuery
		$('input').val()
		
		// getter/setter
		text(): getter, text("aaa"): setter
		attr("src"): getter, attr("src",""): setter
		val(): getter, val(""): setter
		html(): getter, html(""): setter
		```
	4. 이벤트 처리
		img.addEventListener('click',function(){})
		$('img').on('click',function(){})
		$('img').click(function(){})
		
	5. 기타
		- ajax => $.ajax({})
		- 서버와 연결 : Vue/React: fetch/axios
		- youtube api 등록
		- data.go.kr / 한국관광공사 => 충분한 데이터 모음
		
	- JQuery는 버전 충돌시 작동x
	
	
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-4.0.0.js"></script> -->
<script type="text/javascript">
$(function(){
	$('#h1').css("color","yellow")
	$('.h1').css("backgroundColor","cyan")
	$('#h2').css("color","red")
	$('#h3').css("color","blue")
	$('h2:eq(0)').css("color","magenta")
				.css("backgroundColor","black")
	$('h2:eq(1)').css({
		"color": "pink",
		"backgroundColor": "blue"
	})
	$('h2:eq(2)').css("color","green")
	$('h2:eq(3)').css("color","gray")
	$('h2:eq(4)').css("color","orange")
	
	// 스타일 조작
	/* let h3=document.querySelectorAll('h3')
	for(let h of h3) {
		h.style.groundColor="orange"
		h.style.backgroundColor="yellow"
	} */
	$('h3').css({
		"color":"white",
		"backgroundColor":"black"
	})
	
	$('img').css({
		"width":"170px",
		"height":"230px"
	})
	
	$('img').hover(function(){
		$(this).css({
			"cursor":"pointer",
			"border":"3px solid green"
		})
	}, function(){
		$(this).css({
			"cursor":"none",
			"border":"none"
		})
	})
	
	// this : 자신(이벤트 해당되는 태그)
})
</script>
</head>
<body>
<h1 id="h1">Hello JQuery</h1>
<h1 class="h1">Hello JQuery</h1>
<h1 class="h1">Hello JQuery</h1>
<h1 id="h3">Hello JQuery</h1>
<h1 id="h2">Hello JQuery</h1>
<h2>Hello JQuery</h2>
<h2>Hello JQuery</h2>
<h2>Hello JQuery</h2>
<h2>Hello JQuery</h2>
<h2>Hello JQuery</h2>
<h3>Hello JQuery</h3>
<h3>Hello JQuery</h3>
<h3>Hello JQuery</h3>
<h3>Hello JQuery</h3>
<h3>Hello JQuery</h3>
<img src="https://img.megabox.co.kr/SharedImg/2026/05/13/zlk6dycnwuPdVuSH40RVickv2CYYCrcU_420.jpg">
<img src="https://img.megabox.co.kr/SharedImg/2026/05/19/Xya2c40b4Yck7jNWa2l0NWUpIuoZkPAV_420.jpg">
<img src="https://img.megabox.co.kr/SharedImg/2026/05/21/ysq28y1C9Y3yJdnIIwb3kacb7Sx6omLV_420.jpg">
<img src="https://img.megabox.co.kr/SharedImg/2026/06/09/KohW1eBmK8OyASrtmtTWAK51aqk448re_420.jpg">
<img src="https://img.megabox.co.kr/SharedImg/2026/05/27/AodTyXKohEi0aRnhy5MC7kHn3yO8Ixem_420.jpg">
</body>
</html>