<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="com.sist.dao.*, com.sist.vo.*"%>
<%
	// 1. 사용자가 보내준 데이터값 받기
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	/*
		getParameter()= > text, password 등 checkbox 제외
		getParameterValues() => checkbox
		
		관리자
		request 객체에서 사용자 요청값을 받거나 추가해 전송 / 세션 / 쿠키
	*/
	
	// DB연동
	MemberDAO dao = MemberDAO.newInstance();
	MemberVO vo = dao.memberLogin(id, pwd);
	if(vo.getMsg().equals("NOID")) {
%>		<script>
			alert("ID가 존재하지 않습니다");
			history.back();
		</script>	
<%	}
	else if(vo.getMsg().equals("NOPWD")) {
%>		<script>
			alert("비밀번호가 틀립니다");
			history.back();
		</script>
<%	}
	else {
		// 로그인 된 상태
		// 정보를 세션에 저장 => 브라우저 종료/로그아웃  전까지 데이터 유지
		// request / session, cookie
		//  지역변수         전역변수
		session.setAttribute("id", vo.getId());
		session.setAttribute("name", vo.getName());
		session.setAttribute("admin", vo.getIsadmin());
		session.setAttribute("post", vo.getPost());
		session.setAttribute("address", vo.getAddr1()+" "+vo.getAddr2());
		session.setAttribute("phone", vo.getPhone());
		response.sendRedirect("../main/main.jsp");
	}
	
%>
