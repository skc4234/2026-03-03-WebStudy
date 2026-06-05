<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 

	자바스크립트
	1) 변수(let(변수), const(상수))
	2) 자료형 종류 - number,string,boolen,null,function,object,undifind
	3) 연산자
	4) 제어문(조건문,반복문,반복 제어문)
	5) 함수
	6) 배열/객체 => JSON
	====================== 기본 문법
	7) 태그 제어(HTML 화면 제어) => DOM
	8) 이벤트
	9) 비동기(async,awit) => Promise
	==================================>바닐라 JS  
	10) 라이브러리 - JQuery3 => JQuery4
	11) Vue3 => Vuex => Pinia => NustJS
	==> NodeJS / TypeScript
	12) React => Redux => TanStackQuery => NestJS
	
	- 웹구성(Front)
		- HTML : 웹페이지의 구조, 화면
		- CSS : 디자인, 스타일 변경
		- JavaScript : 동작, 기능처리
		- 전체 기반 => HTML(브라우저에서 실행하는 언어) 
	- 특징
		- 인터프리터(컴파일x) => 한줄씩 읽어서 출력
			- 단점 : 에러 처리가 어렵다 => 개발자 도구 사용
		- 동적 페이지 : 페이지 변경 없이 페이지 내에서 자체 처리
		- 비동기 처리가 가능
	
	- 사용처
		- 웹개발(동적 처리)
			- 로그인 처리 / 팝업창(아이디 중복체크, 우편번호 검색) / 검색어 처리 / 자동완성(서제스트)
			- JavaScript => Vue/React
		- Back-End 개발이 가능(서버) => NodeJS
		- 모바일 : React Native
		- 데스크탑 애플리케이션 : VSCode / VuErd
		- 게임 개발 / 실시간 채팅 / AI
		- 오렌지/스크렁크 : 데이터 분석(데이터 마이닝)
	
	- 어떤 언어인지
		- HTML과 CSS로 구성된 웹페이지를 동적으로 변경해준다
			- 정적 페이지 => 동적 페이지
	
	- 동작 방법
		- 내부 script
			- <script></script>
		- 외부 script
			- .js 파일로 만들어서 import
			- <script src="*.js">
		- 인라인 script
			- 태그 자체 처리
			- <button onclick="javascript:history.back()">
		- 페이지 시작 시 처리 : 변수선언, 제어문, 함수선언, 이벤트 등록 등
			- window.onload=function(){처리부분}
			- jquery : $(function(){})
			- vue : mounted(){}
			- react : componentDidMount(){}, useEffect()
	
	- 정의 : 웹브라우저에서 동작하는 스크립트 언어 => 단순한 언어
	- 용도 : 동적 페이지 제작, 서버 개발, 앱 개발
	- 실행환경 : 브라우저에서 실행
	- 특징 : 인터프리터, 객체 기반, 이벤트 중심
	
	1. 기본 문법
		- 변수 : 자동 인식 변수
			- var(ES5) => let(ES6)
			- const : 상수
			- 1개의 데이터를 저장하는 공간
			- 데이터형이 없다 : 값을 대입하면 자동으로 인식
			- var : 사용범위가 명확하지 않다 => 메모리 누수 현상 발생
			- let : 블록을 벗어나면 바로 사라진다 => 사용범위 명확, 메모리 누수 감소
			- const : 상수 : 값을 변경할 수 없다
			- 단점
				- 데이터형 확인이 어렵다
				```
				let a=10
				a=""
				a=[]
			- 1) 기본형 : number,string
			- 2) 참조형 : object, array, function
				- function을 데이터형으로 취급
				-  
		- ***서버 연결
			- List => [] (배열)
			- VO ===> {} (객체)
		- 
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
// main => 자동으로 실행되는 함수
window.onload=function() {
	/*
		프로그램에 필요한 변수 선언(var, let, const)
		
	
		- 출력 방법
			- console.log(변수) : 개발자 도구(명령 프롬프트)
			- document.write(출력) : 브라우저에 출력
			- alert() : 팝업
			- 원하는 태그안에 값 주입 : innerHTML
	*/
	// 1. 데이터형 확인
	let a=10
	let b=10
	let c="Hello JavaScript"
	let d='Hello JavaScript'
	let e=[1,2,3,4,5]
	let f={"name":"홍길동","age":20}
	let g=function(){}
	let m; // 값이 없는 경우 => undefined
	let k=true
	
	console.log("a="+a+",type="+typeof a)
	console.log("b="+b+",type="+typeof b)
	console.log("c="+c+",type="+typeof c)
	console.log("d="+d+",type="+typeof d)
	console.log("e="+e+",type="+typeof e)
	console.log("f="+f+",type="+typeof f)
	console.log("g="+g+",type="+typeof g)
	console.log("m="+m+",type="+typeof m)
	console.log("k="+k+",type="+typeof k)
	
	// 변수값 변경
	let aa="Hello JavaScript"
	aa="Hello JavaScript ES6"
	console.log("aa="+aa) // 문자열 결합
	
	var bb=10
	var bb=20
	console.log("bb="+bb)
	// let 변수는 var의 단점 보완 => let 사용 권장
	// 단점 : 한개 변수로 데이터형 변경 가능 => 가독성(데이터형 파악이 어려움)
	let cc
	cc="Hello"
	cc='Hello JavaScript'
	cc=true
	cc=function(){}
	
	const dd=10
	dd="Hello JS"
	console.log("dd="+dd)
}
/* window.onload=()=>{
	
} */
</script>
</head>
<body>

</body>
</html>