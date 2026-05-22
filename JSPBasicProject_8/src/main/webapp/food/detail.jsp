<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*, com.sist.vo.*"%>
<%
	String no = request.getParameter("no");
	FoodDAO dao = FoodDAO.newInstance();
	FoodVO vo = dao.foodDetailData(Integer.parseInt(no));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
img {
	width: 100%;
	object-fit: cover;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row detail">
			<table class="table">
				<tbody>
					<tr>
						<td width="40%" class="text-center" rowspan="8">
							<img src="<%=vo.getPoster() %>" id="image" class="img-rounded">
						</td>
						<td colspan="2">
							<h3><%=vo.getName() %>&nbsp;
								<span style="color: <%=vo.getScore()>=3.0?"red":"blue"%>">
									<%=vo.getScore() %>
								</span>
							</h3>
						</td>
					</tr>
					<tr>
						<th class="text-center" style="color: gray" width="15%">카테고리</th>
						<td width="45%"><%=vo.getType() %></td>
					</tr>
					<tr>
						<th class="text-center" style="color: gray" width="15%">전화번호</th>
						<td width="45%"><%=vo.getPhone() %></td>
					</tr>
					<tr>
						<th class="text-center" style="color: gray" width="15%">주소</th>
						<td width="45%"><%=vo.getAddress()%></td>
					</tr>
					<tr>
						<th class="text-center" style="color: gray" width="15%">주차</th>
						<td width="45%"><%=vo.getParking() %></td>
					</tr>
					<tr>
						<th class="text-center" style="color: gray" width="15%">시간</th>
						<td width="45%"><%=vo.getTime() %></td>
					</tr>
					<tr>
						<th class="text-center" style="color: gray" width="15%">테마</th>
						<td width="45%"><%=vo.getTheme() %></td>
					</tr>
					<tr>
						<th class="text-center" style="color: gray" width="15%">가격</th>
						<td width="45%"><%=vo.getPrice() %></td>
					</tr>
					<tr>
						<td colspan="3"><%=vo.getContent() %></td>
					</tr>
					<tr>
						<td colspan="3" class="text-center">
							<a href="main.jsp" class="btn btn-sm btn-success">목록</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>