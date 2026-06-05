<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	- JQuery, Vue, React => JavaScript 기반 => 문법은 같다
	- Web
		1. BackEnd : Java => JSP/MVC/SpringFramework/SpringBoot
		2. DataBase : 오라클(SQL) => JDBC/DBCP/ORM(MyBatis/JPA)
		3. Front : HTML/CSS/JavaScript/Jquery/Vue/React
		4. CI/CD : 운영체제(Ubuntu)/Git(Actions)/Docker(이미지 저장, DockerHub)
					Docker-compose/쿠버네티스/Jenkins/AWS

	- 이항연산자
		- 산술연산자
			=> +, -, *, /, %
			=> 연산이 안되는 경우 : NaN
			=> 0으로 나눌 수 없다
			=> 정수/정수 => 실수 / 자바와 다르다
			=> % : 왼쪽 부호가 남는다
		- 비교연산자 : 장점 => 문자열/날짜를 비교할 수 있다
			== : 데이터형과 관련 없이 비교  10=='10' true
			=== : 데이터형도 비교해서 본다  10==='10' false
			!= : 
			!== : 
			<,>,<=,>=
		- 논리연산자
		- 대입연산자
	
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	let a=5
	let b=2
	console.log("a+b="+(a+b))
	console.log("a-b="+(a-b))
	console.log("a*b="+(a*b))
	console.log("a/b="+(a/b))
	console.log("a%b="+(a%b))
	// 장바구니 총액(금액*수량) / 예약 총액()
	
	let c="10"
	let f=20000
	console.log("c+f="+(c+f)) // 문자열 결합
	console.log("c+f="+(parseInt(c)+f)) // NaN
	
	/*
		주의점
		- 숫자가 아닌데 연산처리 => 연산 불가능(NaN)
		- "10"은 연산처리 가능
		- "",'' => 문자열
		- HTML을 통해서 가져온 숫자는 문자열로 읽어온다
	*/
	
	let m=10
	let n='10'
	console.log("m==n : "+ (m==n))
	console.log("m!=n : "+ (m!=n)) // 회원가입 / 검색 / 로그인
	console.log("m===n : "+ (m===n)) // ID 유효성 검사 => id==='' true면 빈칸
	console.log("m!==n : "+ (m!==n)) // 비밀번호 재입력 => pwd!==pwd1 true면 비밀번호 틀림
	console.log("m>n : "+ (m>n)) // 이메일(정규식)
	console.log("m<n : "+ (m<n)) // HTML5 => required
	console.log("m>=n : "+ (m>=n))
	console.log("m<=n : "+ (m<=n))
}
function ok() {
	let frm=document.frm
	if(frm.id.value==='') {
		alert("아이디 입력하세요!!!")
		return
	}
	if(frm.pwd.value==='') {
		alert("비밀번호 입력하세요!!!")
		return
	}
	if(frm.pwd1.value==='') {
		alert("비밀번호 재입력하세요!!!")
		return
	}
	if(frm.pwd.value!==frm.pwd1.value) {
		alert("비밀번호가 일치하지 않습니다.")
		return
	}
}
</script>
</head>
<body>
<form name="frm">
	ID:<input type="text" name=id size=15><br>
	PASSWORD:<input type="password" name=pwd size=15><br>
	비밀번호 재입력:<input type="password" name=pwd1 size=15><br>
	<input type="button" value="확인" onclick="ok()">
</form>
</body>
</html>