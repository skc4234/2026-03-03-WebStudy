window.onload=()=>{
	$.ajax({
		type:"POST",
		url:"list_ajax.do",
		data:{"page":1}, // 서버에 보내는 데이터, list_ajax.do?page=1
		success:function(json) { // callback => 자동 호출, 결과값을 매개변수로 받음(서버에서 받은 데이터)
			console.log(json)
			json=JSON.parse(json)
			console.log(json)
			foodPrint(json)
		}
	})
}

function foodPrint(json){
	let html='';
	json.forEach((food)=>{
		html+='<div class="col-sm-3">'+
			'<a href="#">'+
			'<div class="thumbnail">'+
			'<img src="'+food.poster+'" style="width: 200px; height: 200px; object-fit:cover;">'+
			'<p>'+food.name+'</p>'+
			'</div>'+
			'</a>'+
			'</div>'
	})
	$('#print').html(html)
	
	/*
				<c:if test="${startPage>1 }">
					<li><a href="list.do?page=${startPage-1 }">&laquo;</a></li>
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<li ${curPage==i?"class=active":"" }><a href="list.do?page=${i }">${i }</a></li>
				</c:forEach>
				<c:if test="${endPage<totalPage }">
					<li><a href="list.do?page=${endPage+1 }">&raquo;</a></li>
				</c:if>
	*/
	
	let pagePrint='<ul class="pagination">'
	let curPage=json[0].curPage
	let startPage=json[0].startPage
	let endPage=json[0].endPage
	let totalPage=json[0].totalPage
	if(startPage>1) pagePrint+='<li><a class="link" onclick="dataRecv('+(startPage-1)+')">&laquo;</a></li>'
	for(let i=startPage; i<=endPage; i++) {
		let li='<li>'
		if(i===curPage) li='<li class="active">'
		pagePrint+=li+'<a class="link" onclick="dataRecv('+i+')">'+i+'</a></li>'
	}
	if(endPage<totalPage) pagePrint+='<li><a class="link" onclick="dataRecv('+(endPage+1)+')">&raquo;</a></li>'
	pagePrint+='</ul>'
	$('#pagination').html(pagePrint)
}

function dataRecv(page){
	$.ajax({
			type:"POST",
			url:"list_ajax.do",
			data:{"page":page}, // 서버에 보내는 데이터, list_ajax.do?page=1
			success:function(json) { // callback => 자동 호출, 결과값을 매개변수로 받음(서버에서 받은 데이터)
				console.log(json)
				json=JSON.parse(json)
				console.log(json)
				foodPrint(json)
			}
		})
}