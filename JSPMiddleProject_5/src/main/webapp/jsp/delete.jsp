<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container">
	<div class="row" style="width: 300px">
		<h3>삭제하기</h3>
		<%-- 현재 파일에서 처리 => Ajax,Vue,React => 화면이 바뀌지 않음
							로그인 처리, 로그아웃, 검색, 페이지 변경, 추천, 결제 등
			 React  Redux  *TanStackQuery
			 Vue    Vuex   *Pinia
			 -----------------------> 데이터형이 자주 변경 => typeScript(고정)
			 JSP    MVC    *Spring
			 				NodeJS
		 --%>
		<form action="delete_ok.jsp" method="post">
		<table class="table">
			<tr>
				<td class="text-center">비밀번호:
				<input type="password" name=pwd class="input-sm" required>
				<input type="hidden" name=no value="${param.no }">
				</td>
			</tr>
			<tr>
				<td class="text-center">
				<button class="btn-sm btn-warning">삭제</button>
				<button class="btn-sm btn-danger" type="button" onclick="javascript:history.back()">취소</button>
				<%--
					이전 화면
					vue / react => nav(-1)
					javascript => history.go(-1) / history.forward(1) / history.back()
					브라우저 제어 가능
					=> 출력에 필요한 데이터 필요
					=> Back-End => Javascript로 제어
				 --%>
				</td>
			</tr>
		</table>
		</form>
	</div>
</div>
</body>
</html>