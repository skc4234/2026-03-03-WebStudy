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
		<h3>수정하기</h3>
		<table class="table">
			<tbody>
				<tr>
					<th class="text-center success" width="10%">이름</th>
					<td width="90%">
						<input type="text" size="20" class="input-sm" ref="nameRef" v-model="name">
					</td>
				</tr>
				<tr>
					<th class="text-center success" width="10%">제목</th>
					<td width="90%">
						<input type="text" size="60" class="input-sm" ref="subRef" v-model="subject">
					</td>
				</tr>
				<tr>
					<th class="text-center success" width="10%">내용</th>
					<td width="90%">
						<textarea rows="10" cols="63" ref="contRef" v-model="content"></textarea>
					</td>
				</tr>
				<tr>
					<th class="text-center success" width="10%">비밀번호</th>
					<td width="90%">
						<input type="password" size="10" class="input-sm" ref="pwdRef" v-model="pwd">
					</td>
				</tr>
				<tr>
					<td colspan="2" class="text-center">
						<button class="btn btn-sm btn-info" @click="write()" type="button">수정</button>
						<button class="btn btn-sm btn-info" @click="cancel()" type="button">취소</button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<script>
	let update=Vue.createApp({
		data(){
			return {
				no:${param.no},
				name:'',
				subject:'',
				content:'',
				pwd:''
			}
		},
		// 화면 생성 => 필요한 데이터를 서버로부터 읽기
		// 다른 프레임워크 연동(JQuery, AngularJS)
		// TanStackQuery => Vue 연동
		mounted(){
			// 요청
			axios.get('../board/update_vue.do',{
				params:{
					no:this.no
				}
			// 응답 : response(text / json)
			//           text/html;  text/plain;
			// 요청 처리에 대한 결과값=> Model에서 처리
			}).then(response=>{
				console.log(response.data)
				this.name=response.data.name
				this.subject=response.data.subject
				this.content=response.data.content
				
			})
		},
		// 사용자 정의 함수 => 이벤트 처리
		methods:{
			cancel(){
				window.location.href="../board/detail.do?no="+this.no
			},
			write(){
				if(this.name.trim()==='') {
					// JQuery : $('#name').focus()
					this.$refs.nameRef.focus()
					return
				}
				else if(this.subject.trim()==='') {
					this.$refs.subRef.focus()
					return
				}
				else if(this.content.trim()==='') {
					this.$refs.contRef.focus()
					return
				}
				else if(this.pwd.trim()==='') {
					this.$refs.pwdRef.focus()
					return
				}
				
				// 서버 연결 => axios.post(url,data,config)
				axios.post('../board/update_ok.do',{},{
					params:{
						no:this.no,
						name:this.name,
						subject:this.subject,
						content:this.content,
						pwd:this.pwd
					}
				}).then(response=>{
					if(response.data==='yes') {
						window.location.href="../board/detail.do?no="+this.no
					}
					else {
						alert("비밀번호가 틀렸습니다...")
						this.pwd=''
						this.$refs.pwdRef.focus() // 태그 읽어오기 - JQuery => $('#pwd').focus()
					}
				})
			}
		}
		// components:{}, computed:{}, watch:{} => $emit : 채팅 시 사용
		// 실시간 => 채팅/뉴스/교통상황/날씨 => socket
		// 이메일 전송(회원가입 완료 시/예약 완료 시)
	}).mount('.container')
</script>
</body>
</html>