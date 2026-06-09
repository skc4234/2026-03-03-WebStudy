<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	- 이벤트 처리 방법
		- **인라인**
		- 고전적
		- **리스너**
		
	- 이벤트 리스너 사용
	img.addEventListener('click',()=>{})
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=()=>{
	let h1=document.getElementById('h1')
	let gBtn=document.querySelector('#green')
	let bBtn=document.getElementById('blue')
	let rBtn=document.getElementById('red')
	
	gBtn.addEventListener('click',()=>{
		h1.style.color="green"
	})
	bBtn.addEventListener('click',()=>{
		h1.style.color="blue"
	})
	rBtn.addEventListener('click',()=>{
		h1.style.color="red"
	})
	// JQuery : $('#green').on("click",()=>{})
	// Vue : <button @click="처리함수">
	// React : <button onClick={처리함수}>
}
</script>
</head>
<body>
<h1 id="h1">제목</h1>
<button id="green">green</button>
<button id="blue">blue</button>
<button id="red">red</button>
</body>
</html>