<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 
	enctype="multipart/form-data" : 파일 업로드 
	=> 서버로 전송
	Part1 : file(파일 데이터)
	Part2 : 문자 데이터
	
	cos.jar : upload 라이브러리
	=> 파일명 자동갱신 => 중복된 파일 이름에 (1) 붙임
	javax.http 까지만 가능(tomcat 9.0까지)
	jakarta.http는 불가능(tomcat 10~)

--%>
<div class="container" style="margin-top: 20px">
	<h3 class="text-center">글쓰기</h3>
	<div class="row" style="width: 800px; margin: 0px auto;">
		<form action="../UploadServlet" method="post" enctype="multipart/form-data">
		<table class="table">
			<tr>
				<th class="text-center" width="10%">이름</th>
				<td width="90%">
					<input type="text" name="name" size=20 class="input-sm" required>
				</td>
			</tr>
			<tr>
				<th class="text-center" width="10%">제목</th>
				<td width="90%">
					<input type="text" name="subject" size=70 class="input-sm" required>
				</td>
			</tr>
			<tr>
				<th class="text-center" width="10%">내용</th>
				<td width="90%">
					<textarea rows="10" cols="80" name=content required></textarea>
				</td>
			</tr>
			<tr>
				<th class="text-center" width="10%">첨부파일</th>
				<td width="90%">
					<input type="file" name="upload" size=30>
				</td>
			</tr>
			<tr>
				<th class="text-center" width="10%">비밀번호</th>
				<td width="90%">
					<input type="password" name="pwd" size=10 class="input-sm" required>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="text-center">
					<button class="btn-sm btn-warning">글쓰기</button>
					<button type="button" class="btn-sm btn-danger" onclick="javascript:history.back()">취소</button>
				</td>
			</tr>
		</table>
		</form>
	</div>
</div>
</body>
</html>