<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	append()
	- val()과 달리 연속적으로 추가
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
	width: 600px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let fileIndex=0
$(function(){
	$('#add').on('click',function(){
		$('#user-table tbody').append(
			'<tr id=m'+fileIndex+'>'+
			'<td width=15%>File '+(fileIndex+1)+'</td>'+
			'</tr>'
		)
		fileIndex++
	})
	$('#remove').on('click',function(){
		if(fileIndex>0) {
			$('#m'+(fileIndex-1)).remove()
			fileIndex--
		}
	})
})
</script>
</head>
<body>
<div class="container">
	<div class="row">
		<h1>등록</h1>
		<table class="table">
			<tr>
				<td class="text-center">
					<button class="btn-sm btn-warning" type="button" id=add>Add</button>
					<button class="btn-sm btn-warning" type="button" id=remove>Remove</button>
				</td>
			</tr>
			<tr>
				<td>
					<table class="table" id="user-table">
						<tbody>
						</tbody>
					</table>
				</td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>