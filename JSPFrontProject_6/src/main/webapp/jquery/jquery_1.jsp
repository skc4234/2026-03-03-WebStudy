<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	JQuery 효과
	- 댓글 처리, 삭제 등에서 효과 주기
	- **hide**
		- 해당 태그를 감추기
		- CSS3 : display: none;
	- **show**
		- 해당 태그 보여주기
		- CSS3 : display: '';
	- toggle
		- ON/OFF 등의 버튼
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- import JQuery --%>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	// 바닐라 JS
	// let hide=document.querySelector('#hideBtn')
	// hide.addEventListener('click',function(){})
	// JQuery
	$('#hideBtn').on('click',function(){
		// css 선택자 => 태그 선택 => 태그 제어 프로그램(DOMScript)
		$('#id').hide(1000) // 1초
	})
	$('#showBtn').on('click',function(){
		$('#id').show('slow')
	})
	$('#toggleBtn').on('click',function(){
		$('#id').toggle(5000)
	})
})
</script>
</head>
<body>
	<button id="hideBtn">숨기기</button>
	<button id="showBtn">보이기</button>
	<button id="toggleBtn">Toggle</button>
	<div>
		<input type="text" id="id" size=20>
	</div>
</body>
</html>