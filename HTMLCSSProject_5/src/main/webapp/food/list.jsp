<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, com.sist.dao.*"%>
<%-- 
	클래스가 아니고 메소드 영역
	
	public class list_jsp extends HttpServlet {
		public void _jspInit(){} => 초기화
		public void _jspDestroy(){} => 메모리 해제
		public void _jspService(){
			out.println("")
		} => 브라우저 전송 
	
	}
 --%>
 <%
 	// 사용자가 전송한 값 받기
 	String type = request.getParameter("type");
 
 	// 자바에서 데이터베이스 연결 => 화면에 출력할 데이터를 읽어온다
 	FoodDAO dao = new FoodDAO();
 	if(type==null) {
 		type="한식";	
 	}
 	
 	String strPage=request.getParameter("page");
 	if(strPage==null) strPage="1";
 	int curpage = Integer.parseInt(strPage);
 	List<FoodVO> list = dao.foodListData(curpage, type);
 	int totalPage = dao.foodTotalPage(type);
 	// 데이터 확인
 	System.out.println("요청 : " + type);
 	System.out.println("현재 페이지 : " + curpage);
 	System.out.println("총 페이지 : " + totalPage);
 	System.out.println("데이터 : " + list);
 	
 	// URL 파라미터 : 공백 불가
 	// 데이터를 받는 JSP
 	// 데이터 전송 시 .jsp?변수=값&변수=값&...
 	// 모든 데이터는 String 으로 받는다
 	
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
	<div class="container">
		<div class="row text-center">
			<a href="list.jsp?type=한식" class="btn btn-lg btn-danger">한식</a>
			<a href="list.jsp?type=양식" class="btn btn-lg btn-success">양식</a>
			<a href="list.jsp?type=중식" class="btn btn-lg btn-warning">중식</a>
			<a href="list.jsp?type=일식" class="btn btn-lg btn-info">일식</a>
			<a href="list.jsp?type=분식" class="btn btn-lg btn-primary">분식</a>
		</div>
		<div class="row" style="margin-top: 20px">
			<% for(FoodVO vo : list) { %>
				<div class="col-md-3"> <!-- 한 줄에 4개씩 출력, 숫자 합이 12가 되면 자동으로 다음줄로 내려간다 -->
      				<div class="thumbnail">
        				<a href="#">
          					<img src=<%= vo.getPoster() %> title=<%= vo.getName() %> style="width:240px; height: 150px;">
          					<div class="caption">
            					<p><%= vo.getName() %></p>
          					</div>
        				</a>
        			</div>
      			</div>
      		<% } %>
      		<div class="row text-center">
      			<a href="list.jsp?type=<%=type %>&page=<%=curpage>1?curpage-1:curpage %>" class="btn btn-sm btn-warning">이전</a>
      			<%=curpage %> page / <%=totalPage %> pages
      			<a href="list.jsp?type=<%=type %>&page=<%=curpage<totalPage?curpage+1:curpage %>" class="btn btn-sm btn-warning">다음</a>
      		</div>
		</div>
	</div>
</body>
</html>