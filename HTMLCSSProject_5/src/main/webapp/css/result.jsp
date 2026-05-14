<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sist.temp.*"%>
<%
	String no=request.getParameter("no");
	MovieManager mv = new MovieManager();
	String result = mv.movieListData(Integer.parseInt(no));
	//"watchGradeNm"
%>
<%=result %>
