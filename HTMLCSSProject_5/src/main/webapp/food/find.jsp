<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*, java.util.*"%>
<%--
	HTML 태그
	화면 UI => <div> <span> <ul> ...
	데이터 입력 => 전송
		- 데이터를 모아서 한번에 전송 => <form>
		- method : get(일반검색) / post(보안)
		- 데이터 전송하는 태그들은 반드시 name 속성을 가지고 있어야함
		
	HTML에서 전송할때는 JavaScript로 처리(Ajax, Vue, React)
	
	- GET : SELECT
	- POST : INSERT
	===============
	- PUT : UPDATE
	- DELETE : DELETE
	=============== REST API
	
	
	1. VO/DTO => 오라클에서 보낸 값을 모아서 전송 목적 => 컬럼명과 일치
	2. DAO => VO에 값을 채움
	3. JSP => 화면 UI(HTML/CSS)
	4. DAO에서 얻어온 데이터를 화면에 출력
	
	JSP
		- 재사용이 어렵다 => 한 번만 사용 후 버림
		- 보안이 취약하다 => 자바는 .class 파일만 / JSP는 통째로 전송
		- UI로만 사용 => 화면 출력(View) => Front	
 --%>

<%	
	String column = request.getParameter("column");
	String fd = request.getParameter("fd");
	FoodDAO dao = new FoodDAO();
	List<FoodVO> list = dao.foodFindData(column, fd);
	System.out.println(list.size());
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
	margin: 0px auto; /* 가운데 정렬*/
	width: 960px;
}
p {
	overflow: hidden; /* 크기를 넘어서면 자름 */
	white-space: nowrap; /* 줄바꿈 금지 => 한줄로만 출력 */
	text-overflow: ellipsis; /* 잘린 문자열을 ...으로 표현 */
}
</style>
</head>
<body>
	<div class="container">
		<div class="row text-center">
			<form action="find.jsp" method="get"> <!--
				form 태그
				- 데이터를 모아서 한번에 전송 : input, select, textarea
				- 속성
					- method : 공개/비공개 => GET/POST => GET이 default
					- action : 어떤 파일로 전송할지 => name 속성 필수
					
				- id, class : CSS / JavaScript에서 제어하기 위해 사용
				- name : JSP/Servlet으로 값을 전송
				
				input 태그의 속성
				- selected  checked  readonly  required  placeholder
				    radio  checkbox          text, textarea 
			 -->
			<select name="column" class="input-sm">
				<option value="address">주소</option>
				<option value="type" selected>음식종류</option>
				<option value="name">업체명</option>
			</select>
			<input type="text" name="fd" size=20 class="input-sm" required>
			<button class="btn-sm btn-info">검색</button>
			</form>
			
		</div>
		<div class="row" style="margin-top: 20px">
			<% for(FoodVO vo : list) { %>
				<div class="col-md-3"> <!-- 한 줄에 4개씩 출력, 숫자 합이 12가 되면 자동으로 다음줄로 내려간다 -->
      				<div class="thumbnail">
        				<a href="#">
          					<img src=<%= vo.getPoster() %> title=<%= vo.getName() %> style="width:240px; height: 150px;">
          					<div class="caption">
            					<p><%= vo.getName() %></p>
          					</div>
        				</a>
        			</div>
      			</div>
      		<% } %>
		</div>
	</div>
</body>
</html>