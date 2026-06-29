<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
	1. Vue 특징
		- 가상 DOM(임시메모리) 사용 => 모든 작업 수행 => 실제 저장된 데이터와 비교 후 변경된 곳만 갱신
		- 저장 => mount('CSS 선택자') => 부분적 처리
		- 가볍다 / 사용이 쉽다 : 모든 개발자가 같은 패턴 사용 => 성능 최적화
		- Vue는 점차적으로 React형식으로 변경 중
		- Composition API(setup())
		- TypeScript 사용 권장
	2. Vue 역할
		- 상태 관리: 데이터 변경 => 자동으로 HTML에 적용
		- Vue: 관리+화면 ==> Vuex(프레임워크: NustJS) ==> Pinia(라이브러리)
	- UI : 디렉티브
		- v-if / v-else / 
		- v-bind: 변수와 태그 매칭, <img v-bind:
		- v-model: 양방향 통신
		- v-show: toggle
		- v-text / v-html
			- textContent => text() => v-text
			- innerHTML => html() => v-html => 사용 자제
		- v-memo : Callback => 재호출
		- v-once : 한번만 호출 필요시
		- v-on: 이벤트 처리, @
		- v-pre: 컴파일 생략
		- v-cloak: 로딩 깜빡이 방지
		- 화면 출력 시 v-text / {{}}
		- 형식
			Vue.createApp({
				// Model
				data() {
					return {
						// 변수
					}
				},
				// ViewModel
				// 생명 주기 함수
				mounted(){
					
				},
				methods:{
					// 사용자 정의 함수
				},
				components:{
					// 화면 조각, 통합
				},
				computed:{
				
				},
				watch:{
				
				}
			})
	- Server: axios / fetch => JavaScript 내장함수 => OpenAPI
	
	- Vue에서 화면 이동: Router
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container-fluid {
	margin-top: 50px
}
.row {
	margin: 0px auto;
	width: 100%;
	margin-top: 20px;
}
p {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
.a-link:hover {
	cursor: pointer;
}
</style>
<script type="text/javascript" src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script type="text/javascript" src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="page_card.js"></script>
</head>
<body>
<%-- View --%>
<div class="container">
	<div class="row">
		<select class="input-sm" v-model="column">
			<option value="address">주소</option>
			<option value="type">음식종류</option>
			<option value="name">업체명</option>
		</select>
		<input type="text" size="20" class="input-sm" v-model="ss" ref="ssInput" @keydown.enter="find()">
		<%--
			@submit.prevent=""
			@blur=""
			@click=""
			@change=""
			@keydown.enter=""
		 --%>
		<button type="button" class="btn btn-sm btn-primary" @click="find()">검색</button>
	</div>
	<div class="row">
		<div class="col-sm-3" v-for="vo in food_list">
			<a :href="'../food/detail.do?no='+vo.no">
				<div class="thumbnail">
					<img :src="vo.poster" :title="vo.address" style="width: 250px; height: 150px; object-fit:cover">
					<p>{{vo.name}}</p>
				</div>
			</a>
		</div>
	</div>
	<div class="row text-center">
		<pagecard></pagecard>
	</div>
</div>
<script>
	let find=Vue.createApp({
		// 서버에서 읽어오는 데이터(변수) 저장 : Model
		data(){
			return {
				startPage:0,
				endPage:0,
				totalPage:0,
				curPage:1,
				column:'address',
				ss:'마포',
				food_list:[]
			}
		},
		// 2. 데이터 제어 : ViewModel
		// 생명 주기 함수 => 자동 호출
		mounted(){
			this.dataRecv()
		},
		methods:{
			// 사용자 정의 함수 : 반드시 호출 필요
			dataRecv() {
				// axios.post()
				axios.post('../food/find_vue.do',{},{
					params: {
						page:this.curPage,
						column:this.column,
						ss:this.ss
					}
				}).then(response=>{
					console.log(response.data)
					this.startPage=response.data.startPage
					this.endPage=response.data.endPage
					this.totalPage=response.data.totalPage
					this.curPage=response.data.curPage
					this.food_list=response.data.food_list
				})
			},
			move(page) {
				this.curPage=page
				this.dataRecv()
			},
			range(start,end){
				let arr=[]
				let len=end-start
				for(let i=0; i<=len; i++) {
					arr[i]=start
					start++
				}
				return arr
			},
			find() {
				// 태그를 가지고 오는 경우 => ref속성 사용
				// 유효성 검사 => $() ==> X
				this.curPage=1
				if(this.ss.trim()===""){
					//alert("검색어를 입력하세요")
					this.$refs.ssInput.focus()
					return
				}
				this.dataRecv()
			}
		},
		components:{
			pagecard:page_card
		},
		computed:{
			
		}
	}).mount('.container')
</script>
</body>
</html>