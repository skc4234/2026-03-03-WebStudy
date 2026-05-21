<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	12장. Session / Cookie
	13장. File Upload
	
	Cookie => 내 컴퓨터에 저장
		- 영구
	Session => 서버에 저장
		- 브라우저 종료 / 로그아웃 시 사라진다
		- 사용자 당 1개씩만 생성
	
	- Session과 Cookie가 필요한 이유
		- HTTP는 기억을 못하는 구조
		- ex) 로그인하면 다음 화면으로 이동 => 로그인 정보 없음
		
	- 사용자 기억 장치 필요
		- cookie / session
		- 상태 유지
	2. Cookie
		- 클라이언트 브라우저에 저장
		- Session에 비해 용량이 작다(4kb)
		- 브라우저 종료해도 데이터가 남아있다
		- 저장할 수 있는 데이터 문자열만 저장 가능
		
		
	- 쿠키 생성
		Cookie cookie = new Cookie(String key, String vaule)
			- key 중복이면 저장안됨 => Map 방식
		- 쿠키 기간 설정 => 브라우저로 전송
		cookie.setMaxAge(초단위) => 60*60*24 => 하루(24시간)
		- 브라우저로 전송
		response.addCookie(cookie);
		- 원하는 위치에 저장
		cookie.setPath("/");
		
	- 쿠키 읽기
		Cookie[] cookies = request.getCookies()
		=> key 활용
		for(Cookie c: cookies) {
			if(c.getName().startsWith("food_")) {
			   // 처리
			}
		}
		- getName() : key
		- getValue() : 값
	- 쿠키 삭제
		- cookie.setMaxAge(0)
	- 쿠키 수정
		- Cookie cookie = new Cookie("a1","Aaa");
	- 언제 사용하는지
		- 자동 로그인
		- 최근 방문<=
		- 팝업창(24시간 후에 알림)
	==========================================
	- Session
		- 내장 객체
			- request를 이용해서 생성 가능
			- HttpSession session = request.getSession()
		- 세션에 저장
			- session.setAttribute((String)"키", (Object)값);
		- 세션 읽기
			- session.getAttribute("키");
		- 세션에서 일부 삭제
			- session.removeAttribute("키"); => 해당키만 삭제
		- 세션에서 전체 삭제
			- 로그아웃
			- session.invalidate()
		- 기간 설정
			- session.setMaxInactiveInterval(초단위)
			- 기본값:1800초 => 30분
		- 생성된 시점
			- session.getCreationTime() : 세션에 등록된 시간
			- session.getId() : 각 클라이언트 당 1개 배정하는 고유번호
			- session.isNew() : 처음으로 등록된 상태(boolean) => 장바구니
		- 특징
			- 서버에 저장(보안이 좋다)
			- 브라우저 종료 시 자동 삭제
			- 사용자마다 개별 공간(따로 저장) => getId
			- 저장되는 시점 : 로그인 시 사용자 정보 일부 저장
		- 사용처
			- 로그인 상태 유지
			- 회원 정보
			- 장바구니
			- 관리자 인증
			- 예약
			
		 면접 100%
		 Cookie VS Session
		 GET VS POST
		 MyBatis VS JPA
		 MVC 구조 설명
		-----------------------------------
		 구분       cookie       session
		-----------------------------------
		저장위치   컴퓨터(브라우저)    접속한 서버
		-----------------------------------
		 보안        낮다           높다
		-----------------------------------
		 용량    적다(문자열 저장)  크다(Object)
		-----------------------------------
		 유지       오래간다      로그아웃/브라우저 종료시
		-----------------------------------
		 속도       빠르다      cookie에 비해 느리다
		-----------------------------------
		 용도   	  최근 방문       로그인 상태
      		 	 라이센스 정보    장바구니/예약
		-----------------------------------
		
		실무
			- 로그인 : session(무조건)
			- 자동 로그인 : cookie, Spring에서는 remember-me 사용
			- 장바구니 : session / database
			- 보안 정보 / security : session
			- JWT : cookie 기반 => 소셜 로그인(cookie)
			
			- 가벼운 데이터 : cookie
			- 안전이 필요한 데이터 : session
		
		- request, response, session 내장 객체
		- <jsp:include>
		- page/tablib => JSTL/EL
		- cookie
		
 --%>
<%
	//session.setAttribute("id", "hong");
	//session.setAttribute("name", "홍길동");
	String id = (String)session.getAttribute("id");
	
	// id=null 이면 session
	// 로그인 => session에 사용자의 일부 정보를 서버에 저장
	// 프로젝트 전체에서 공통으로 사용
	// 데이터를 유지하는 방법
	
	/*
		웹
		1. 메인 페이지 => 조원 공동
		2. 회원 => 로그인 => 메뉴 조절
		3. 메뉴별 역할
	*/
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.container {
	width: 960px;
	
}
</style>
</head>
<body>
<jsp:include page="header.jsp" />
<div class="container">
	<div class="row login">
	<%
		if(id==null) {
	%>
		<form action="../member/login.jsp" method="post">
		<div class="logform text-center">
			ID : <input type="text" name=id size=15 class="input-sm">
			&nbsp;
			PW : <input type="password" name=pwd class="input-sm" size=15>
			&nbsp;
			<button class="btn-sm btn-primary">로그인</button>
		</div>
		</form>
	<% }
		else { %>
		<form method="post" action="../member/logout.jsp">
		<div class="logform text-center">
			<%=session.getAttribute("name") %>님 로그인 되었습니다&nbsp;
			<button class="btn-sm btn-primary">로그아웃</button>
		</div>
		</form>
	<% } %>
	</div>
</div>
</body>
</html>