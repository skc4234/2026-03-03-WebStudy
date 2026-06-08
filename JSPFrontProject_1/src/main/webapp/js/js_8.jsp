<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	JavaScript
	- 변수 : 자동 데이터형
		- let : 변수
		- const : 상수
	
	- 연산자
		- ===, !== : 값이 같아도 데이터형이 다르면 false
		- 비교 연산자는 숫자, 문자, 날짜도 비교 가능하다
		- + : 숫자 덧셈, 문자열 결합
		- / : 정수/정수=실수
	
	- 제어문
		- if, else if : 조건문
		- for : 반복문, for(let i=0; i<10; i++)
		- for in : for(변수 in 배열) : 인덱스 번호 반환
		- for of : for(변수 of 배열) : 실제 데이터값 반환
		- forEach : 배열.forEach(function(){//}) : 일반 반복문
		- map : 배열.map(()=>{//}) : 새로운 배열 생성
	
	- 배열 : 관련된 데이터를 모아서 관리(Object)
		- 객체(JSON)
		- DOM => HTML 태그 제어(CSS 선택자 사용)
		- DOMScript => JQuery3/4, VueJS, ReactJS
		- 형식 : [값,값,값,...] => 데이터형이 다를 수 있다

	- 이벤트 처리
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container {
	margin-top: 50px
}
.row {
	margin: 0px auto;
	width: 800px;
}
</style>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript">
window.onload=function() {
	// $(function(){}) : JQuery
	// mounted() : Vue
	// componentDidMount() : React
	// useEffect() : React Hooks
	// => main과 동일한 함수(자동 호출)
	let arr=[];
	axios.get('js_8.do')
		.then(response=>{
			console.log(response.data)
			let html=''
			let data=response.data
			data.map((emp)=>{
				html+='<tr>'
					+'<td>'+emp.empno+'</td>'
					+'<td>'+emp.ename+'</td>'
					+'<td>'+emp.job+'</td>'
					+'<td>'+emp.dbday+'</td>'
					+'<td>'+emp.dname+'</td>'
					+'<td>'+emp.loc+'</td>'
					+'</tr>'
			})
			let tbody=document.querySelector("tbody")
			// DOM
			tbody.innerHTML=html
			/*
				1. document.write()
				2. alert()
				3. innerHTML => 지정된 태그에 값을 첨부
					JQuery => html()
				4. VueJS는 태그에서 처리 => 값을 서버에서 받으면 자동으로 HTML 적용(양방향)
					React는 HTML을 만들어서 추가 : 단방향
					
				1) 배열 []
				2) 객체 : JSON {}
				3) 함수
				4) DOM => 원하는 태그를 가지고 온다
					querySelector("tbody")
			*/
		})
}

</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<h3 class="text-center">사원 목록</h3>
			<table class="table">
				<thead>
					<tr class="danger">
						<th>사번</th>
						<th>이름</th>
						<th>직위</th>
						<th>입사일</th>
						<th>부서명</th>
						<th>근무지</th>
					</tr>
				</thead>
				<tbody>
				
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>