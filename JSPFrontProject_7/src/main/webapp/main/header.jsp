<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#loginBtn').on('click',function(){
		// 값 가져오기(유효성 검사=>강제입력)
		let id=$('#id').val()
		if(id.trim()==="") {
			$('#id').focus()
			return
		}
		let pwd=$('#pwd').val()
		if(pwd.trim()==="") {
			$('#pwd').focus()
			return
		}
		
		$.ajax({
			type: 'post',
			url: '../member/login.do',
			data: {"id": id, "pwd": pwd},
			success: function(result) { // 콜백 함수 : 실제 결과값을 가지고 있다
				if(result.trim()==="NOID") {
					alert("아이디가 존재하지 않습니다!!!")
					$('#id').val("")
					$('#pwd').val("")
					$('#id').focus()
				}
				else if(result.trim()==="NOPWD") {
					alert("비밀번호가 틀립니다!!!")
					$('#pwd').val("")
					$('#pwd').focus()
				}
				else {
					location.href="../main/main.do"
				}
			}
		})
	})
	$('#logoutBtn').on('click',function(){
		$.ajax({
			type: 'post',
			url: "../member/logout.do",
			success: function(result) {
				if(result.trim()==='YES') {
					//alert("로그아웃 되었습니다")
					location.href="../main/main.do"
				}
			}
		})
	})
})
</script>
</head>
<body>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Ajax/동적쿼리</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="#">맛집 검색</a></li>
      <li><a href="#">동영상 검색</a></li>
      <li><a href="#">커뮤니티</a></li>
    </ul>
  </div>
</nav>
<div class="container">
	<div class="row text-right">
	<c:if test="${sessionScope.id==null }">
		<!-- <form action="../member/login.do" method="post"> -->
			<table class="table">
				<tr>
					<td>
						ID <input type="text" id="id" size=15 class="input-sm">&nbsp;&nbsp;
						PW <input type="password" id="pwd" size=15 class="input-sm">
						<button class="btn-sm btn-info" id="loginBtn" type="button">로그인</button>
					</td>
				</tr>
			</table>
		<!-- </form> -->
	</c:if>
	<c:if test="${sessionScope.id!=null }">
		<!-- <form action="../member/logout.do"> -->
			<table class="table">
				<tr>
					<td>
						${sessionScope.name }님 로그인 되셨습니다
						<button class="btn-sm btn-danger" id="logoutBtn">로그아웃</button>
					</td>
				</tr>
			</table>
		<!-- </form> -->
	</c:if>
	</div>
</div>
</body>
</html>