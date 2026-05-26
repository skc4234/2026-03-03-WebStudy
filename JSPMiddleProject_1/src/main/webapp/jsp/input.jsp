<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="output.jsp?id=admin&pwd=1234">클릭</a>
	<form action="output.jsp" method="post">
	<input type="checkbox" name=hobby value="등산" checked>등산
	<input type="checkbox" name=hobby value="독서">독서
	<input type="checkbox" name=hobby value="운동">운동
	<input type="checkbox" name=hobby value="게임">게임
	<input type="checkbox" name=hobby value="기타">기타
	<button>전송</button>
	</form>
</body>
</html>