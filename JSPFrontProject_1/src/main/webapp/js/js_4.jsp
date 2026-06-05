<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	논리연산자 : &&, ||
	- && : 직렬 연산자 => 조건이 모두 true일때만 true
	- || : 병렬 연산자 => 조건 중 하나라도 true가 있으면 true
		===========================
		조건1   조건2     &&     ||
		===========================
		true   true    true   true
		===========================
		true   false   false  true
		===========================
		false  true    false  true
		===========================
		false  false   false  false
		===========================

 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	let i=(6<7)&&(6==7) // true && false
	console.log(i)
	let j=(6<7)||(6==7) // true || false
	console.log(j)
	
	/*
		대입연산자
		=,+=,-=
	*/
	let k=10
	k+=10
	console.log("k="+k)
	k-=10
	console.log("k="+k)
	
	// 삼항연산자
	let g=(6%2==0)?"짝수":"홀수"
	console.log("g="+g)
	
	let h=10/0  // infinity
	console.log("h="+h)
	
	/*
		1. 연산처리가 불가능 : null, 값이 없는 경우(서버 / 입력값 등)
			=> NaN (산술연산)
		2. Infinity : 0으로 나눈 경우
		3. undefined : 변수의 초기값이 없는 경우
		4. HTML에서 입력값을 가지고 오는 경우 => string
		5. 정수/정수 = 실수
		6. 단점 : 서버를 연결할 수 없다 => 라이브러리 사용(Ajax, Axios)
		7. == / !=  --->   === / !==
	*/
	
</script>
</head>
<body>

</body>
</html>