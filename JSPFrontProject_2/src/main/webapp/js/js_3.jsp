<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	width: 1200px;
}
</style>
<script type="text/javascript">
// 속성 변경(조작) : img.src 이미지 변경
let index=1
window.onload=()=>{
	let alt="m1.jpg"
	let a=document.getElementById('a')
	a.textContent=alt
}
let prev=()=>{
	index--
	if(index<1) index=7
	let img=document.querySelector("img")
	let path="../images/m"+index+".jpg"
	img.src=path
	let alt="m"+index+".jpg"
	let a=document.getElementById('a')
	a.textContent=alt
}
let next=()=>{
	index++
	if(index>7) index=1
	let img=document.querySelector("img")
	let path="../images/m"+index+".jpg"
	img.src=path
	let alt="m"+index+".jpg"
	let a=document.getElementById('a')
	a.textContent=alt
}
// 지정된 시간마다 호출
let auto=()=>{
	setInterval(()=>{
		next()
	},1000) // 1/1000초
}

</script>
</head>
<body>
<div class="container">
	<div class="row">
		<table class="table">
			<tr class="text-center">
				<td>
					<img src="../images/m1.jpg" style="height: 480px; object-fit:cover;">
				</td>
			</tr>
			<tr class="text-center">
				<td><div id="a"></div></td>
			</tr>
			<tr class="text-center">
				<td>
					<button type=button class="btn-sm btn-warning" onclick="prev()">이전</button>
					<button type=button class="btn-sm btn-info" onclick="next() ">다음</button>
					<button type=button class="btn-sm btn-success" onclick="auto()">자동</button>
				</td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>