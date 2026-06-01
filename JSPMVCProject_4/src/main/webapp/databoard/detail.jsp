<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
	width: 900px;
}
h3 {
	text-align: center;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
/*
변수 설정      ---- 상수
var / let / const => 자동 데이터형 대입
      --- ES6
var은 지역변수 이지만 {} 밖에서도 사용 가능 => 사용영역이 명확하지 않다
let은 영역이 정해져 있다 => {} 벗어나면 자동 메모리 해제

- 데이터형 고정(TypeScript)
let s:string=""  // 데이터형을 바꿀 수 없다
*/
let i=0; // number(int, double)
$(function() {
	// $('#delSpan') => 바닐라JS => document.querySelector("#delSpan");
	$('#delSpan').on('click',function(){
		if(i===0) { // i==0 : 단순값만 비교 / i===0 : 데이터형 틀리면 false
			$(this).text("취소")
			$('#delTr').show()
			i=1;
		}
		else {
			$(this).text("삭제")
			$('#delTr').hide()
			i=0;
		}
	})
})
</script>
</head>
<body>
<div class="container">
	<div class="row">
		<table class="table">
			<tr>
				<th width="20%" class="success text-center">번호</th>
				<td width="20%" class="text-center">${vo.no }</td>
				<th width="20%" class="success text-center">작성일</th>
				<td width="20%" class="text-center">${vo.dbday }</td>
			</tr>
			<tr>
				<th width="20%" class="success text-center">이름</th>
				<td width="20%" class="text-center">${vo.name }</td>
				<th width="20%" class="success text-center">조회수</th>
				<td width="20%" class="text-center">${vo.hit }</td>
			</tr>
			<tr>
				<th width="20%" class="sucess text-center">제목</th>
				<td colspan="3" class="text-left">${vo.subject }</td>
			</tr>
			<tr>
				<th width="20%" class="sucess text-center">첨부파일</th>
				<td colspan="3" class="text-left">
					<a href="download.jsp?fn=${vo.filename }">${vo.filename }</a> (${vo.filesize } Bytes)
				</td>
			</tr>
			<tr>
				<td colspan="4" class="text-left" valign="top" height="200">
					<pre style="white-space: pre-wrap; background: white; border: 0;">${vo.content }</pre>
				</td>
			</tr>
			<tr>
				<td colspan="4" class="text-right">
					<a href="" class="btn btn-xs btn-warning">수정</a>
					<span class="btn btn-xs btn-warning" id="delSpan">삭제</span>
					<a href="list.do" class="btn btn-xs btn-warning">목록</a>
				</td>
			</tr>
			<tr style="display: none" id="delTr">
				<form action="delete.do?no=${vo.no }" method="post">
				<td colspan="4" class="text-right">
					비밀번호 <input type="password" size=10 class="input-sm" name=pwd required>
					<input type="hidden" name=no values="${vo.no }">
					<button class="btn-sm btn-danger" type="submit">삭제</button>
				</td>
				</form>
			</tr>
		</table>
	</div>
</div>
</body>
</html>