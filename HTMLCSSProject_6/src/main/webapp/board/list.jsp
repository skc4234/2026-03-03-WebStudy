<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*" %>
    <%@ page import="java.text.*" %>
<%
	// 사용자가 요청한 데이터 받기 => page
	// 한 파일 안에서 데이터 변경 => 동적 페이지
	// 동적 페이지 : JSP / JavaScript
	// Ajax / Vue / React => 데이터를 받아서 화면에 출력 => View
	// 자바 => 1. 데이터베이스 연동 , 2. JSON 생성 가능 , 3. 브라우저로 전송
	String strPage = request.getParameter("page"); // 내장 객체
	// HttpServletRequest.request => 사용자 브라우저 정보를 가지고 있다
	/*
		list.jsp         ==> null
		list.jsp?page=   ==> ""(공백)
		list.jsp?page=2  ==> 2
		
		URL 주소 확인 => OUTPUT 확인 => Source 확인
	*/
	if(strPage==null) strPage="1";
	//System.out.println(strPage);
	BoardDAO dao = new BoardDAO();
	int curPage = Integer.parseInt(strPage);
	List<BoardVO> list = dao.boardListData(curPage);
	int count = dao.boardRowCount();
	int totalpage = (int)(Math.ceil(count/10.0));
	count=count-((curPage*10)-10);
	
	String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	/*
		숫자 변환 : DecimalFormat
		날짜 변환 : SimpleDateFormat
		오라클 : TO_CHAR(10000, '#,###,###') / TO_DATE(SYSDATE, 'YYYY-MM-DD')
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container {
	margin-top: 50px;
}
.row {
	margin: 0px auto;
	width: 800px;
}
h3 {
	text-align: center;
}
.board-wrap {
	background: #fff;
	padding: 30px;
	border-radius: 18px;
	box-shadow: 0 8px 25px rgba(0,0,0,0.08);
}
.btn-success {
	border: none;
	border-radius: 30px;
	padding: 8px 18px;
	font-weight: bold;
	transition: all 0.3s ease;
}
.btn-success {
	transform: translateY(-2px);
	box-shadow: 0 5px 15px rgba(0,206,201,0.4);
}
.table {
	background: white;
	border-radius: 12px;
	overflow: hidden;
}
.table tbody tr:hover {
	background: #f1f5ff;
	transform: scale(1.01);
}
.sub {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: e
}
</style>
</head>
<body>
	<div class="container">
		<div class="board-wrap">
		<h3>자유 게시판(JDBC=>CRUD)</h3>
		<div class="row">
		<table class="table">
			<tbody>
				<tr>
					<%-- 
						btn => link
						btn-xs / btn-md / btn-sm / btn-lg
						btn-danger(red) / btn-success(green) / btn-warning(yellow)
						btn-info(cyan) / btn-primary(blue) / btn-default(gray)
					 --%>
					<a href="insert.jsp" class="btn btn-sm btn-success" style="">글쓰기</a>
				</tr>
			</tbody>
		</table>
		</div>
		<div class="row" style="margin-top: 10px; height: 430px">
		<table class="table" style="">
			<thead>
				<tr class="danger">
					<th width="10%" class="text-center">no</th>
					<th width="45%" class="text-center">제목</th>
					<th width="15%" class="text-center">이름</th>
					<th width="20%" class="text-center">작성일</th>
					<th width="10%" class="text-center">조회수</th>
				</tr>
			</thead>
			<tbody>
			<%-- for 문 들어갈 자리 --%>
			<% for(BoardVO vo : list) { %>
				<tr>
					<td width="10%" class="text-center"><%=count--  %></td>
					<td width="45%">
						<a href="detail.jsp?no=<%=vo.getNo() %>">
						<%=vo.getSubject() %></a>
						&nbsp;
						
					<%
						// 작성일이 오늘이면 sup태그 출력
						if(today.equals(vo.getDbday())) {
					%>
						<sup><img src="new.gif"></sup>
					<%		
						}
					%>
					</td>
					<td width="15%" class="text-center"><%=vo.getName() %></td>
					<td width="20%" class="text-center"><%=vo.getDbday() %></td>
					<td width="10%" class="text-center"><%=vo.getHit() %></td>
				</tr>
			<% } %>
			</tbody>
		</table>
		</div>
		<div class="row text-center" style="margin-top: 20px;">
			
			<a href="list.jsp?page=<%=curPage>1?curPage-1:curPage %>" class="btn btn-sm btn-warning">이전</a>&nbsp;
			<%=curPage %> page / <%=totalpage %> pages&nbsp;
			<a href="list.jsp?page=<%=curPage<totalpage?curPage+1:curPage %>" class="btn btn-sm btn-warning">다음</a>
		</div>
		</div>
	</div>
</body>
</html>