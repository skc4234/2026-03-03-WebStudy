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
			<h1 class="text-center">JSP 스크립트</h1>
			<table class="table" style="margin-top: 50px;">
				<tbody>
					<tr>
						<th>
						&lt;% %&gt;
						</th>
						<td>일반 자바 소스(메소드 호출 / 제어문 / 연산자 / 지역변수)
						</td>
						<td>_jspService() : 스크립트릿
						</td>
					</tr>
					<tr>
						<th>
						&lt;%= %&gt;
						</th>
						<td>브라우저에 출력하는 형식
						</td>
						<td>_jspService() => out.print()로 변경 : 표현식
						</td>
					</tr>
					<tr>
						<th>
						&lt;%! %&gt;
						</th>
						<td>메소드 / 전역변수 설정
						</td>
						<td>class 블록 : 선언식
						</td>
					</tr>
					<tr>
						<td colspan="3">자바와 HTML 구분할때 사용
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>