<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<%
	List<String> names = new ArrayList<String>();
	names.add("홍길동");
	names.add("김두한");
	names.add("심청이");
	names.add("장나라");
	names.add("이순신");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>목록 출력</h1>
	<ul>
		<%
			// 배열/컬렉션 => 실제 데이터를 한개씩 읽어온다
			for(String name: names) {
				if(name.contains("이")) {
		%>			
				<li><%=name %></li>
				<% } %>
		<%	}
		%>
	</ul>
</body>
</html>