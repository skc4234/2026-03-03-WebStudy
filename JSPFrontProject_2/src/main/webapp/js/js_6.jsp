<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	<select> : onchange => 장바구니 등
	<form> : onsubmit => 회원가입 등
	
	- JQuery : $('img').mouseover(()=>{}), $('img').mouseout(()=>{})
			 ==>  $('img').hover(()=>{},()=>{})
			 					   over   out
			 					   
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=()=>{
	// 고전적인 방법
	let img = document.querySelector('img')
	img.onmouseover=()=>{
		img.style.opacity=0.3
	}
	img.onmouseout=()=>{
		img.style.opacity=1.0
	}
	img.onclick=()=>{
		alert("상세보기로 이동")
	}
	
	let btn=document.querySelectorAll("button")
	btn[0].onclick=()=>{
		img.style.width="400px"
		img.style.height="636px"
	}
	btn[1].onclick=()=>{
		img.style.width="200px"
		img.style.height="318px"
	}
}
</script>
</head>
<body>
<h1>고전 이벤트 처리</h1>
<img src="../images/m1.jpg" style="width: 200px">
<p>
<button type="button">크기조절</button>
<button type="button">원상복귀</button>
</body>
</html>