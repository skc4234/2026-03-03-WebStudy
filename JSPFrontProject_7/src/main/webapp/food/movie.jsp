<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#findBtn').on('click',function(){
		let fd=$('#fd').val()
		if(fd.trim()==="") {
			$('#fd').focus()
			return
		}
		search(fd)
	})
})
const search=async(fd)=>{ // fetch: 비동기=>React, JQuery: Ajax
	try {
		const response=await fetch('https://youtube.googleapis.com/youtube/v3/search?part=snippet&maxResults=28&q='+fd+'&type=video&key="API"')
		const result=await response.json()
		const movie=result.items
		console.log(movie)
		let html=''
		movie.forEach((m)=>{
			html+='<div class="col-sm-4">'+
				'<div class="thumbnail">'+
				'<embed src="https://www.youtube.com/embed/'+m.id.videoId+'">'+
				'<p>'+m.snippet.title+'</p>'+
				'</div>'+
				'</div>'
		})
		$('#print').html(html)
	} catch (e) {
		console.log("error: "+e)
	}
}
</script>
</head>
<body>
<div class="container">
	<div class="row text-center">
		<h4>Youtube</h4>
		<input type="text" size="40" id="fd" class="input-sm">
		<button type="button" id="findBtn" class="btn-sm btn-success">🔎 검색</button>
	</div>
	<div class="row" style="margin-top: 30px" id="print">
		
	</div>
</div>
</body>
</html>