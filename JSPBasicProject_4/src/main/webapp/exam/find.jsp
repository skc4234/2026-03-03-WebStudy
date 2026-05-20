<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="com.sist.dao.FoodsDAO"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*"%>
<%
	// 사용자가 전송한 주소 받기 / 페이지 받기
	String address = request.getParameter("address");
	if(address==null) address="마포";
	String strPage = request.getParameter("page");
	if(strPage==null) strPage="1";
	int curPage = Integer.parseInt(strPage);
	FoodsDAO dao = FoodsDAO.newInstance();
	int totalPage=dao.foodsFindTotalPage(address);
	List<FoodsVO> list = dao.foodsFindData(curPage, address);
	
	Map map = new HashMap();
	map.put("curPage", curPage);
	map.put("totalPage", totalPage);
	map.put("list", list);
	
	ObjectMapper mapper = new ObjectMapper();
	String json = mapper.writeValueAsString(map);
	
%>
<%=json%>