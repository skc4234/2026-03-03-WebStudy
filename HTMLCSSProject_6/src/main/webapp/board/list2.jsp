<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*, java.text.*" %>
<%
	String strPage = request.getParameter("page");
	if(strPage==null) strPage="1";
	int curPage = Integer.parseInt(strPage);
	BoardDAO dao = new BoardDAO();
	List<EmpVO> list = dao.empListData(curPage);
	int count = dao.empTotalCount();
	int totalpage = (int)Math.ceil(count/10.0);
	

	String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

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
		<h3>사원 목록</h3>
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
					<a href="#" class="btn btn-sm btn-success" style="">추가하기</a>
				</tr>
			</tbody>
		</table>
		</div>
		<div class="row" style="margin-top: 10px; height: 430px">
		<table class="table" style="">
			<thead>
				<tr class="danger">
					<th width="10%" class="text-center">사번</th>
					<th width="35%" class="text-center">이름</th>
					<th width="15%" class="text-center">직업</th>
					<th width="20%" class="text-center">입사일</th>
					<th width="10%" class="text-center">연봉</th>
					<th width="10%" class="text-center">부서번호</th>
				</tr>
			</thead>
			<tbody>
			<%-- for 문 들어갈 자리 --%>
			<% for(EmpVO vo : list) { %>
				<tr>  v
					<td width="10%" class="text-center"><%=vo.getEmpno() %></td>
					<td width="35%">
						<a href="#">
						<%=vo.getEname() %></a>
						&nbsp;
						
<%-- 					<%
						// 작성일이 오늘이면 sup태그 출력
						if( ... ) {
					%>
						<sup><img src="new.gif"></sup>
					<%		
						}
					%> --%>
					</td>
					<td width="15%" class="text-center"><%=vo.getJob() %></td>
					<td width="20%" class="text-center"><%=vo.getDbday() %></td>
					<td width="10%" class="text-center"><%=vo.getSal() %></td>
					<td width="10%" class="text-center"><%=vo.getDeptno() %></td>
				</tr>
			<% } %>
			</tbody>
		</table>
		</div>
		<div class="row text-center" style="margin-top: 20px;">
			
			<a href="list2.jsp?page=<%=curPage>1?curPage-1:curPage %>" class="btn btn-sm btn-warning">이전</a>&nbsp;
			<%=curPage %> page / <%=totalpage %> pages&nbsp;
			<a href="list2.jsp?page=<%=curPage<totalpage?curPage+1:curPage %>" class="btn btn-sm btn-warning">다음</a>
		</div>
		</div>
	</div>
</body>
</html>