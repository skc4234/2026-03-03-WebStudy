<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	문자 조작
		- textContent : 태그와 태그 사이에 값을 주입(순수한 문자열) => HTML 파싱x
		- innerHTML : 태그와 태그 사이에 HTML 추가(파싱)
		- appendChild : 태그와 태그 사이에 태그 첨부
		- html() : 한번만 사용(덮어쓰기) vs append() : 여러번 사용(추가)
		- 
		

 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	let h1=document.querySelector("h1")
	let val=h1.textContent
	console.log("val:"+val)
	
	val=$('h1').text()
	console.log("text():"+val)
	
	h1.textContent="바닐라 JS 이용"
	$('h1').text("JQuery JS 이용")
	
	let h2=document.querySelector('h2')
	h2.innerHTML='<font color=red>순수 JavaScript</font>'

	$('h2').html('<font color=green>JQuery 사용1</font>')
	$('h2').html('<font color=blue>JQuery 사용2</font>')
	
	alert($('div').html())
	
	
})
</script>
</head>
<body>
<h1>Hello JQuery</h1>
<h2>Hello JQuery</h2>
<h3>Hello JQuery</h3>
<h4>Hello JQuery</h4>
<h5>Hello JQuery</h5>
<div>
	<h6>Div 안에 h1</h6>
	<h6>Div 안에 h2</h6>
	<h6>Div 안에 h3</h6>
</div>
</body>
</html>