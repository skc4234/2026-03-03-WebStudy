<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.text.*"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%--
	JSTL : Java Standard Tag Library
 
 	- core : prefix="c" uri="jakarta.tags.core"
 		- 변수 선언 : <c:set var="변수(키)" value="대입값" />
 		- 제어문 : for(int i=1; i<=10; i++)
 				 <c:forEach var="i" begin="1" end="10" step="1">
 							------  --------  -------  --------
 							int i    i=1       i<=10    i++
				 for(String name : list)
 				 <c:forEach var="name" items="${list}">
 		- 조건문 : if(i>10)
 				 <c:if test="%{i}
 				 <c:choose>
 				 	<c:when test="조건식">
 				 	...
 				 	<c:otherwise>
				</c:chp>
 				 	
 		- 화면 이동 : <c:redirect url="">
 	- format : prefix="fmt" uri="jakarta.tags.fmt"
 		<fmt:formatDate>
 		<fm:formatNumber>

 	- functions : prefix="fn" uri="jakarta.tags.functions"
 	- xml
 	- sql
 --%>
<%
	List<String> list = new ArrayList<String>();
	list.add("홍길동");
	list.add("박");
	list.add("심청이");
	list.add("김문수");
	list.add("이순신");
%>
<c:set var="list" value="<%=list %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul>
<c:forEach var="name" items="${list }">
	<li>${name }</li>	
</c:forEach>
</ul>
<ul>
<c:forEach var="name" items="${sessionScope.list }">
	<li>${name }</li>	
</c:forEach>
</ul>
<h1>조건문</h1>
<%
	for(int i=1; i<=10; i++) {
		if(i%2==0) {
%>			<%=i %>
<%
		}

	}
%>
<h1>JSTL 조건문</h1>
<%-- step="1" 생략 가능
	 증가만 있다(감소x)
	 출력 용도로만 사용 --%>
<c:forEach var="i" begin="1" end="10">
	<c:if test="${i%2==0 }">
		${i }
	</c:if>
</c:forEach>
<h1>다중 조건문</h1>
<%
	for(int i=1; i<=10; i++) {
		if(i%2==0) {
%>			<h3><%=i %>는 짝수입니다</h3>
<%
		}
		else {
%>			<h3><%=i %>는 홀수입니다</h3>
<%			
		}

	}
%>
<%--
	1. JSTL : XML 형식
		=> 문법이 엄격하다
		=> 여는 태그와 닫는 태그 반드시 설정
		=> 독립태그도 반드시 닫는다 <input />
		=> 속성값은 반드시 ""
		=> 대소문자 구분
		=> 트리형태 => 소속 관계 명확
		- yml, yaml,...
		- ci/cd => yml : 들여쓰기(파이썬)
 --%>
<h1>JSTL 다중 조건문</h1>
<c:forEach var="i" begin="1" end="10">
	<c:choose>
		<c:when test="${i%2==0 }">
			<h3>${i }는 짝수입니다</h3>
		</c:when>
		<c:otherwise>
			<h3>${i }는 홀수입니다</h3>
		</c:otherwise>
	</c:choose>
</c:forEach>
<h1>날짜 변환</h1>
<%
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String today = sdf.format(date);
%>
실제 날짜 : <%=date %><br>
오늘 날짜 : <%=today %><br>
<c:set var="date" value="<%=date %>" />
오늘 날짜(fmt) : <fmt:formatDate value="${date }" pattern="yyyy-MM-dd"/>


<h1>숫자 변환</h1>
<%
	int won=1234567;
	DecimalFormat df = new DecimalFormat("#,###,###");
	String s = df.format(won);
%>
실제 값 : <%=won %><br>
출력 값 : <%=s %><br>
<c:set var="won" value="1234567" />
출력 값(fmt) :<fmt:formatNumber value="${won }" type="currency"/>
</body>
</html>