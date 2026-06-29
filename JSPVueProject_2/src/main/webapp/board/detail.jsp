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
.btn {
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
		<h3>내용보기</h3>
		<table class="table">
			<tbody></tbody>
		</table>
		<table class="table">
			<tbody>
				<tr>
					<th width="20%" class="danger text-center">번호</th>
					<td width="30%" class="text-center">{{detail.no}}</td>
					<th width="20%" class="danger text-center">작성일</th>
					<td width="30%" class="text-center">{{detail.dbday}}</td>
				</tr>
				<tr>
					<th width="20%" class="danger text-center">이름</th>
					<td width="30%" class="text-center">{{detail.name}}</td>
					<th width="20%" class="danger text-center">조회수</th>
					<td width="30%" class="text-center">{{detail.hit}}</td>
				</tr>
				<tr>
					<th width="20%" class="danger text-center">제목</th>
					<td colspan="3">{{detail.subject}}</td>
				</tr>
				<tr>
					<td colspan="4" class="text-left" valign="top" height="200">
						<pre style="white-space: pre-wrap; background-color: white; border: none">{{detail.content}}</pre>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="text-right">
						<a :href="'../board/update.do?no='+no" class="btn btn-xs btn-warning">수정</a>
						<span class="btn btn-xs btn-danger" @click="btnClick()">
							{{isOn?'삭제':'취소'}}
						</span>
						<a href="../board/list.do" class="btn btn-xs btn-info">목록</a>
					</td>
				</tr>
				<tr v-show="bShow">
					<td colspan="4" class="text-right">
						<%--
							v-model : data() 안에 있는 변수와 연결(양방향 통신) 
									=> 입력 시에 바로 pwd 변수에 값을 채운다
									==> let pwd=$('#pwd').val() => 단방향
						--%>
						비밀번호 : <input type="password" size="15" class="input-sm" ref="pwdRef" v-model="pwd">
						<button class="btn btn-sm btn-primary" @click="del()">삭제</button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<script>
	const detailApp=Vue.createApp({
		data(){
			return {
				bShow:false,
				msg:'삭제',
				isOn:true,
				pwd:'',
				detail:{}, // VO
				no:${param.no}
			}
		},
		/* 	생명주기 함수: 자동 호출
	 	created() : Vue 객체가 생성
		mounted() : 브라우저에 화면이 출력된 경우
			=> window.onload(){} : 바닐라JS
			=> $(function(){}) : JQuery
			=> componentDidMount()
				=> useEffect() : React
		updated() : data() 안에 있는 데이터가 수정되는 경우
		unmounted() : 화면 이동 / 브라우저 종료 / 새로 고침
		*/
		mounted(){
			axios.get('../board/detail_vue.do',{
				params:{
					no:this.no
				}
			// response : 실행된 결과를 자동으로 첨부한다 => JSON {}
			}).then(response=>{
				console.log(response.data)
				this.detail=response.data
			})
		},
		methods:{
			btnClick(){
				this.isOn=!this.isOn
				this.bShow=!this.bShow
			},
			del(){
				if(this.pwd.trim()==='') {
					this.$refs.pwdRef.focus()
					return
				}
				// Ajax : data:{no:$('#no').val(), pwd:$('#pwd').val()}
				//  ==> 자체 비동기 처리
				// fetch : fetch('../board/delete_vue.do?no=${no}&pwd=${pwd}')
				// ==> JSON / 일반 문자열
				// axios,fetch => async/await => 비동기 처리 함수
				axios.get('../board/delete_vue.do',{
					params:{
						no:this.no,
						pwd:this.pwd
					}
				}).then(response=>{
					if(response.data==='yes') {
						alert('게시물이 삭제되었습니다')
						window.location.href="../board/list.do"
					}
					else {
						alert('비밀번호가 틀렸습니다')
						this.pwd=''
						this.$refs.pwdRef.focus()
					}
				})
			},
			dataRecv(no){
				axios.get('../board/detail_vue.do',{
					params:{
						no:no
					}
				}).then(response=>{
					//console.log(response.data)
					this.detail=response.data
				})
			}
		}
	}).mount('.container')
</script>
</body>
</html>