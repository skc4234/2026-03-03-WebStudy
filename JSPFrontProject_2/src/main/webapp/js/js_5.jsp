<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	- 제어문(조건문, 반복문)
	- 배열, 객체(JSON)
	- 함수
	- DOM - 태그 조작
		- document.querySelector()
		- document.getElementById()
		- document.querySelectorAll()
		- 문자변경 : innerHTML, textContent
		- 스타일 변경 : 태그.style.속성
		- 속성 변경 : <img src=""> , <a href="">
	- Vue, React는 함수가 없다 => 바닐라 JS를 사용해서 변경
	
	이벤트 처리
		- 사용자가 브라우저 안에서 어떤 동작을 한 경우 처리
		- 마우스 동작
			- onclick : 버튼, 이미지 등 클릭
			- onmouseover / onmouseout : 이미지 등에서 마우스 out/over
		- 키보드 동작
			- onkeydown / onkeyup : text / textarea
		- form 전송 동작
			- onchange / onsubmit : select / table
			
	- 이벤트 처리 방법
		- 인라인 처리 : Vue, React 등
			- <button onclick="함수호출">
			- <button v-on:click="함수호출">
			- <button @click="함수호출">
		- 고전적인 처리 : JQuery : $().click(()=>{})
			- 태그명.onclick(()=>{})
		- 이벤트 리스너 처리 : JQuery : $().on('click',()=>{})
			- 태그명.addEventListener('click',()=>{})
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
// 1. 인라인 이벤트
function btnClick(){
	alert("버튼 클릭")
}

// 2. 고전적 방법

</script>
</head>
<body>
<button type="button" onclick="btnClick()">클릭</button>
</body>
</html>