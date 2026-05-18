<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	Chapter05 JSP 기본 문법
		1. 스크립트릿 : HTML / 자바 구분
		2. 지시자 : page / include / tablib
		3. 내장 객체
			- request / response / session / pageContext / application 등 9개
		4. 상태 관리 : session / cookie
		5. 데이터베이스 연동
		6. 기본 사이트
		7. JSTL / EL
		8. MVC
		
	1. 자바 소스 코딩(113page)
		- 선언문 : 멤버변수 / 메소드 선언 => 사용빈도가 거의 없다 <%! %>
		=================================================== 클래스 영역
		- 스크립트릿 : 자바 소스 => 지역변수 / 연산자 / 메소드 호출 <% %>
		- 표현식 : 브라우저에 출력 <%= %>
		===================================================  _jspService() 영역
		- 주석 : 번역이 안되는 영역 <%-- --%\>
	
	
	
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<style type="text/css">
body {
	font-family: sans-serif;
	margin: 20px;
}
h2 {
	margin-top: 40px;
	border-bottom: 2px solid #333;
	padding-bottom: 5px;
}
.exam {
	
}
</style>
</head>
<body>
	<%
		String title = "글자 속성";
		String h2="글자 색상";
		String[] colors={"빨강","파랑","초록"};
		
	%>
	<h1><%=title %></h1>
	<h2><%=h2 %></h2>
	<%--  주석
		255 255 255 white
		255  0   0  red
		 0  255  0  
	
	 --%>
	<p class="exam" style="color: red"><%=colors[0] %></p>
	<p class="exam" style="color: #0000ff"><%=colors[1] %></p>
	<p class="exam" style="color: rgb(0,255,0)"><%=colors[2] %></p>
	<%
		h2="글자 크기(font-size)";
		String[] size={"12px", "20px", "4em", "150%"};
		
	%>	
	
	<h2><%=h2 %></h2>
	<p class="exam" style="font-size: 12px"><%=size[0] %></p>
	<p class="exam" style="font-size: 20px"><%=size[1] %></p>
	<p class="exam" style="font-size: 4em"><%=size[2] %></p>
	<p class="exam" style="font-size: 150%"><%=size[3] %></p>
	<%
		h2="글꼴(font-family)";
		String[] family={"궁서체", "맑은 고딕", "구글폰트"};
		
	%>	
	
	<h2><%=h2 %></h2>
	<p class="exam" style="font-family: 궁서체"><%=family[0] %></p>
	<p class="exam" style="font-family: 맑은 고딕"><%=family[1] %></p>
	<p class="exam" style="font-family: Noto sans KR"><%=family[2] %></p>
	
	<%
		h2="폰트 스타일(font-style)";
		String[] style={"Normal", "Italic", "Oblique"};
		
	%>	
	
	<h2><%=h2 %></h2>
	<p class="exam" style="font-family: 궁서체"><%=style[0] %></p>
	<p class="exam" style="font-family: 맑은 고딕"><%=style[1] %></p>
	<p class="exam" style="font-family: Noto sans KR"><%=style[2] %></p>
	
	<%
		h2="폰트 두께(font-weight)";
		String[] weight={"normal", "bold", "lighter", "굵은 글자"};
		
	%>	
	
	<h2><%=h2 %></h2>
	<p class="exam" style="font-weight: normal"><%=weight[0] %></p>
	<p class="exam" style="font-weight: bold"><%=weight[1] %></p>
	<p class="exam" style="font-weight: lighter"><%=weight[2] %></p>
	<p class="exam" style="font-weight: 900"><%=weight[3] %></p>
	
	<%
		// 정렬 : text-align: left|center|right
		h2="정렬(text-align)";
		String[] sort={
				"왼쪽","가운데","오른쪽","양쪽"
		};
	
	%>
	<h2>****<%=h2 %></h2>
	<p class="exam" style="text-align: normal"><%=sort[0] %></p>
	<p class="exam" style="text-align: center"><%=sort[1] %></p>
	<p class="exam" style="text-align: right"><%=sort[2] %></p>
	<p class="exam" style="text-align: justify;"><%=sort[3] %></p>

	<%
		h2="선(text-decoration)";
		String[] line={"없음", "밑줄", "윗줄","취소선"};
	
	%>
	<h2><%=h2 %></h2>
	<p class="exam" style="text-decoration: none;"><%=line[0] %></p>
	<p class="exam" style="text-decoration: underline;"><%=line[1] %></p>
	<p class="exam" style="text-decoration: overline;"><%=line[2] %></p>
	<p class="exam" style="text-decoration: line-through;"><%=line[3] %></p>
	
	<%
		h2="글자 간격(spacing)";
		String[] spacing={"5px", "-2px", "20px"};
	
	%>
	<h2><%=h2 %></h2>
	<p class="exam" style="letter-spacing: 5px"><%=spacing[0] %></p>
	<p class="exam" style="letter-spacing: -2px"><%=spacing[1] %></p>
	<p class="exam" style="letter-spacing: 20px"><%=spacing[2] %></p>
	
	<%
		h2="****줄바꿈(white-space)";
		String[] space={"normal", "**nowrap","**pre-wrap","pre-line"};
		// nowrap : 이미지 / 글자
		// pre-wrap : 크기에 따라 자동 줄바꿈
	%>
	<h2><%=h2 %></h2>
	<p class="exam" style="white-space: normal;"><%=space[0] %></p>
	<p class="exam" style="white-space: nowrap;"><%=space[1] %></p>
	<p class="exam" style="white-space: pre-wrap;"><%=space[2] %></p>
	<p class="exam" style="white-space: pre-line;"><%=space[3] %></p>
	
	
</body>
</html>