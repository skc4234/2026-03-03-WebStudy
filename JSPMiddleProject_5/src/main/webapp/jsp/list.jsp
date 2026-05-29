<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
	BoardModel model = new BoardModel();
	model.boardListData(request);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="style.css">
<!-- <style type="text/css">
/* 
	CSS : 선택자 => JQuery, Vanilla JS, Vue, React
	      text/font 속성
	      박스 속성 : margin, padding, border
	      배경 속성 : background
	      유동 속성 : z-index, float
	      가시 속성 : overflow, display
	      위치 속성 : absolute, relative, fixed
 */
/* 화면 출력 영역*/
.container {
	margin-top: 40px;
}
/* 실제 화면 출력*/
.row {
	margin: 0px auto;
	width: 800px;
}
h3 {
	text-align: center;
}
</style> -->
</head>
<body>
<div class="container">
	<div class="row">
		<h3>묻고 답하기</h3>
		<table class="table">
			<tr>
				<td>
					<a href="insert.jsp" class="btn btn-sm btn-info">새글</a>
				</td>
			</tr>
		</table>
		<table class="table">
			<tr>
				<th width="10%" class="text-center">번호</th>
				<th width="45%" class="text-center">제목</th>
				<th width="15%" class="text-center">이름</th>
				<th width="20%" class="text-center">작성일</th>
				<th width="10%" class="text-center">조회수</th>
			</tr>
			<c:set var="count" value="${count }"/>
			<c:forEach var="vo" items="${list }">
				<tr>
					<th width="10%" class="text-center">${count }</th>
					<th width="45%">
					
					<c:if test="${vo.group_tab>0 }">
						<c:forEach var="i" begin="1" end="${vo.group_tab }">
						&nbsp;&nbsp;
						</c:forEach>
						<img src="re_icon.png">
					</c:if>
					<c:if test="${vo.subject!=msg }">
						<a href="detail.jsp?no=${vo.no }">
							${vo.subject }
						</a>
						<c:if test="${vo.dbday==today }">
							<img src="new.gif">
						</c:if>
					</c:if>
					<c:if test="${vo.subject==msg }">
						<span style="color: gray">${vo.subject }</span>
					</c:if>
					
					</th>
					<th width="15%" class="text-center">${vo.name }</th>
					<th width="20%" class="text-center">${vo.dbday }</th>
					<th width="10%" class="text-center">${vo.hit }</th>
				</tr>
				<c:set var="count" value="${count-1 }"/>
			</c:forEach>
		</table>
		<table class="table">
			<tr>	
				<td class="text-left">
					<select class="input-sm">
						<option>이름</option>
						<option>제목</option>
						<option>내용</option>
					</select>
					<input type="text" name=fd size=15 class="input-sm">
					<button class="btn-sm btn-primary">검색</button>
				</td>
				<td class="text-right">
					<a href="list.jsp?page=${curPage>1?curPage-1:curPage }" class="btn btn-sm btn-warning">이전</a>
					${curPage } page / ${totalPage } pages
					<a href="list.jsp?page=${curPage<totalPage?curPage+1:curPage }" class="btn btn-sm btn-warning">다음</a>
				</td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>