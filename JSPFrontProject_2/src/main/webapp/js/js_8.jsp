<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.box {
	width: 200px;
	height: 200px;
	border: 1px solid black;
	margin-top: 20px;
}
</style>
<script type="text/javascript">
window.onload=()=>{
	let div=document.querySelectorAll('.box')
	for(let i=0; i<div.length; i++){
		div[i].addEventListener('mousedown',()=>{
			div[i].style.backgroundColor="red"
		})
		div[i].addEventListener('mouseup',()=>{
			div[i].style.backgroundColor="purple"
		})
	}
}
</script>
<body>
</head>
<div class="box"></div>
<div class="box"></div>
<div class="box"></div>
<div class="box"></div>
<div class="box"></div>
<div class="box"></div>
<div class="box"></div>
<div class="box"></div>
<div class="box"></div>
<div class="box"></div>
<div class="box"></div>
<div class="box"></div>
</body>
</html>