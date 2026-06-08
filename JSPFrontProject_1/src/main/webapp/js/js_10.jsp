<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	[] : 서버에서는 ArrayList : JSONArray
	{} : 서버에서는 VO : JSONObject
	
	객체
		- {"키":값} => 값은 숫자/문자열("",'' 통일)
		- 키의 갯수가 동일하지 않을 수 있다
		- 사용 용도 => 자바><자바스크립트 연동
			- JSON은 데이터를 전송시에 주로 사용
			- 서버=브라우저, 서버=모바일
		- 사용법
			- let sawon={"sabun":1,"name":"홍길동"};
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=()=>{
	const sawon = {"sabun":1, "name":"홍길동", "loc":"서울"};
	document.write("<p>사번 : "+sawon.sabun+"</p>");
	document.write("<p>이름 : "+sawon.name+"</p>");
	document.write("<p>근무지 : "+sawon.loc+"</p>");
	
	document.write("<p>사번 : "+sawon["sabun"]+"</p>");
	document.write("<p>이름 : "+sawon["name"]+"</p>");
	document.write("<p>근무지 : "+sawon["loc"]+"</p>");
	
	
}
</script>
</head>
<body>

</body>
</html>