<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="16kb" info="지시자 연습파일"%>
<%--
	page 속성
		- info : 페이지 정보 기록 => 어떤 파일인지(상품 상세페이지)
		- buffer : 임시 기억 장소 => html 저장 위치
			- 디폴트는 8kb
			
			
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>
		현재 사용중인 메모리 크기 : <%=out.getBufferSize()-out.getRemaining() %>
	</p>
</body>
</html>