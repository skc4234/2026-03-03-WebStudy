<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*" %>
<%
	// 1. 사용자가 요청한 데이터를 받는다
	String strPage = request.getParameter("page");
	if(strPage==null) strPage="1";
	int curPage = Integer.parseInt(strPage);
	// 2. 받은 데이터를 DAO 메소드 매개변수 첨부
	FoodDAO dao = FoodDAO.newInstance();
	List<FoodVO> list = dao.foodListData(curPage);
	// 3. 데이터 읽기 : 화면 읽기
	int totalPage = dao.foodTotalPage();
	
	// 블록별
	final int BLOCK=10;
	int startPage = ((curPage-1)/BLOCK*BLOCK)+1;
	int endPage = ((curPage-1)/BLOCK*BLOCK)+BLOCK;
	if(endPage>totalPage) endPage=totalPage;
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container {
	margin-top: 40px;
}
.row {
	margin: 0px auto;
	width: 1024px;
}
p {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
img {
	width: 240px;
	height: 150px;
	object-fit: cover;
}
</style>
</head>
<body>
<div class="container">
	<div class="row">
		<%
			for(FoodVO vo : list) {
		%>
			<div class="col-md-3">
    			<div class="thumbnail">
    				<%-- 쿠키 전송 --%>
      				<a href="#">
        				<img src="<%=vo.getPoster() %>">
        				<div class="caption">
          					<p><%=vo.getName() %></p>
        				</div>
      				</a>
    			</div>
  			</div>		
		<%	}
		%>
	</div>
	<div class="row text-center" style="margin-top: 20px">
		<ul class="pagination">
			<%
				if(startPage>1) {
			%>
					<li><a href="list.jsp?page=<%=startPage-1%>">&laquo;</a></li>
			<%		
				}
			%>
			<%
				for(int i=startPage; i<=endPage; i++) {
			%>
					<li <%=i==curPage?"class=active":"" %>><a href="list.jsp?page=<%=i%>"><%=i %></a></li>
			<%
				}
			%>
			<%
				if(endPage<totalPage) {
			%>
					<li><a href="list.jsp?page=<%=endPage+1%>">&raquo;</a></li>
					
			<%		
				}
			%>
		</ul>
	</div>
</div>
</body>
</html>