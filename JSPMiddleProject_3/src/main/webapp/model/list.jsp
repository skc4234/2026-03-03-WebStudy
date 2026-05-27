<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%--
	Tomcat 10 이상 => uri="jakarta.tags.core"
	 => jakarta
	Tomcat 10 미만 => uri="http://java.sun.com/jsp/jstl/core
	 => javax
 --%>
<%
	// MVC에서 Controller로 가져갈부분
	// 메소드 제작 => 호출
	MusicModel model = new MusicModel();
	model.musicListData(request);
	
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
h3 {
	text-align: center;
}
</style>
</head>
<body>
<div class="container">
	<div class="row">
		<h3>Music Top 200</h3>
		<table class="table" style="margin-top: 20px">
			<tr>
				<th width="10%" class="text-center">순위</th>
				<th width="10%" class="text-center"></th>
				<th width="10%" class="text-center"></th>
				<th width="35%" class="text-center">곡명</th>
				<th width="35%" class="text-center">가수명</th>
			</tr>
			<c:forEach var="vo" items="${list }">
				<tr>
					<td width="10%" class="text-center">${vo.no }</td>
					<td width="10%" class="text-center">
						<c:set var="id" value=""/>
						<c:choose>
							<c:when test="${vo.state.equals('상승') }">
								<font color=red>▲</font>${vo.idcrement }
							</c:when>
							<c:when test="${vo.state.equals('하강') }">
								<font color=blue>▼</font>${vo.idcrement }
							</c:when>
							<c:otherwise>-</c:otherwise>
						</c:choose>
					</td>
					<td width="10%" class="text-center">
						<img src="${vo.poster }" width="50" height="50">
					</td>
					<td width="35%">${vo.title }</td>
					<td width="35%">
						${vo.singer }<br>
						<sub>${vo.album }</sub>
					</td>
				</tr>
			</c:forEach>
		</table>
		<table class="table">
			<tr>
				<td class="text-center">
					<a href="list.jsp?page=${curPage>1?curPage-1:curPage }" class="btn btn-sm btn-success">이전</a>
					${curPage } page / ${totalPage } pages
					<a href="list.jsp?page=${curPage<totalPage?curPage+1:curPage }" class="btn btn-sm btn-success">다음</a>
				</td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>