<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	MVC
	DAO: SQL+JAVA => MyBatis
	JSP: 깜빡거림 효과 / 입력데이터 손실
		=> Ajax : 중간에 HTML을 만들어서 첨부
		=> Vue : HTML 자체 제어
		=> 태그로 제어 : ThymeLeaf
	
	2차
	ThymeLeaf + SpringBoot(MVC) + Pinia + MyBatis
	
	최종(개인)
	React(모듈) + nodeJS + nextJS
	CI/CD => Ubuntu 명령어 => AWS
	

	1차 프로젝트
	MVC / MyBatis / JSP
	JQuery / Ajax(예약) / Vue(검색/댓글)
	필수: 게시판/회원가입/로그인/회원 수정/탈퇴
	목록 출력 / 페이지 나누기 / 상세보기 / 좋아요 / 찜하기
	관리자 / 마이페이지
	
 --%>
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
	width: 800px;
}
p {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
.a-link:hover {
	cursor: pointer;
}
button {
	margin-left: 2px
}
h3 {
	text-align: center;
}
</style>
<script type="text/javascript" src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script type="text/javascript" src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
<div class="container">
	<div class="row">
		<h3>Vue를 이용한 게시판</h3>
		<table class="table">
			<tbody>
				<tr>
					<td>
						<a href="../board/insert.do" class="btn btn-sm btn-warning">새글	</a>
					</td>
				</tr>
			</tbody>
		</table>
		<table class="table table-hover table-striped">
			<thead>
				<tr class="danger">
					<th width="10%" class="text-center">번호</th>
					<th width="45%" class="text-center">제목</th>
					<th width="15%" class="text-center">이름</th>
					<th width="20%" class="text-center">작성일</th>
					<th width="10%" class="text-center">조회수</th>
				</tr>
			</thead>
			<tbody>
				<tr v-for="(vo,index) in list" key="index">
					<td width="10%" class="text-center">{{count-index}}</td>
					<td width="45%"><a :href="'../board/detail.do?no='+vo.no">{{vo.subject}}</a></td>
					<td width="15%" class="text-center">{{vo.name}}</td>
					<td width="20%" class="text-center">{{vo.dbday}}</td>
					<td width="10%" class="text-center">{{vo.hit}}</td>
				</tr>
				<!-- <tr>
					<td colspan="5" class="text-center">
						<button class="btn btn-sm btn-primary" type="button" @click="prev()">이전</button>
						{{curPage}} page / {{totalPage}} pages
						<button class="btn btn-sm btn-primary" type="button" @click="next()">다음</button>
					</td>
				</tr> -->
			</tbody>
		</table>
	</div>
	<div class="row text-center">
		<button class="btn btn-sm btn-primary" type="button" @click="prev()">이전</button>
			{{curPage}} page / {{totalPage}} pages
		<button class="btn btn-sm btn-primary" type="button" @click="next()">다음</button>
	</div>
</div>
<%-- 모듈화 --%>
<script type="importmap">
{
	"imports":{
		"vue":"https://unpkg.com/vue@3/dist/vue.esm-browser.js"
	}
}
</script>
<%-- = import java.util.List --%>
<script type="module">
	import {createApp} from "vue"
	const app=createApp({
		// data(){} = 변수 설정 => HTML에 적용 => 호출 시 반드시 this.
		data() {
			return {
				curPage:1,
				totalPage:0,
	            count:0,
				list:[]
			}
		},
		// 시작과 동시에 서버에서 데이터값 읽기 => window.onload(){}, $(function(){})
		mounted(){
			this.dataRecv()
		},
		// 사용자 정의 함수
		methods:{
			async dataRecv(){
				await axios.get('../board/list_vue.do',{
					params:{
						page:this.curPage
					}
				}).then(response=>{
					console.log(response.data)
					this.list=response.data.list
					this.curPage=response.data.curPage
					this.totalPage=response.data.totalPage
					this.count=response.data.count
				})
			},
			prev(){
				this.curPage=this.curPage>1?this.curPage-1:this.curPage
				this.dataRecv()
			},
			next(){
				this.curPage=this.curPage<this.totalPage?this.curPage+1:this.curPage
				this.dataRecv()
			}
		}
	})
	app.mount('.container')
</script>
</body>
</html>