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
	margin-top: 50px
}
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
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-sm-3" v-for="vo in list">
			<a href="#">
			<div class="thumbnail">
				<img :src="vo.poster" style="width: 200px; height: 200px; object-fit:cover;">
				<p>{{vo.name }}</p>
			</div>
			</a>
		</div>
	</div>
	<div class="row text-center" style="margin-top: 20px">
		<%-- <ul class="pagination">
			<c:if test="${startPage>1 }">
				<li><a href="list.do?page=${startPage-1 }">&laquo;</a></li>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<li ${curPage==i?"class=active":"" }><a href="list.do?page=${i }">${i }</a></li>
			</c:forEach>
			<c:if test="${endPage<totalPage }">
				<li><a href="list.do?page=${endPage+1 }">&raquo;</a></li>
			</c:if>
		</ul> --%>
	</div>
</div>
<script>
let list=Vue.createApp({
	data(){
		return {
			// 멤버변수
			list:[],
			curPage:1,
			endPage:0,
			startPage:0,
			totalPage:0
		}
	},
	// window.onload / $(function(){})
	mounted() {
		this.dataRecv()
	},
	methods:{
		dataRecv() {
			axios.get('list_ajax.do',{
				params:{ // 서버에 보낼 값
					page:this.curPage
				}
			}).then(response=>{ // 결과값, ajax의 success:function(response){}
				console.log(response.data)
				this.list=response.data
				this.curPage=response.data[0].curPage
				this.totalPage=response.data[0].totalPage
				this.startPage=response.data[0].startPage
				this.endPage=response.data[0].endPage
			})
		}
	}
}).mount('.container')
</script>
</body>
</html>