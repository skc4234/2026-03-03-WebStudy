<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#findBtn').on('click',function(){
		if($('#fd').val().trim()==="") {
			alert("검색어를 입력하세요")
			return
		}
		dataRecv(1)
	})
	$('#fd').on('keydown',function(e){
		if(e.key==='Enter') {
			if($('#fd').val().trim()==="") {
				alert("검색어를 입력하세요")
				return
			}
			dataRecv(1)
		}
	})
})
function dataRecv(page){
	$.ajax({
		type: 'post',
		data: {
			"page": page,
			"col": $('#col').val(),
			"fd": $('#fd').val()
		},
		url: '../food/find_ajax.do',
		success: function(response) {
			//console.log(response)
			let json=JSON.parse(response)
			console.log(json)
			let html=''
			if(json===""){
				html+='<h3 class="text-center">검색 결과가 없습니다...</h3>'
				$('#print').html(html)
			}
			else {
				json.forEach((food)=>{
					html+='<div class="col-sm-3">'+
						'<a href="../food/detail.do?no='+food.no+'">'+
						'<div class="thumbnail">'+
						'<img src="'+food.poster+'" title="'+food.address+'" style="width: 200px; height: 180px">'+
						'<p>'+food.name+'</p>'+
						'</div>'+
						'</a>'+
						'</div>'
				})
				$('#print').html(html)
			
				let curPage=json[0].curPage
				let totalPage=json[0].totalPage
				let startPage=json[0].startPage
				let endPage=json[0].endPage
			
				let pageHtml='<ul class="pagination">'
				if(startPage>1) {
					pageHtml+='<li><a class="link" onclick="prev('+(startPage-1)+')">&laquo;</a></li>'
				}
				for(let i=startPage; i<=endPage; i++) {
					pageHtml+='<li '+(curPage===i?"class=active":"")+'><a class="link" onclick="change('+i+')">'+i+'</a></li>'
				}
				if(endPage<totalPage) {
					pageHtml+='<li><a class="link" onclick="next('+(endPage+1)+')">&raquo;</a></li>'
				}
				$('#paging').html(pageHtml)

			}
			
		}
	})
}
function prev(page) {
	dataRecv(page)
}
function next(page) {
	dataRecv(page)
}
function change(page) {
	dataRecv(page)
}
</script>
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
.link {
	cursor: pointer;
}
</style>
</head>
<body>
<div class="container">
	<div class="row text-right">
		<select id="col" class="input-sm">
			<option value="address" selected>주소</option>
			<option value="name">맛집명</option>
			<option value="type">카테고리</option>
		</select>
		<input type="text" size="20" id="fd" class="input-sm" value="마포">
		<button type="button" id="findBtn" class="btn-sm btn-primary">🔎 검색</button>
	</div>
	<div class="row" style="margin-top: 30px" id="print">
		
	</div>
	<div class="row text-center" style="margin-top: 30px" id="paging">
		
	</div>
</div>
</body>
</html>