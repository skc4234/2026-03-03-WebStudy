<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
	String no = request.getParameter("no");
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
	width: 300px;
}
h3 {
	text-align: center;
}
.board-wrap {
	background: #fff;
	padding: 30px;
	border-radius: 18px;
	box-shadow: 0 8px 25px rgba(0,0,0,0.08);
}

.table {
	background: white;
	border-radius: 12px;
	overflow: hidden;
}

</style>
</head>
<body>
	<div class="container">
		<div class="board-wrap">
			<h3>삭제하기</h3>
			<div class="row">
				<form action="delete_ok.jsp" method="post">
				<table class="table">
					<tbody>
						<tr>
							<td class="text-center">
							비밀번호 : <input type="password" size=10 class="input-sm" name=pwd required>
							
							<input type="hidden" name=no value=<%=no %>>
							</td>
						</tr>
						<tr>
							<td class="text-center">
							<input type="submit" class="btn-sm btn-primary" value="삭제">
							<input type="button" class="btn-sm btn-danger" value="취소" onclick="javascript:history.back()">
							</td>
						</tr>
					</tbody>
				</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>