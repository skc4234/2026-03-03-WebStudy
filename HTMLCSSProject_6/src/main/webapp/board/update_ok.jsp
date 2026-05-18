<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*" %>
<%
	String name = request.getParameter("name");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String pwd = request.getParameter("pwd");
	String no = request.getParameter("no");
	BoardVO vo = new BoardVO();
	vo.setName(name);
	vo.setSubject(subject);
	vo.setContent(content);
	vo.setPwd(pwd);
	vo.setNo(Integer.parseInt(no));
	
	BoardDAO dao = new BoardDAO();
	boolean bCheck = dao.boardUpdate(vo);
	
	if(bCheck==true) {
		response.sendRedirect("detail.jsp?no="+no);
	}
	else {
%>		
	<script>
		alert("비밀번호 틀림");
		history.back();
	</script>
<%	
	}
%>
