<%@page import="com.sist.model.BoardModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardModel model = new BoardModel();
	// jsp:useBean 사용 가능
	model.boardInsert(request, response);
%>