<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*"%>
<%--
	자바 / HTML 분리
	- <% %> : 기본 자바
	- <%= %> : 출력값만 => System.out.println(...); => ; 사용 x
 --%>
<%
	// 1. 자바에서 화면에 출력할 데이터를 가져온다
	// 1-1. 사용자가 전송한 값을 받음(page)
	// 웹은 모든 데이터가 String => Wrapper 클래스로 정수 변경
	// list.jsp?page=1 => URL 뒤에 데이터 전송
	String strPage = request.getParameter("page");
	if(strPage==null) strPage="1"; // 시작하자마자 페이지 선택 못하는 경우 => default 페이지
	int curpage=Integer.parseInt(strPage);
	FoodDAO dao = new FoodDAO();
	List<FoodVO> list = dao.foodListData(curpage);
	int totalPage = dao.totalPage();
	
	final int BLOCK=10; // 페이지 수가 1~10
	int startPage=((curpage-1)/BLOCK*BLOCK)+1; // 1, 11, 21
	int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK; // 10, 20, 30
	if(endPage>totalPage) endPage=totalPage;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
/* 화면 간격 조절
	- 외부 여백 : margin
		- margin-top, margin-right, margin-bottom, margin-left
	- 내부 여백 : padding
	- 테두리 : border
 */
.container {
	/* 전체 영역 */
	margin-top: 50px;
}
.row {
	/* 출력 영역 */
	margin: 0px auto;
	width: 960px;
}
p {
	overflow: hidden;
	white-space: nowrap; /* 다음줄로 내리지 않는다 */
	text-overflow: ellipsis;
}
</style>
</head>
<body>
	<div class="container"> <!-- 전체 영역 -->
		<div class="row">
		<% for(FoodVO vo : list) { %>
			<div class="col-md-3"> <!-- 한 줄에 4개씩 출력, 숫자 합이 12가 되면 자동으로 다음줄로 내려간다 -->
      			<div class="thumbnail">
        			<a href="detail.jsp?no=<%=vo.getNo() %>">
          			<img src=<%= vo.getPoster() %> title=<%= vo.getName() %> style="width:240px; height: 150px;">
          			<div class="caption">
            			<p><%= vo.getName() %></p>
          			</div>
        			</a>
        		</div>
      		</div>
      	<% } %>
		</div>
		<div class="row text-center">
			<ul class="pagination">
				<%
					if(startPage>1) {
				%>
				<li><a href="list.jsp?page=<%=startPage-1 %>">&laquo;</a></li>
				<% } %>
				<%
					for(int i=startPage; i<=endPage; i++) {
				%>
				<li <%=i==curpage?"class=active":"" %>><a href="list.jsp?page=<%=i %>"><%=i %></a></li>
				<% } %>
				<%
					if(endPage<totalPage) {
				%>
				<li><a href="list.jsp?page=<%=endPage+1 %>">&raquo;</a></li>
				<% } %>
			</ul>
		</div>
	</div>



</body>
</html>