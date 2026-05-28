<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	화면 출력 => 태그형(JSTL)
	- 제어문 (core)
		- 반복문 <c:forEach>
			- for(int i=1; i<=10; i++)
				=> <c:forEach var="i" begin="1" end="10" step="1">
			- for(String s : list)
				=> <c:forEach var="s" items="${list}">
		- 조건문 <c:if test="">
			- if(i==10)
				=> <c:if test="${i==10}">
		- 다중 조건문
			<c:choose>
				<c:when test=""></c:when>
				<c:when test=""></c:when>
				<c:when test=""></c:when>
				<c:when test=""></c:when>
				<c:otherwise></c:otherwise>
			</c:choose>
	- 변수 선언
		- int i=10;
			=> <c:set var="i" value="10"/>
	- 화면 이동 (core)
		- response.sendRedirect("list.jsp");
			=> <c:redirect url="list.jsp">
			
	EL : <%=%> 대체 ${}
		- 연산자 (+, += 등)
		- 비교연산자 (==, != 등)
		- 삼항연산자 (조건식?true:false)
		- empty => 장바구니/로그인 등
	- 데이터 출력
		=> requset.setAttribute("키",값) / session.setAttribute("키",값)
		=> ${키} / ${sessionScope.키}
		
	- JQuery => $().text()
	- Vue => {{}}, 변경 delimitter : [[]]
	- React => {}
	- Django => {{}}
	- ThymeLeaf => [[]]
	
 --%>
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
	<div class="row">
		<h3>글쓰기</h3>
		<%-- 
			GET : 단순 검색어 / 페이지 번호, 상세보기 번호 등
			POST : 데이터가 많은 경우 / 보안 필요시
		 --%>
		<form action="insert_ok.jsp" method="post">
		<table class="table">
			<tr>
				<th width="10%" class="text-center">이름</th>
				<td width="90%"><input type="text" name=name size=20 class="input-sm" required></td>
			</tr>
			<tr>
				<th width="10%" class="text-center">제목</th>
				<td width="90%"><input type="text" name=subject size=20 class="input-sm" required></td>
			</tr>
			<tr>
				<th width="10%" class="text-center">내용</th>
				<td width="90%"><textarea rows="10" cols="90" name="content" required></textarea></td>
			</tr>
			<tr>
				<th width="10%" class="text-center">비밀번호</th>
				<td width="90%"><input type="password" name=pwd size=20 class="input-sm" required></td>
			</tr>
			<tr>
				<td colspan="2" class="text-center">
					<button class="btn-sm btn-primary">글쓰기</button>
					<button class="btn-sm btn-danger" type="button" onclick="javascript:history.back()">취소</button>
				</td>
			</tr>
		</table>
		</form>
	</div>
</div>
</body>
</html>