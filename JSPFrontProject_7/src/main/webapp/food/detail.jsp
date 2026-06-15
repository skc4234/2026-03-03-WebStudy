<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row {
	margin: 0px auto;
	width: 800px;
}
</style>
</head>
<body>
<div class="container">
	<div class="row">
		<table class="table">
			<tr>
				<td width="40%" class="text-center" rowspan="8">
					<img src="${vo.poster }" style="width: 320px; height: 305px; object-fit: cover">
				</td>
				<td colspan="2">
					<h3>${vo.name }&nbsp;<span style="color: ${vo.score>=3.5?'red':'blue'}">${vo.score!=0?vo.score:'(-)' }</span></h3>
				</td>
			</tr>
			<tr>
				<td width="10%">카테고리</td>
				<td width="50%">${vo.type }</td>
			</tr>
			<tr>
				<td width="10%">전화번호</td>
				<td width="50%">${vo.phone }</td>
			</tr>
			<tr>
				<td width="10%">주소</td>
				<td width="50%">${vo.address }</td>
			</tr>
			<tr>
				<td width="10%">주차</td>
				<td width="50%">${vo.parking }</td>
			</tr>
			<tr>
				<td width="10%">영업시간</td>
				<td width="50%">${vo.time }</td>
			</tr>
			<tr>
				<td width="10%">테마</td>
				<td width="50%">${vo.theme }</td>
			</tr>
			<tr>
				<td width="10%">가격</td>
				<td width="50%">${vo.price }</td>
			</tr>
			<tr>
				<td colspan="3">${vo.content }</td>
			</tr>
			<tr class="text-right">
				<td colspan="3">
					<a href="#" class="btn btn-xs btn-primary">👍추천</a>
					<a href="#" class="btn btn-xs btn-danger">❤️찜하기</a>
					<a href="../main/main.do" class="btn btn-xs btn-success">📜목록</a>
				</td>
			</tr>
		</table>
	</div>
	<div class="row" style="margin-top: 10px">
		<h3>댓글</h3>
		<hr>
		<c:if test="${rcount<1 }">
			<table class="table">
				<tr>
					<td class="text-center">댓글이 없습니다.</td>
				</tr>
			</table>
		</c:if>
		<c:if test="${rcount>0 }">
			<table class="table">
				<tr>
					<td>
						<c:forEach var="rvo" items="${rList }">
							<table class="table">
								<tr>
									<td class="text-left">◑ ${rvo.name } (${rvo.dbday })</td>
									<td class="text-right">
										<c:if test="${rvo.id==sessionScope.id }">
											<span class="btn btn-xs btn-success">수정</span>
											<a href="#" class="btn btn-xs btn-info">삭제</a>
										</c:if>
									</td>
								</tr>
								<tr>
									<td colspan="2">${rvo.msg }</td>
								</tr>
							</table>
						</c:forEach>
					</td>
				</tr>
			</table>
			</c:if>
			<c:if test="${sessionScope.id!=null }">
			<table class="table">
			<form action="../reply/insert.do" method="post">
				<tr>
					<td>
					<input type="hidden" name="fno" value="${vo.no }">
					<textarea rows="4" cols="97" style="margin-right: 3px; float: left" name="msg"></textarea>
					<button type="submit" class="btn-primary" style="width: 80px; height: 86px; float: left">댓글 쓰기</button>
					</td>
				</tr>
			</form>
			</table>
			</c:if>
	</div>
</div>
</body>
</html>