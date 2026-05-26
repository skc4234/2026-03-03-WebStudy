<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%--
	if(조건문) {
		조건문이 true일때 처리
	}
	
	- JSTL
	<c:if test="조건문">
		조건문이 true일때 처리
	</c:if>
	=> 단점 : <c:else>가 없다 => 단일조건문만 가능
	
	MVC => Java / HTML 분리
		=> JSP에서는 Java 사용 x
		=> <%= %> => ${} (EL)
		=> <% %> => <c:forEach> 등(JSTL)
			=> 메소드 호출 <fn:...>
			
	MVC
		- Model
			- <% %> => 일반 자바
		- View
			- 자바 없이 순수하게 화면 출력 => HTML 등
		- Controller
			- Model-View 연결
			
	JSP 코딩 단점
		- 확장성이 없다 => 재사용 불가
		- 파일 자체 노출(보안성이 낮다)
	MVC 코딩
		- 자바로 되어있음(확장성 높음) => 재사용 가능
		- 보안성이 높다(.class 파일)
		
	if - <c:if>
	for - <c:forEach>
	switch - <c:choose>
	
	- 다중 조건문(<c:choose>)
		- <c:when test="조건문">
		- <c:ohterwise>
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Java 조건문</h1>
	<%
		for(int i=1; i<=10; i++) {
			if(i%2==0) {
	%>			<%=i %>			
	<%
			}
		}
	%>
	<hr>
	<h1>JSTL 조건문</h1>
	<c:forEach var="i" begin="1" end="10">
		<c:if test="${i%2==0 }">
			${i }
		</c:if>
	</c:forEach>
	<hr>
	<h1>Java 다중 조건문</h1>
	<%
		int star=3;
	%>
	<%
		if(star==0) {
	%>		<span style="color: orange">☆☆☆☆☆</span>		
	<%	}
		else if(star==1) {
	%>		<span style="color: orange">★☆☆☆☆</span>		
	<%	}
		else if(star==2) {
	%>		<span style="color: orange">★★☆☆☆</span>		
	<%	}
		else if(star==3) {
	%>		<span style="color: orange">★★★☆☆</span>		
	<%	}
		else if(star==4) {
	%>		<span style="color: orange">★★★★☆</span>		
	<%	}
		else if(star==5) {
	%>		<span style="color: orange">★★★★★</span>		
	<%	}
	%>
	<hr>
	<h1>JSTL 다중 조건문/선택문</h1>
	<c:set var="star" value="5" />
	<c:choose>
		<c:when test="${star==0 }"><span style="color: orange">☆☆☆☆☆</span></c:when>
		<c:when test="${star==1 }"><span style="color: orange">★☆☆☆☆</span></c:when>
		<c:when test="${star==2 }"><span style="color: orange">★★☆☆☆</span></c:when>
		<c:when test="${star==3 }"><span style="color: orange">★★★☆☆</span></c:when>
		<c:when test="${star==4 }"><span style="color: orange">★★★★☆</span></c:when>
		<c:when test="${star==5 }"><span style="color: orange">★★★★★</span></c:when>
		<c:otherwise>없음</c:otherwise>
	</c:choose>
	<hr>
	<h1>Java 선택 조건문</h1>
	<%
		int sex=1;
	%>
	<%
		if(sex==1) {
	%>		남자		
	<%	} else {
	%>		여자
	<%} %>
	<hr>
	<h1>JSTL 선택 조건문(else가 없다)</h1>
	<c:set var="sex" value="1" />
	<c:choose>
		<c:when test="${sex==1 }">
			남자
		</c:when>
		<c:otherwise>
			여자
		</c:otherwise>
	</c:choose>
</body>
</html>