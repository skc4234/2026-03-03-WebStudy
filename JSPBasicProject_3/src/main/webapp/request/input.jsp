<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	http://localhost/JSPBasicProject_3/jsp3/output.jsp?name=%ED%99%8D%EA%B8%B8%EB%8F%99&pwd=1111&sex=%EB%82%A8%EC%9E%90&loc=%EC%84%9C%EC%9A%B8&content=%09%09%09%09&birthday=
 	URI / URL 는 output.jsp 까지만 읽음
 	
 --%>
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
	width: 500px;
}
h3 {
	text-align: center;
}
</style>
</head>
<body>
	<h3>사용자 정보</h3>
	<form action="output.jsp" method="GET">
	<table class=table>
		<tbody>
		<tr>
			<th width="20%" class="text-center">이름</th>
			<td width="80%">
				<input type="text" name=name size=20 class="input-sm" required>
			</td>
		</tr>
		<tr>
			<th width="20%" class="text-center">비밀번호</th>
			<td width="80%">
				<input type="password" name=pwd size=20 class="input-sm" required>
			</td>
		</tr>
		<tr>
			<th width="20%" class="text-center">성별</th>
			<td width="80%">
				<input type="radio" name=sex value="남자" checked>남자
				<input type="radio" name=sex value="여자">여자
			</td>
		</tr>
		<tr>
			<th width="20%" class="text-center">지역</th>
			<td width="80%">
				<select name="loc">
					<option>서울</option>
					<option>경기</option>
					<option>인천</option>
					<option>강원</option>
					<option>대전</option>
					<option>충청</option>
				</select>
			</td>
		</tr>
		<tr>
			<th width="20%" class="text-center" required>소개</th>
			<td width="80%">
				<textarea rows="5" cols="50" name="content">
				</textarea>
			</td>
		</tr>
		<tr>
			<th width="20%" class="text-center">생년월일</th>
			<td width="80%">
				<input type="date" name=birthday size=20 class="input-sm">
			</td>
		</tr>
		<tr>
			<th width="20%" class="text-center">취미</th>
			<td width="80%">
				<input type="checkbox" name=hobby value="등산">등산
				<input type="checkbox" name=hobby value="낚시">낚시
				<input type="checkbox" name=hobby value="게임">게임
				<input type="checkbox" name=hobby value="독서">독서
				<input type="checkbox" name=hobby value="여행">여행
				<input type="checkbox" name=hobby value="운동">운동
			</td>
		</tr>
		<tr>
			<td colspan="2" class="text-center">
			 	<button class="btn-sm btn-success">전송</button>
			</td>
		</tr>
		</tbody>
	</table></form>
</body>
</html>