<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	글자 조작
	- 장바구니 => 결제 시 목록 변경
	innerHTML : HTML 포함 가능 => $().html()
	textContent : 글자만 변경 => $().text()
	
	h1.style.backgroundColor
	h1.style.backgroundImage
	// => css 스타일 속성에서 -를 빼고 대문자를 붙인다
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=()=>{
	let a=document.getElementById('a') // id명만
	let b=document.querySelector('#b') // CSS 선택자 사용
	a.textContent="문자조작"
	b.innerHTML="<font color=red>문자조작</font>"
	b.style.border="3px solid green"
	
	let btn=document.querySelectorAll('button')
	btn[0].textContent="취소"
	btn[1].style.backgroundColor="yellow"
	
	document.body.style.backgroundColor="pink"
}
</script>
</head>
<body>
<button type="button">글자변경</button>
<button type="button">HTML 추가</button>
<br>
<h1 id="a">Hello 문자 조작(textContent)</h1>
<h1 id="b">Hello 문자 조작(innerHTML)</h1> 
<%--
	JavaScipt : id가 중복이면 오류
	CSS : id가 중복되도 적용
 --%>
</body>
</html>