<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script type="text/javascript">

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
<div class="container">
	<div class="row">
		<input type="text" size="20" class="input-sm" v-model="msg">
		<div>{{msg}}</div>
	</div>
</div>
<script> <%-- 일반 형식 / module 형식: setup() --%>
	let con=Vue.createApp({
		data() {
			return {
				msg:''
			}
		},
		// 생명주기 함수
		// 자동호출 함수(mounted 까지)
		beforeCreate() {
			console.log("Vue 객체 생성 전...")
		},
		created() {
			console.log("Vue 객체 생성 완료...")
		},
		beforeMount() {
			console.log("가상 메모리(DOM)에 올라가기 전...")
		},
		mounted() {
			// 화면 출력과 동시에 서버 연결 => 데이터를 읽어오는 경우
			// JSON 자동 파싱
			// 제어를 실제 HTML에서 제어
			// JSP/JQuery => HTML 만들어서 첨부
			// Vue/ThymeLeaf => 실제 HTML 제어
			console.log("***가상 DOM에 HTML을 트리 형태로 저장 완료(=windows.onload)")
		},
		beforeUpdate() {
			console.log("데이터 갱신 전...")
		},
		updated() {
			// 이벤트가 발생했을때 처리
			console.log("***데이터 갱신 완료...")
		},
		beforeUnmount() { // beforeDestroy
			console.log("가상 DOM 해제 전...")
		},
		unmounted() { // destroyed
			console.log("가상 DOM 해제된 상태...")
		}
		/*
			장점
			  - 배우기 쉽다
			  - 컴포넌트 기반 개발 가능
			  - 최적화(성능이 좋다)
			  - 풍부한 라이브러리 제공
			단점
			  - 바로 갱신되는 사이트가 없다 => React
			  
			형식
			  Vue.createApp({
				  // 1. 사용할 데이터(화면 출력에 필요한 데이터 설정)
			  	  data() {
					  return {
						  // 데이터 설정 => HTML에 적용
					  }
				  },
				  // 2. 생명주기 함수
				  mounted(){},
				  update(){},
				  // 3. 이벤트 처리(사용자 정의 함수)
				  methods: {
					  // 함수 정의
				  },
				  // 4. 부가적인 화면 => 상세보기/결제 정보/예약 정보
				  components: {
					  
				  },
				  // 5. 계산
				  computed: {
					  
				  },
				  // 6.
				  watch: {
					  
				  }
				  
			  })
		
		*/
	}).mount('.container')
</script>
</body>
</html>