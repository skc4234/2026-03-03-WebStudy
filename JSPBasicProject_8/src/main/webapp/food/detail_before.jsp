<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 맛집 번호 받기
	String no = request.getParameter("no");
	// 1. 쿠키 생성
	Cookie cookie = new Cookie("food_"+no, no);
	
	// 2. 기간 정하기
	cookie.setMaxAge(60*60*24); // 하루만 저장
	// session => default 1800초(30분), cookie는 default 없음 => 설정 필요
	// 쿠키 삭제 => cookie.setMaxAge(0);
	
	// 3. 저장위치 지정
	cookie.setPath("/");
	
	// 4. 해당 브라우저로 쿠키 전송
	response.addCookie(cookie);
	
	// 5. 화면 이동
	response.sendRedirect("../main/main.jsp?mode=2&no="+no);
	// GET 방식, request 초기화
	
	/*
		- Cookie는 브라우저에 저장
		- 문자열만 저장할 수 있다
		- 저장공간이 작다(default 4kb)
		- 보안성이 낮다
		- 최근 방문, 자동 로그인 등
		- 메소드
			- Cookie c = new Cookie("키", 값);
				- 키는 중복 금지
			- c.setPath("/") : 저장 위치 설정
			- c.setMaxAge() : 쿠키 저장 시간 설정(초단위)
			- c.getName() : key 출력
			- c.getValue() : 값 출력
			- response.addCookie(c) : 쿠키 전송
			- response는 쿠키/HTML 만 전송 => 둘 중 하나만 보낼 수 있다
			- detail_before.jsp : 쿠키만 전송
			- detail.jsp : HTML만 전송
			
		- 쿠키 읽는 방법
			1. 쿠키 전체 읽기
				Cookie[] cookies = request.getCookies()
			2. key 읽기
				cookies[0].getName();
			3. value 읽기
				cookies[0].getValue();
			4. 쿠키 삭제
				cookies[0].setMaxAge(0);
	*/
%>