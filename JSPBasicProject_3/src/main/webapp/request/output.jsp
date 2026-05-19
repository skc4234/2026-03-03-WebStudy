<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 입력창은 대부분 단일값 => getParameter
	String name=request.getParameter("name");
	String pwd=request.getParameter("pwd");
	String sex=request.getParameter("sex");
	String loc=request.getParameter("loc");
	String content=request.getParameter("content");
	String birthday=request.getParameter("birthday");
	// checkbox는 다중값 => getParameterValues
	// 반드시 null 체크
	String[] hobby=request.getParameterValues("hobby");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	이름:<%=name %><p>
	비밀번호:<%=pwd %><p>
	성별:<%=sex %><p>
	지역:<%=loc %><p>
	소개:<%=content %><p>
	생년월일:<%=birthday %><p>
	취미:
	<ul>
	<% 
		try {
			if(hobby!=null) {
				for(String h : hobby) {
	%>				<li><%=h %></li>			
	<% 			}
			}
			else {
	%>			<li style="color: red">취미가 없습니다</li>			
	<%		}
		} catch(Exception e) {
			e.printStackTrace();
		}
	
	%>
	</ul>
	<ul>
	<li>
		URI : <%=request.getRequestURI() %>
	</li>
	<li>
		URL : <%=request.getRequestURL() %>
	</li>
	<li>request/response는 화면 변경이 되면 초기화</li>
	</ul>
</body>
</html>