<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
/*
	선언적 함수
	function aaa(a,b){return a+b}
	
	- 익명의 함수
	let bbb=function(a,b){return a+b}
	
	- 화살표 함수
	ccc=(a,b)=>a+b
	
	----- 1개만 가지고옴 -----
	let h2=document.querySelector('h2') // => $('h2')
	let h4_1=document.getElementById("h4")
	----- 여러개 => 배열[] -------
	let h4_2=document.getElementsByClassName("h4")
	let h4_3=document.getElementsByName("h4")
	document.getElementsByTagName()
	document.querySelectorAll()
*/
window.onload=()=>{
	let h2=document.querySelector('h2')
	h2.style.color="blue"
	let h3=document.querySelector('h3')
	h3.style.color="green"
	let color=["cyan","pink"]
	let h1=document.querySelectorAll('h1')
	for(let i=0; i<h1.length; i++) {
		h1[i].style.color = color[i]
	}
	
	let h4_1=document.getElementById("h4")
	let h4_2=document.getElementsByClassName("h4")
	let h4_3=document.getElementsByName("h4")
	h4_1.style.background="red"
	h4_2[0].style.background="blue"
	h4_3[0].style.background="gray"
}
</script>
</head>
<body>
<h1>Hello DOM-1</h1>
<h2>Hello DOM</h2>
<h3>Hello DOM</h3>
<h1>Hello DOM-2</h1>
<h4 id="h4">Hello DOM</h4>
<h4 class="h4">Hello DOM</h4>
<h4 name="h4">Hello DOM</h4>
</body>
</html>