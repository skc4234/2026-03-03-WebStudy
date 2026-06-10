<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	자바스크립트 => 기본 문법
		- 태그 선택(브라우저에서 태그 제어, 추가, 삭제, 데이터 수정)
		- 화면을 유지하면서 동적으로 내용변경
		- JSP ===> 채팅 ====> 전에 있던 내용이 사라짐
							=> MongoDB , Redis 사용
		
		1. CSS 선택자
		<div>
			<p></p> ==> div p
			<span>
				<p></p> ==> div span p
			</span>
		</div>
		
		1-1. 구조 선택자
		nth-child(1) ... 
		
		2. 자바스크립트에서 지원하는 객체 모델
			1. id 속성
			2. class 속성
			3. name 속성
			4. tag명 
		    5. 
		- 문자 조작
			- textContent : 순수하게 문자열만 출력 => HTML 파싱 불가
			- innerHTML : HTML 파싱이 가능
		- 스타일 조작
			- 태그.style.backgound
			
			
		3. 이벤트 처리
		- 인라인 : <button onclick="함수">
		- 고전 : btn.onclick=function(){}
		- 리스너 : btn.addEventListener('click',function(){})
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container {
	margin-top: 30px
}
.row {
	margin: 0px auto;
	width: 600px;
}
</style>
<script type="text/javascript">
function gesan() {
	let kor=document.getElementById('kor')
	if(kor.value==="") {
		kor.focus()
		return
	}
	let eng=document.getElementById('eng')
	if(eng.value==="") {
		eng.focus()
		return
	}
	let math=document.getElementById('math')
	if(math.value==="") {
		math.focus()
		return
	}
	
	// 계산
	let total=document.getElementById("total")
	let hap=Number(kor.value)+parseInt(eng.value)+parseInt(math.value)
	total.value=hap
	
	let av=hap/3
	let avg=document.getElementById("avg")
	avg.value=av
	
	let score='A'
	if(av>=90) score='A'
	else if(av>=80) score='B'
	else if(av>=70) score='C'
	else if(av>=60) score='D'
	else score='F'
	
	document.getElementById('score').value=score
}
window.onload=()=>{
	// 태그 읽기
	let h2=document.querySelectorAll('h2') // []
	for(let i of h2) {
		i.style.backgroundColor='green'
		i.textContent="Hello JaavaScript"
	}
	
	let acc=document.querySelector('#account')
	Number(price.textContent)
	
}
</script>
</head>
<body>
<div class="container">
	<div class="row">
		<h1 class="text-center">성적 계산</h1>
		<table class="table">
			<tr>
				<th width="35%">국어</th>
				<td width="65%"><input type="text" class="input-sm" size=20 id=kor></td>
			</tr>
			<tr>
				<th width="35%">영어</th>
				<td width="65%"><input type="text" class="input-sm" size=20 id=eng></td>
			</tr>
			<tr>
				<th width="35%">수학</th>
				<td width="65%"><input type="text" class="input-sm" size=20 id=math></td>
			</tr>
			<tr>
				<td colspan="2" class="text-center">
					<input type="button" class="btn-sm btn-info" id=btn onclick="gesan()" value="계산">
				</td>
			</tr>
		</table>
		<h1 class="text-center">계산결과</h1>
		<table class="table">
		<tr>
			<th width="35%">총점</th>
			<td width="65%"><input type="text" class="input-sm" size=20 id=total readonly></td>
		</tr>
		<tr>
			<th width="35%">평균</th>
			<td width="65%"><input type="text" class="input-sm" size=20 id=avg readonly></td>
		</tr>
		<tr>
			<th width="35%">학점</th>
			<td width="65%"><input type="text" class="input-sm" size=20 id=score readonly></td>
		</tr>
		</table>
	</div>
	<div class="row">
		<h2>Hello DOM-1</h2>
		<h2>Hello DOM-2</h2>
		<h2>Hello DOM-3</h2>
		<h2>Hello DOM-4</h2>
		<h2>Hello DOM-5</h2>
	</div>
	<div class="row">
		<table class="table">
		<tr>
			<td>수량:<select id=account>
				<option value="1">1개</option>
				<option value="2">2개</option>
				<option value="3">3개</option>
				<option value="4">4개</option>
				<option value="5">5개</option>
				</select>
			</td>
		</tr>
		<tr>
			<td></td>
		</tr>
		<tr>
			<td></td>
		</tr>
		</table>
	</div>
</div>
</body>
</html>