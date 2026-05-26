<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<%--
	JSP
		- page : import, contentType
		- taglib : prefix="1" uri="jakarta..."
			- 자바를 대체하는 태그
			- <c:forEach> <c:set> <c:if> <c:redirect>
			- <fmt:formatDate> <fmt:formatNumber>
			- fn:substring / fn:trim / fn:replace
		- EL : <%= %> 대체
			- ${값} : request.getAttribute() / session.getAttribute()
			- 연산자
				- (+, +=, >=, <=, ==, !=)
				- (and, or, not)
				- 삼항연산자
		- JSTL : <%%> 대체
		- MV 구조
			=> HTML / Java 분리 => Controller(Servlet)
			- 최대한 자바 분리
		- MVC => MVVM = MVP
 --%>
<%
	BoardModel model = new BoardModel();
	model.boardDetailData(request);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container {
	margin-top: 50px;
}
.row {
	margin: 0px auto;
	width: 800px;
}
h3 {
	text-align: center;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let i=0;
// window.onload=function() { let btn=document.querySelector(".delbtn") }
$(function() {
	$('.delbtn').click(function() {
		if(i===0) {
			i=1;
			$(this).text("취소")
			$('#del').show()
		}
		else {
			i=0;
			$(this).text("삭제")
			$('#del').hide()
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
				<th class="text-center success" width="20%">번호</th>
				<td class="text-center" width="30%">${vo.no }</td>
				<th class="text-center success" width="20%">작성일</th>
				<td class="text-center" width="30%">${vo.dbday }</td>
			</tr>
			<tr>
				<th class="text-center success" width="20%">이름</th>
				<td class="text-center" width="30%">${vo.name }</td>
				<th class="text-center success" width="20%">조회수</th>
				<td class="text-center" width="30%">${vo.hit }</td>
			</tr>
			<tr>
				<th class="text-center success" width="20%">제목</th>
				<td colspan="3">${vo.subject }</td>
			</tr>
			<tr>
				<td colspan="4" class="text-left" valign="top" height="200">
					<pre style="white-space: pre-wrap; background:white; border: none;">${vo.content }</pre>
				</td>
			</tr>
			<tr>
				<td colspan="4" class="text-right">
					<a href="#" class="btn btn-xs btn-warning">수정</a>
					<span class="btn btn-xs btn-info delbtn">삭제</span>
					<a href="list.jsp" class="btn btn-xs btn-success">목록</a>
				</td>
			</tr>
			<tr style="display: none;" id="del">
				<td colspan="4" class="text-right">
					비밀번호 : <input type="password" class="input-sm" size=15>
					<input type="submit" value="삭제" class="btn btn-sm btn-danger">
				</td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>