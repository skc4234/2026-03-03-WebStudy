<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
	/*
		JSP
		1. 화면 UI(View)
		2. 처리 기능 => 사용자 요청값을 받아서 데이터베이스 연동 => 처리 후 화면 이동
						DELETE / UPDATE / INSERT
		_ok.jsp : 처리만 하는 jsp파일
		
		
		Servlet
		1. doGet() => 화면 UI
		2. doPost() => 사용자 요청 처리
		=> 화면 UI는 사용하지 않는다 => 보안이 필요 / Java-HTML연결 시에만 사용
	*/
	String no=request.getParameter("no");
	String pwd=request.getParameter("pwd");
	BoardDAO dao = new BoardDAO();
	/*
		경우의 수
		1. pwd가 맞는 경우 => DELETE 후 list.jsp로 이동
		2. pwd가 틀린 경우 => 다시 입력 필요 => javascript:history.back()
		
		비밀번호 = 본인 확인
		비밀번호 암호화 => ED255_1
		
		
		로그인 처리
		1. login 성공 시 main.jsp로 이동
		2. 탈퇴시 main.jsp로 이동
	*/
	boolean bCheck=dao.boardDeleteData(Integer.parseInt(no), pwd);
	if(bCheck==true) {
		// 게시글이 삭제된 경우
		response.sendRedirect("list.jsp");
	}
	else {
%>	
	<script>
		alert("비밀번호가 틀립니다");
		history.back();
	</script>
<%	
	}
	
%>