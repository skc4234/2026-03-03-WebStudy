<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	이벤트 처리
	1. 고전적인 방법
		- $('css 선택자').click(function(){})
		- $('css 선택자').keyup(function(){})
		- $('css 선택자').hover(function(){},function(){})
							   mouseover    mouseout	
	2. 리스너 방법 : JQuery4에서 권장
		- $('css 선택자').on('click',function(){})
		- $('css 선택자').on('keydown',function(){})
		
		
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container {
	margin-top: 30px
}
.row {
	margin: 0px auto;
	width: 500px;
}
#chatArea {
	width: 300px;
	height: 300px;
	overflow-y: auto;
	border: 1px solid black;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-4.0.0.min.js"></script>
<script type="text/javascript">
// 태그를 제어하는 프로그램 => DOMScript => 라이브러리
// 속성 / 스타일 / 데이터 조작 => JQuery
// JQuery 3/4버전은 호환 가능
$(function(){
	$('#sendMsg').on('keydown',function(key){
		if(key.keyCode===13) { // 13 => Enter, JQuery4에서는 'Enter'로 가능
			let msg=$(this).val()
			if(msg.trim()===""){ // 좌우 공백 제거 => 입력값이 없음
				$(this).focus()
				return
			}
			$('#recvMsg').append(msg+"<br>")
			$(this).val('')
			$(this).focus()
			
			let ch=$('#chatArea').height()
			let m=$('#recvMsg').height()-ch
			$('#chatArea').scrollTop(m)
		}
	})
})
</script>
</head>
<body>
<div class="container">
	<div class="row">
		<h1 class="text-center">실시간 채팅</h1> <%-- WebSocket, stormp 사용 => 실시간 채팅, 알림 등 --%>
		<table class="table">
			<tr>	
				<td>
				<div id="chatArea">
					<div id="recvMsg"></div>
				</div>
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" size=30 id="sendMsg">
					<!-- <button type="button" class="btn-sm btn-info">전송</button> -->
				</td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>