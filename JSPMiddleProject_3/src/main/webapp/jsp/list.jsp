<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*"%>
<%
	// 1. 사용자 요청 정보 => page
	String strPage=request.getParameter("page");
	// 페이지 값이 없는 경우 => 첫 화면 실행시
	if(strPage==null) strPage="1";
	int curPage = Integer.parseInt(strPage);
	MusicDAO dao = MusicDAO.newInstance();
	List<MusicVO> list = dao.musicListData(curPage);
	int totalPage = dao.musicTotalPage();
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
	width: 1024px;
}
h3 {
	text-align: center;
}
</style>
</head>
<body>
<div class="container">
	<div class="row">
		<h3>뮤직 Top 200</h3>
		<table class="table">
			<tr class="danger">
				<th class="text-center">순위</th>
				<th class="text-center"></th>
				<th class="text-center"></th>
				<th class="text-center">곡명</th>
				<th class="text-center">가수명</th>
				<th class="text-center">앨범</th>
			</tr>
			<%
				for(MusicVO vo : list) {
			%>		
					<tr>
						<td class="text-center"><%=vo.getNo() %></td>
						<td class="text-center">
							<%
							String s="-";
							if(vo.getState().equals("상승")) {
								s="<font color='red'>▲</font>"+vo.getIdcrement();
							}
							else if(vo.getState().equals("하강")) {
								s="<font color='blue'>▼</font>"+vo.getIdcrement();
							}
							%>
							<%=s %>
						</td>
						<td class="text-center">
							<img src="<%=vo.getPoster() %>">
						</td>
						<td><%=vo.getTitle() %></td>
						<td><%=vo.getSinger() %></td>
						<td><%=vo.getAlbum() %></td>
					</tr>
			<%		
				}
			%>
			
		</table>
		<table class="table">
		<tr>
			<td colspan="6" class="text-center">
				<a href="list.jsp?page=<%=curPage>1?curPage-1:curPage %>" class="btn btn-sm btn-success">이전</a>
				<%=curPage %> page / <%=totalPage %> pages
				<a href="list.jsp?page=<%=curPage<totalPage?curPage+1:curPage %>" class="btn btn-sm btn-success">다음</a>
		
			</td>
		</tr>
		</table>
	</div>
</div>
</body>
</html>