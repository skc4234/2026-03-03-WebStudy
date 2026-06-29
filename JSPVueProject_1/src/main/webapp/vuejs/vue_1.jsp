<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	- VueJS
		1. Vue를 사용하는 목적
			- 상태관리(변수 관리 => 데이터 관리)
			==> state (React도 동일)
		2. MVVM 구조
			- Model : 데이터 저장 => VO
			- View : 화면 출력 => HTML
			- ViewModel : VO의 데이터를 갱신한 후 HTML에 적용하는 로직
			- 데이터 갱신에 되면 HTML에서 바로 갱신 ==> 양방향 통신
		3. 형식
			```
			let name=Vue.createApp({
				data() {
					// 변수 => HTML에 적용 => 멤버변수
					// 호출 시 this.
					
				},
				// 생명주기 함수
				// beforeCreate()
				// created()
				// beforeMount()
				mounted(), // 실행하는 부분 => javascript: window.onload()/jquery: $(function(){})
				// beforeUpdate()
				// updated()
				// beforeDestroy()
				// destroyed()
				methods: {
					// 사용자 정의 => 이벤트 처리
				},
				components: {
					// 다른 창 관리
				},
				computed: {
					// 계산/숫자 형식 등 => 계산 된 상태
				},
				watch: {
					// 이벤트 감지
				}
			})		
			```
		4. Vue 기초
			- 가상 DOM
				- 메모리 2개 사용(가상 DOM(Buffer), 실제 DOM(HTML))
				- 변경된 부분만 적용
				- Vue => 가상 메모리에 저장 ======> 실제 메모리에 저장
								|        diff        |
							   작업         |     브라우저와 연동
									다른 내용이 있는 경우 바로 적용
				- 사용자 입력 => 저장 데이터 동시에 처리
			- 디렉티브
			- 명령어
		5. 심화
			- Vuex: HTML 관리(MVC)	
			- Pinia: Spring
			- 데이터형이 일치 안되는 경우: TypeScript
		6. 표준화: NextJS => React
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script type="text/javascript">
$(function(){
	$('#t').on('keyup',function(){
		let msg=$(this).val()
		$('#print').text(msg)
	})
})
</script>
<style type="text/css">
.container {
	margin-top: 50px
}
.row {
	margin: 0px auto;
	width: 960px;
}
</style>
</head>
<body>
<%-- JQuery --%>
<div class="container">
	<div class="row">
		<input type="text" size="30" class="input-sm" id="t">
		<div id="print"></div>
	</div>
</div>
<%-- VueJS --%>
<%-- View --%>
<div class="container" id="app">
	<div class="row">
		<input type="text" size="30" class="input-sm" v-model="msg">
		<div>{{msg}}</div>
	</div>
</div>
<script> <%-- text/babel --%>
	let s=Vue.createApp({
		// 관리할 데이터 저장 공간: Model, 이벤트 처리: ViewModel
		// Model
		data() {
			return {
				msg:''
			}
		},
		// ViewModel => 데이터 갱신
		mounted() {
			// $(function(){}), 시작과 동시에 서버에서 데이터 읽기
			// 다른 라이브러리와 연동(JQuery)
			this.msg="Hello Vue3"
		}
	}).mount('#app')
	// Model => ViewModel => View(HTML)
	// Model: data() 안에 설정된 데이터만 변경
</script>
</body>
</html>