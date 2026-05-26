<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
	List<String> names = new ArrayList<String>();
	names.add("홍길동");
	names.add("심청이");
	names.add("김두한");
	names.add("이순신");
	names.add("John");
	
	List<String> sexs = new ArrayList<String>();
	sexs.add("남자");
	sexs.add("여자");
	sexs.add("남자");
	sexs.add("남자");
	sexs.add("남자");
%>
<c:set var="list" value="<%=names %>" />
<c:set var="sexs" value="<%=sexs %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Java 구구단</h1>
	<table border="1" bordercolor=black width=560>
		<tr>
			<%
				for(int i=2; i<=9; i++) {
			%>
					<th><%=i+"단" %>
					</th>
			<%} %>
		</tr>
		<%
			for(int i=1; i<=9; i++) {
		%>		<tr>
		<%		for(int j=2; j<=9; j++) {
		%>
					<td><%=j+"*"+i+"="+(i*j) %></td>
		<%		}
		%>      </tr>
		<%	}
		%>
	</table>
	<hr>
	<h1>JSTL 구구단</h1>
	<table border=1 bordercolor=black width=560>
		<tr>
			<c:forEach var="i" begin="2" end="9"> <%-- step="1"인 경우 생략 가능  --%>
				<th>${i }단</th>
			</c:forEach>
		</tr>
		<c:forEach var="i" begin="1" end="9">
			<tr>
				<c:forEach var="j" begin="2" end="9">
					<td>${j }*${i }=${j*i }</td>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
	<hr>
	<h1>Java를 이용한 for-each</h1>
	<ul>
		<%
			int i=1;
			for(String name : names) {
		%>
				<li><%=i%>. <%=name %></li>
		<%
				i++;
			} %>
	</ul>
	<hr>
	<h1>JSTL를 이용한 for-each</h1>
	<ul>
		<%--
			var="name" 
				=> list에서 값을 하나씩 가져오는 변수
			items="${list }" 
				=> c:set으로 정의한 배열명
			varStatus="s"
				=> List 등에서 인덱스 번호가 필요할때 지정
		 --%>
		<c:forEach var="name" items="${list }" varStatus="s">
			<li>${s.index+1 }. ${name }</li>
		</c:forEach>
	</ul>
	<hr>
	<h1>Java를 이용한 컬렉션 출력(2개일 경우)</h1>
	<ul>
		<%
			for(i=0; i<names.size(); i++) {
		%>		<li><%=names.get(i) %>(<%=sexs.get(i) %>)</li>
		<%		
			}
		%>
	</ul>
	<h1>JSTL를 이용한 컬렉션 출력(2개일 경우)</h1>
	<ul>
		<c:forEach var="name" items="${list }" varStatus="s">
			<li>${name }(${sexs[s.index] })</li>
		</c:forEach>
	</ul>
</body>
</html>