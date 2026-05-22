<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션에 저장된 모든 정보 삭제
	session.invalidate();
	response.sendRedirect("../main/main.jsp");
%>