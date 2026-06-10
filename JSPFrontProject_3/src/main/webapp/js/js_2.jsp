<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	내장 객체
	- Number
		- parseInt() : 숫자 변환
		- toLocaleString() : 1,000,000 ,표시
	- String
		- 문자열의 인덱스 : 0부터 시작(자바와 동일)
		- length() : 문자열의 길이(비밀번호 유효성 검사, 입력 확인 등)
		- indexOf() / lastIndexOf() : 문자 인덱스 번호 찾기
		- replace(a,b) : a문자를 b문자로 변환
		- replaceAll(regex) : 정규식을 이용한 변환
		- split() : 문자열을 쪼개서 배열로 반환
		- substring(startIndex, lastIndex) : startIndex부터 lastIndex-1까지 반환
		- **substr(index, count)** : index부터 count개수 만큼(오라클 substring과 동일)
		- trim() : 좌우 공백 제거
		- startsWith / endsWith / contains(x) ==> **includes** : 문자열 포함 여부
		
	- Array
		- push() : 배열의 마지막 행에 삽입
		- pop() : 배열의 마지막 행 제거
		- slice() : 원하는 인덱스 위치에서 배열을 나눔
		- length() : 배열에 있는 데이터 개수 반환
		- find() : 배열 찾기
		
	- Date
		- year(년) : new Date().getFullYear()
		- month(월) : new Date().getMonth() // 0부터 시작, 0=>1월
		- date(일) : new Date().getDate()
		- day(요일) : new Date().getDay() // 1=월요일, 0=일요일
		- fullcalendar : 날짜 라이브러리, Date보다 편함
	
	- Math
		- round() : 반올림
		- ceil() : 올림
		
		
	- **BOM(브라우저 내장객체)**
		- window
			- open()
			- close()
		- location
			- href() : 화면 이동(sendRedirect와 동일)
		- history
			- back() : 이전 페이지(=go(-1)) 
		- document
			- 객체모델 선택자(querySelector 등) / 화면 출력(write 등)
		- alert() : 알림 메시지
		
	---------------------------
	라이브러리화 => JQuery


 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=()=>{
	// 예약, 결제일 => SYSDATE
	// 댓글 => Date(JavaScript) => 몇분전, 몇초전 등
/* 	let today=new Date()
	let year=today.getFullYear()
	let month=today.getMonth()+1
	let date=today.getDate()
	let week=today.getDay()
	let strWeek=['일','월','화','수','목','금','토']
	document.write("<h1>오늘은 "+year+"년 "+month+"월 "+date+"일 "+strWeek[week]+"요일입니다</h1>") */

	// 1. String 함수
	// split() : 문자열을 나눠서 배열로 반환
	let str='red,black,pink,yellow,blue,cyan,green'
	let colors=str.split(',') // colors=[red,black,...]
	let html='<ul>'
	colors.forEach((color)=>{
		html+='<li>'+
			color+'</li>'
	})
	html+='</ul>'
	document.body.innerHTML=html
}
</script>
</head>
<body>

</body>
</html>