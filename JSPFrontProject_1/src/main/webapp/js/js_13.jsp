<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	기본 문법
		- 변수 선언(ES6 => let/const)
		- 연산자(산술,단항,비교,논리,대입), 삼항연산자
		- 제어문
			- if / if~else / for / forEach / map
		- ArrayList : [] , VO : {}
		- 함수
		- 이벤트 처리
		- 태그 제어 => DOM
		- 내장함수(Number,Math,String,Date)
		- 브라우저 내장 객체(BOM)
			- window / location / history / document
		- 외부 라이브러리 : JQuery / Vue / React
		- HTML 태그 / CSS 선택자 등
		- 서버와 JavaScript 연동 => Ajax / fetch / axios
			- async / await => 비동기
		
		라이브러리 함수
		- document.querySelector("tbody")
			=> JQuery : $('tbody')		
		
		
	- JavaScript 함수
		- function(){}
		- 명령문(변수/연산/제어)의 집합 : 명령문 여러개를 모아서 한개의 기능 생산
		- 구조화된 프로그램 : 기능별 분리
		- 함수와 메소드 차이
			- 함수는 독립적으로 사용 가능하다
			- 메소드는 클래스에 종속되어 있다(자바)
		- 브라우저 안에서 요청이 있는 경우(로그인 / 목록출력 / 페이지 등)
		- 반복제거 / 재사용이 가능하다 / 에러 처리가 쉽다
		- JavaScript에서 함수는 데이터형이다 => typeof 함수 : function
		- 함수는 매개변수로 사용할 수 있다 => CallBack 함수
			- names.map(function(){}) => 자동으로 호출되는 함수 => CallBack
		
	- 함수 제작 방법
		- 선언적 함수
			```
			function 함수명(매개변수) { // 선언부
				// 구현부
			}
			
			// 리턴형을 기재하지 않음
			// 매개변수는 변수명만 설정
			function login(id,pwd) {
				// 로그인 처리
			}
			```
			-----------------------------------
			 리턴형(처리결과값)   매개변수(사용자 요청값)
			-----------------------------------
			 		O                O
			 function 함수명(매개변수) {
			 	...
			 	return 값
			 }
			-----------------------------------
					O				 X
			 function 함수명() {
			 	return 값
			 }
			-----------------------------------
					X                O
			 function 함수명(매개변수) {
			 	...
			 }
			-----------------------------------
					X                X
			 function 함수명() {
			 	...
			 }
			-----------------------------------
			
			- 자바스크립트
				- 외부 스크립트 : .js 파일을 import => 여러 파일에서 동시 사용 가능, 소스가 긴 경우 사용
					- <script src="파일명">
				- 내부 스크립트 : 한 파일에서만 작업
					<script>
						function aaa() {}
					</script>
				- 인라인 스크립트 : 태그 한개만 제어
					<button onclick="javascript:history.back()">
				
		- 익명의 함수 : 함수 안에 함수를 선언할 수 있다
			```
			let 변수명=function(){}
			```
		- 화살표 함수 : function, return 제거
			```
			let 변수명=()=>{}
			```
		- 콜백 함수
			```
			// forEach, map 등
			function 함수명(function aaa(){}){}
			```
	
	- 함수의 구성 요소
		- 선언부
			- 함수명, 매개변수 선언, 데이터형은 표기하지 않는다
		- 구현부
			- 변수 선언, 연산처리, 제어문
			
			
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
/* function plus(a,b){
	return a+b
}
let plus2=function(a,b){
	return a+b
}

// 화살표 함수
let plus3=(a,b)=>{
	return a+b
}
let plus4=(a,b)=>a+b

window.onload=()=>{
	// ;은 생략 권장
	let a=10
	let b=20
	let c=plus(a,b)
	let d=plus2(a,b)
	let e=plus3(a,b)
	let f=plus4(a,b)
	document.write("c="+c+", type="+typeof plus+"<br>")
	document.write("d="+d+", type="+typeof plus2+"<br>")
	document.write("e="+e+", type="+typeof plus3+"<br>")
	document.write("f="+f+", type="+typeof plus4+"<br>")
	
	func(callback)
}

let callback=()=>{
	document.write("함수 call<br>")
}

function func(call) {
	for(let i=0; i<=10; i++) {
		call()
	}
} */
window.onload=()=>{
	function display() {
		alert("display call...")
	}
	display()
}
</script>
</head>
<body>

</body>
</html>