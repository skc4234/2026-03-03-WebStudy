<%@page import="com.sist.vo.EmpVO"%>
<%@page import="java.util.List"%>
<%@page import="com.sist.dao.EmpDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%-- 
	JSP(Java Server Page) : 서버에서 실행되는 파일
	- 장점
		- 자바+HTML 동시 사용 가능
		- 자바는 <% %> 안에서만 사용
		- HTML은 그대로
	- JSP-자바
		- 스크립트릿 <% %> : 일반 자바(변수 선언, 메소드 호출, 제어문 등)
		- 표현식 <%= %> : println() => only 변수값 출력
		- 선언식 <%| %> : 멤버 변수 선언, 메소드 선언 => 사용빈도 낮음
	- JSP-HTML
		- HTML : 정적 페이지(데이터 변경이 불가능)
		- 동적 페이지(데이터 변경이 가능) => ASP, PHP, DJango 등
		
	- 동작 원리
		- 브라우저에서 요청 => URL => .../sawon.jsp
		- Tomcat이 받아서 처리 => 자바 파일(Servlet)로 변경
		- 컴파일 => .class 파일 생성
		- 클래스 파일 실행 => HTML만 메모리에 저장 => 브라우저에서 읽음
	- 지시자(<%@ page %>) => 파일 정보
			=> 속성 : import => 다른 파일을 불러온다
	- JSP 사용법
		1. 자바에서 데이터 수집
		2. HTML을 이용해서 데이터 출력
		3. CSS를 이용해서 화면 UI 제작

 --%>
 <%
	EmpDAO dao = new EmpDAO();
	List<EmpVO> list = dao.empListData();
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	margin: 50px auto;
	/* 라인선 통합 : 한 줄 출력 */
	border-collapse: collapse;
	width: 700px;
	border-radius: 8px;
	box-shadow: 0px 2px rgba(0,0,0,0.05);
}
thead {
	background-color: #4F46E5;
	color: white;
}
th, td {
	padding: 12px 16px;
	text-align: left;
}
tbody tr {
	border-bottom: 2px solid #eee;
}
tbody tr:nth-child(even) {
	background-color: #fafafa;
}
tbody tr:hover {
	background-color: #f5f7ff;
}
/* 
	2n => even
	2n+1 => odd
 */

tbody tr:last-child {
	border-bottom: none;
}
</style>
</head>
<body>
	<table>
		<thead>
		<tr>
			<th>사번</th>
			<th>이름</th>
			<th>직위</th>
			<th>입사일</th>
			<th>급여</th>
		</tr>
		</thead>
		<tbody>
		<% for(EmpVO vo : list) { %>
		<tr>
			<td><%=vo.getEmpno() %></td>
			<td><%=vo.getEname() %></td>
			<td><%=vo.getJob() %></td>
			<td><%=vo.getDbday() %></td>
			<td><%=vo.getSal() %></td>
		</tr>
		<%} %>
		</tbody>
	</table>
</body>
</html>