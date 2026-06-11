<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	JQuery : DOM(태그 제어하는 프로그램)
	1. 태그 선택 : $('CSS 선택자')
		- id    : # 
		- class : .
		- 속성 선택자 : 태그[속성=값], 태그[속성*=값] : 포함
		- 자손/후손 : ('태그 태그'), ('태그' > '태그')
		- 구조 선택자 : 태그명(eq), nth-child
	2. 변경
		- input / select / textarea
		- 속성 : $(태그).attr('속성명',값)
		- 값 : $(태그).text() : getter / $(태그).text(값) : setter
		- HTML 추가 : $(태그).html(HTML이 포함된 값)
		- 여러개 추가 : prepend():위에 추가, append()" : 다음 행에 추가
		- 스타일 변경 : 
			- $(태그).css({
					"color: "red",
					"backgroudColor: "blue"
				})
		
	3. 이벤트 처리
		- $(태그).click(function(){})
		- $(태그).on('click',function(){})	
	
	4. 서버 연결
		
	-------------------------------------------------
	5. 효과(적당히) / 애니메이션
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){ // $(document).ready(function(){})
	$('#btn1').on('click',function(){
		let len=$('input[type=checkbox]:checked').length
		alert("선택된 취미는 "+len+"개 입니다")	
	})
	$('#btn2').on('click',function(){
		$('input[type=checkbox]').prop('checked',true)
	})
	$('#btn3').on('click',function(){
		$('input[type=checkbox]').prop('checked',false)
	})
})
</script>
</head>
<body>
	<button id="btn1">확인</button>
	<button id="btn2">전체</button>
	<button id="btn3">해제</button>
	<p>
	<input type="checkbox" checked>낚시
	<input type="checkbox" checked>운동
	<input type="checkbox" checked>독서
	<input type="checkbox" checked>등산
	<input type="checkbox" checked>게임
</body>
</html>