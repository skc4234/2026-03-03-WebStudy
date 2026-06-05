<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	연산자
		- 자바스크립트에서 지원하는 연산자
		1) 단항연산자 
			- 증감연산자(++,--)
			- 부정연산자(!)
			- 형변환 연산자(Number(), String(), parseInst(), Boolean
		2) 이항연산자
			- 산술연산자 : +,-,*,/,%
			- 비교연산자 : ==,!=,>=,<=
						===, !== (데이터형까지 확인)
		3) 삼항연산자
			- 조건 ? 값1 : 값2
			- 조건이 true면 값1, 아니면 값2
			
		- Vue/React는 <script type="text/babel"> ==> <script> (생략 가능)

 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%--
<script type="text/javascript">
	// 1. 단항연산자(증감,부정,형변환)
	let a=10
	document.write("<h1> 증가전:"+a+"</h1>")
	a++
	document.write("<h1> 증가후:"+a+"</h1>")
	a--
	document.write("<h1> 감소후:"+a+"</h1>")
	document.write("<hr>")
	
	a=10
	let b=a++
	document.write("<h1> a="+a+"</h1>")
	document.write("<h1> a="+b+"</h1>")
	
	a=10
	b=++a
	document.write("<h1> a="+a+"</h1>")
	document.write("<h1> a="+b+"</h1>")
	document.write("<hr>")
	// document : 화면을 출력하는 브라우저 영역
		
	let c=true
	document.write("c="+c+"<br>")
	c=!c
	document.write("c="+c+"<br>")
	
	c=0.0 // 0, 0.0이 아닌 수는 true
	document.write("c="+c+"<br>")
	c=!c // 자동 boolean형변환
	document.write("c="+c+"<br>")
	
	document.write("<hr>")
	
	// 형변환 연산자
	let a1=10
	document.write("a1="+a1+",type="+typeof a1+"<br>")
	a1=String(a1)
	document.write("a1="+a1+",type="+typeof a1+"<br>")
	//a1=parseInt(a1)
	a1=Number(a1)
	document.write("a1="+a1+",type="+typeof a1+"<br>")
	//a1=0
	a1=Boolean(a1)
	document.write("a1="+a1+",type="+typeof a1+"<br>")
	
	document.write("Boolean('Hello JavaScript')="+Boolean('Hello JavaScript')+",type="+
			typeof Boolean('Hello JavaScript')+"<br>")
	document.write("Boolean('')="+Boolean('')+",type="+
			typeof Boolean('')+"<br>")
	document.write("Boolean(\"\")="+Boolean("")+",type="+
			typeof Boolean("")+"<br>")
	document.write("<hr>")
	</script>
--%>
<script type="text/javascript">
function calc() {
	let f=document.getElementById("first").value
	let s=document.getElementById("second").value
	console.log("f="+f+",type="+typeof f)
	console.log("s="+s+",type="+typeof s)
	let span=document.getElementById("result")
	span.innerHTML="<h2>"+(Number(f)+parseInt(s))+"</h2>"
	/*
		1. 문자열=>숫자 : Number()/parseInt()
		2. 숫자=>문자열 : String()
		3. 논리형 변환 : Boolean()
						0, 0.0,'',"",null 은 false, 나머지는 true
	*/
}
</script>
</head>
<body>
	첫번째 값 : <input type="text" id="first" size="10"><br>
	두번째 값 : <input type="text" id="second" size="10"><br>
	<input type="button" value="계산" onclick="calc()"><br>
	<span id="result"></span>
</body>
</html>