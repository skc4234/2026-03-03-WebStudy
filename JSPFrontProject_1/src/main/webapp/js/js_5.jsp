<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	제어문
	- 조건문
		- **단일조건문**
			```
			// 조건문 : 부정연산자 / 비교연산자 / 논리연산자 
			//   => 조건문이 0,0.0,'',"",null이 아니면 true
			if(조건문) {
				// 조건이 true일때 수행하는 문장 => false일때는 건너뜀
			}
			```
		- **선택조건문**
			```
			// 삼항연산자와 동일
			if(조건문) {
				// 조건이 true일때 수행하는 문장
			}
			else {
				// 조건이 false일때 수행하는 문장
			}
			```
		- 다중조건문
			```
			// 첫번째 조건이 false면 다음 else if 조건 확인
			//   => else if 조건이 모두 false면 else 수행 
			if(조건문1) {
				// 조건문1이 true일때 수행하는 문장
			}
			else if(조건문2) {
				// 조건문2이 true일때 수행하는 문장
			}
			else if(조건문3) {
				// 조건문3이 true일때 수행하는 문장
			}
			else {
				// 모든 조건이 false일때 수행하는 문장
			}
			```
			- 유효성 검사 등에서 사용
		
		- 선택문
			```
			switch(number/문자) {
				case 값1:
					처리문장
					break // 없으면 밑에 문장 계속 수행 => break가 있을때까지
				case 값2:
					...
				...
				default:
					처리문장
			}
			```
		
	- 반복문
		- do-while
		- while
		- **for**
			- for in
			- **for of**
			- **forEach**
			- **map**
	- 반복제어문
		- **break**
		- continue
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript">
window.onload=function() {
	//movieList(1)
	let i=3
	switch(i) {
	case 1:
		document.write("<h1>i=1</h1>")
	case 2:
		document.write("<h1>i=2</h1>")
	case 3:
		document.write("<h1>i=3</h1>")
	case 4:
		document.write("<h1>i=4</h1>")
	case 5:
		document.write("<h1>i=5</h1>")
		break
	}
}

// 리턴형이 없다
// 매개변수는 변수명만 사용
/*
	searchMainDailyBoxOffice.do
	searchMainRealTicket.do
	searchMainDailySeatTicket.do
 */
function movieList(no) {
	let site="https://www.kobis.or.kr/kobis/business/main/"
	if(no===1) {
		site+="searchMainDailyBoxOffice.do"
	}
	else if(no===2) {
		site+="searchMainRealTicket.do"
	}
	else if(no===3) {
		site+="searchMainDailySeatTicket.do"
	}
	axios.get(site).then(response=>{
		console.log(response.data)
	})
}
</script>
</head>
<body>
	
</body>
</html>