<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*"%>
<%--
	**가장 중요**
	11장. DB 연동(JDBC / DBCP)
	12장. Cookie, Session
	13장. File Upload 
	
	------------------------------------------
	JSP 장점/단점
	스크립트릿 - <% %> <%= %> => 대체
	지시자 - page-import, contentType, errorPage
		 - taglib
	내장객체 - request, response, application(JSP 에서만), session
	JavaBeans - setter-<jsp:setProperty>, getter-<jsp:getProperty>
	액션 태그 - **<jsp:include>**, <jsp:forward>
	-------------------------------------------
	
	
	- DBCP : DataBase ConnectionPool
		- Pool : 저장 공간
		- DB 연결을 미리 여러개 만든 후 재사용 하는 기술
		- DB 연결은 생성 비용이 크다
		- 요청 할때마다 Connection을 생성하면 성능이 떨어짐
		- Connection 객체가 많이 생성되면 메모리 누수 현상
		- Connection 객체를 제어하기 어렵다 => DDoS 와 비슷
		- 서버가 부하가 많아서 종료
		
		해결책
		- Connection을 제한해서 재사용하게 만든다
		- 쉽게 서버 다운이 안되게 만든다
		- 연결하는 시간소요 방지
		- 일반적으로 웹 프로그램의 일반화
		=> getConnection만 변경 => 연결된 주소값 얻어서 처리
		
		동작 순서
		- 프로그램 시작과 동시에 Connection Pool 생성
		- 톰캣에 의해서 생성
		- 미리 연결된 Connection 이 저장된다
		- 사용자 요청 => Pool 안에서 Connection 주소를 가지고 온다
		- 사용자 => Connection 사용
		- 작업 종료 => Connection을 닫는 것이 아니라 Pool로 반환(재사용)
		- conn.close() (x) => 반환
		
		설정
		- maxActive : 동시에 사용할 수 있는 Connection 개수(default 8개)
		- maxIdle : 항상 유지하고 최소 Connection 개수(default 8개)
		- maxWait : 반환까지 기다리는 시간
		----------------------------> 데이터베이스 성능 최적화 기술
		
		
		
			
--%>
<%
	// 자바에서 오라클에 있는 데이터를 가지고 온다
	EmpDAO dao = EmpDAO.newInstance();
	List<EmpBean> list = dao.empListData();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 style="text-align: center">사원목록</h1>
<table border="1" bordercolor=black width=500 style="margin: 0px auto">
	<tr>
		<th>사번</th>
		<th>이름</th>
		<th>직위</th>
		<th>입사일</th>
		<th>급여</th>
	</tr>
	<% for(EmpBean b: list) { %>
	<tr>
		<td><%=b.getEmpno() %></td>
		<td><%=b.getEname() %></td>
		<td><%=b.getJob() %></td>
		<td><%=b.getDbday() %></td>
		<td><%=b.getSal() %></td>
	</tr>
	<% } %>
</table>
</body>
</html>