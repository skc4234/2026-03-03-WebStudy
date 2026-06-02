<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row {
	margin: 0px auto;
	width: 960px;
}
p {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
</style>
</head>
<body>
<div class="container">
	<div class="row">
		<c:forEach var="vo" items="${list }">
		  <div class="col-md-3"> <%-- 3줄 출력 --%>
    		<div class="thumbnail">
      			<a href="../food/detail.do?no=${vo.no }">
        			<img src="${vo.poster }" alt="${vo.address }" style="width:240px; object-fit:cover">
        			<div class="caption">
          				<p>${vo.name }</p>
        			</div>
      			</a>
    		</div>
  		  </div>
		</c:forEach>
	</div>
	<div class="text-center">
		<a href="main.do?page=${curPage>1?curPage-1:curPage }" class="btn btn-sm btn-info">이전</a>
		${curPage } page / ${totalPage } pages
		<a href="main.do?page=${curPage<totalPage?curPage+1:curPage }" class="btn btn-sm btn-info">다음</a>
	</div>
</div>
</body>
</html>