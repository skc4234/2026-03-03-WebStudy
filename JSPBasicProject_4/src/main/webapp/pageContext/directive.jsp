<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<h1>JSP 지시자</h1>
			<table class="table">
				<tr>
					<td colspan="2">
						JSP에서 파일(페이지)에 대한 설정이나 동작 방식 지정
					</td>
				</tr>
				<tr>
					<td colspan="2">
						지시자의 종류
					</td>
				</tr>
				<tr>
					<td>page</td>
					<td>JSP 페이지에 대한 전체 속성을 설정</td>
				</tr>
				<tr>
					<td>include</td>
					<td>JSP 특정 페이지 영역에 다른 JSP를 포함할 때 사용(정적)</td>
				</tr>
				<tr>
					<td>taglib</td>
					<td>자바의 문법(제어문, 화면이동, 변환, String)을 태그로 사용 : 태그형 라이브러리</td>
				</tr>
			</table>
			<h1>지시자 속성</h1>
			<table class="table">
				<tr>
					<td colspan="3">기본형태 : &lt;%@ page 속성="값 %&gt;</td>
					<br>
					값은 반드시 "" 붙이기
				</tr>
				<tr>
					<td>contentType</td>
					<td>문자 설정 / 브라우저 출력형식을 지정</td>
					<br>
					<td>
					xml: text/xml;
					json : text/plain
					</td>
				</tr>
				<tr>
					<td>import</td>
					<td>자바에서 지원/사용자 정의 클래스를 읽어 올때 사용</td>
					<br>
					<td>
					import="java.util.*, java.sql.*"
					</td>
				</tr>
				<tr>
					<td>errorPage</td>
					<td>에러가 발생하는 </td>
					<br>
					<td>
					import="java.util.*, java.sql.*"
					</td>
				</tr>
				<tr>
					<td>buffer</td>
					<td>자바에서 지원/사용자 정의 클래스를 읽어 올때 사용</td>
					<br>
					<td>
					import="java.util.*, java.sql.*"
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>