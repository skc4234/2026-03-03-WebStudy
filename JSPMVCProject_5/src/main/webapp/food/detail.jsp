<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="margin: 0px auto; width: 960px;">
<img src="${vo.poster }" style="height: 400px; margin-bottom: 20px;">
<p>${vo.no }. ${vo.name }  
<c:choose>
	<c:when test="${vo.score==0.0 }">
		<span>( - )</span>
	</c:when>
	<c:when test="${vo.score>=3.5 }">
		<span style="color: red; font-size: 16px">${vo.score }</span>
	</c:when>
	<c:otherwise>
		<span style="color: blue">${vo.score }</span>
	</c:otherwise>
</c:choose>

</p>
<p>${vo.type }</p>
<p>${vo.price }</p>
<p>${vo.phone }</p>
<p>${vo.address }</p>
<p>${vo.parking }</p>
<p>${vo.time }</p>
<p>${vo.theme }</p>
<p>${vo.content }</p>
<button type="button" class="btn-sm btn-success" onclick="javascript:history.back()">목록</a>
</div>
</body>
</html>