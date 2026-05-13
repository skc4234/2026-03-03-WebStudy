<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*"%>
<%
	String strNo = request.getParameter("no");
	int no = Integer.parseInt(strNo);
	FoodDAO dao = new FoodDAO();
	FoodVO vo = dao.foodDetailData(no);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container {
	/* 전체 영역 */
	margin-top: 50px;
}
.row {
	width: 860px;
	margin: 0px auto;
}
</style>
</head>
<body>
	<div class="container">
	<div class="row">
	<table class="table">
		<tbody>
			<tr>
				<td width="30%" rowspan="8">
					<img src="<%=vo.getPoster() %>" style="width:350px; height: 350px;" class="img-rounded">
				</td>
				<td colspan="2" class="text-center"><h3><%=vo.getName() %>&nbsp;
				<span style="color:<%=vo.getScore()>=3.0?"red":"blue" %>;"><%=vo.getScore() %></span>
				</h3></td>
			</tr>
			<tr>
				<th width="10%" class="text-center">카테고리</th>
				<td width="60%"><%=vo.getType() %></td>
			</tr>
			<tr>
				<th width="10%" class="text-center">전화번호</th>
				<td width="60%"><%=vo.getPhone() %></td>
			</tr>
			<tr>
				<th width="10%" class="text-center">주소</th>
				<td width="60%"><%=vo.getAddresss() %></td>
			</tr>
			<tr>
				<th width="10%" class="text-center">주차</th>
				<td width="60%"><%=vo.getParking() %></td>
			</tr>
			<tr>
				<th width="10%" class="text-center">영업시간</th>
				<td width="60%"><%=vo.getTime() %></td>
			</tr>
			<tr>
				<th width="10%" class="text-center">테마</th>
				<td width="60%"><%=vo.getTheme() %></td>
			</tr>
			<tr>
				<th width="10%" class="text-center">가격</th>
				<td width="60%"><%=vo.getPrice() %></td>
			</tr>
			<tr>
				<td colspan="3" class="text-right">
					<button class="btn-xs btn-danger">좋아요</button>
					<button class="btn-xs btn-success">찜하기</button>
					<button class="btn-xs btn-warning">예약</button>
					<button class="btn-xs btn-primary" onclick="javascript:history.back()">목록</button>
				</td>
			</tr>
			<tr>
				<td colspan="3">
				<pre style="white-space: pre-wrap; background-color: white; border:none">
 <%=vo.getContent() %></pre>
				</td>
			</tr>
		</tbody>
	</table>
	</div>
	</div>
</body>
</html>