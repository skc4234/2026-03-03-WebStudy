<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*" %>
<%-- 값만 받아서 처리 --%>
<%
	// 사용자 요청값만 받아서 처리
	// 데이터 4개
	String name = request.getParameter("name");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String pwd = request.getParameter("pwd");
	BoardVO vo = new BoardVO();
	vo.setName(name);
	vo.setSubject(subject);
	vo.setContent(content);
	vo.setPwd(pwd);
	BoardDAO dao = new BoardDAO();
	dao.boardInsertData(vo);
	
	// 화면 이동
	response.sendRedirect("list.jsp");
%>