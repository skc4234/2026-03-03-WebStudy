<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	배열 함수
	- 추가
		- push : 마지막에 추가
	- 삭제
		- pop : 마지막 부터 삭제
	- 갯수
		- length
	- **자르기**
		- slice(start,end) : 자바스크립트 페이징 기법
	- 찾기
		- find()
	- 배열 복사
		- 스코프 연산자 ... => react에서 자주 사용
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=()=>{
	let names=["홍길동","이순신","심청이","박문수","강감찬"]
	document.write("<h3>원본 배열</h3>")
	document.write("<ul>")
	names.map((name)=>{
		document.write("<li>"+name+"</li>")
	})
	document.write("<li>총인원 : "+names.length+"</li>")
	document.write("</ul>")
	
	
	document.write("<hr>")
	
	document.write("<h3>배열 추가</h3>")
	names.push("을지문덕")
	document.write("<ul>")
	names.map((name)=>{
		document.write("<li>"+name+"</li>")
	})
	document.write("<li>총인원 : "+names.length+"</li>")
	document.write("</ul>")
	
	document.write("<hr>")
	
	document.write("<h3>배열 삭제 : pop(마지막), shift(처음)</h3>")
	names.pop() // 마지막에 있는 데이터 삭제
	names.shift() // 제일 처음에 있는 데이터 삭제
	document.write("<ul>")
	names.map((name)=>{
		document.write("<li>"+name+"</li>")
	})
	document.write("<li>총인원 : "+names.length+"</li>")
	document.write("</ul>")
	
	document.write("<hr>")
	
	document.write("<h3>배열 자르기 : slice(start) => 새로운 배열 생성</h3>")
	let names2=names.slice(2) // 인덱스 2번부터 자름(0,1 제외)
	document.write("<ul>")
	names2.map((name)=>{
		document.write("<li>"+name+"</li>")
	})
	document.write("<li>총인원 : "+names2.length+"</li>")
	document.write("</ul>")
	
	document.write("<hr>")
	
	document.write("<h3>배열 자르기 : slice(start, end) => 새로운 배열 생성</h3>")
	let names3=names.slice(1,3) // 인덱스 1번부터 (3-1)번까지(end 인덱스 제외)
	document.write("<ul>")
	names3.map((name)=>{
		document.write("<li>"+name+"</li>")
	})
	document.write("<li>총인원 : "+names3.length+"</li>")
	document.write("</ul>")
	
	document.write("<hr>")
	
	document.write("<h3>배열 복사 : ...</h3>")
	let names4=[...names,"춘향이"]
	document.write("<ul>")
	names4.map((name)=>{
		document.write("<li>"+name+"</li>")
	})
	document.write("<li>총인원 : "+names4.length+"</li>")
	document.write("</ul>")
	
	
}
</script>
</head>
<body>

</body>
</html>