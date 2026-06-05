<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	- 단일조건문, 선택조건문, 반복문(for)
	
	
	반복문
	- do~while : 반드시 한번 이상 수행 => 조건을 나중에 검색
		```
		초기값 => 1
		do {
			반복문장 => 2
			증가식 => 3
		} while(조건문) => 4 가 false면 종료
		```
	- while : 반복 횟수가 정해지지 않을때 사용
		```
		초기값 => 1
		while(조건문) { => 2 가 false면 종료
			반복문장 => 3
			증가식 => 4
		}
		
		```
	- **for** : 정해진 반복 횟수가 있을때 사용
		```
		for(초기값;=>1 조건식;=>2 증가식=>4) {
			반복문장 => 3
		}
		```
	
	
 --%>
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function() {
	let i=1
	do {
		document.write("<h3>"+i+"</h3>")
		i++
	} while(i<=10)
	
	document.write("<hr>")
	
	i=1
	while(i<=10) {
		document.write("<h3>"+i+"</h3>")
		i++
	}
	
	document.write("<hr>")
	
	i=1
	for(i=1; i<=10; i++) {
		document.write("<h3>"+i+"</h3>")
	}
}
</script>
</head>
<body>

</body>
</html>