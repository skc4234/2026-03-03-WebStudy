<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="8kb"%>
<%--
	out : JspWriter
		- 출력 버퍼(HTML을 저장하는 메모리 공간) 관리
		- JSP 실행 요청
			- Tomcat(WAS, Web Application Server) : JSP/Servlet 간 변역하는 엔진
			- JSP를 자바 파일로 변경
				```
				class a_jsp extends HttpServlet {
					public void _jspService() {
						// HTML 태그
						out.write("<html>");
						...	
					}
				}
				```	
			- 컴파일 후 Servlet 파일 생성
			- 실행하면 메모리(버퍼)에 저장
		- 사용자 당 출력 버퍼 1개
		- 브라우저에서 읽어 가면 자동으로 reflush(autoFlush)
		- 출력 버퍼의 크기는 8kb가 default
		- out 객체 주요 메소드
			- println()
			- print
			- write
			- getBuffersize() : 버퍼 크기
			- getRemaining() : 현재 남아있는 버퍼 크기
			- 최대한 <% %> 제거 => 태그형 프로그램으로 변경 : JSTL
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>전체 버퍼 크기 : <%=out.getBufferSize() %>KB</h3>
	<h3>현재 남아있는 버퍼 크기 : <%=out.getRemaining() %>KB</h3>
	<h3>현재 사용중인 크기 : <%=out.getBufferSize()-out.getRemaining() %>KB</h3>
	<%
		int a=10;
		if(a%2==0) {
	%>		짝수입니다
	<%	}
		else {
	%>		홀수입니다
	<%	}
	%>
	<p>
	<%
		int b=11;
		if(b%2==0) {
			out.write("짝수입니다");
		}
		else {
			out.write("홀수입니다");
			
		}
	%>
	<p>
	<%
		out.println("<h1>JSP</h1>");
		out.println("<h1>JSP</h1>");
		out.println("<h1>JSP</h1>");
		out.println("<h1>JSP</h1>");
		out.println("<h1>JSP</h1>");
		out.println("<h1>JSP</h1>");
		out.println("<h1>JSP</h1>");
		out.println("<h1>JSP</h1>");
	
	%>
</body>
</html>