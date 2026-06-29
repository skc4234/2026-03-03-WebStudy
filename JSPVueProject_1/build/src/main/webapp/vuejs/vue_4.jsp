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
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
</head>
<body>
<%--
	디렉티브
		- v-xxx : 태그 안에서 사용
		- 조건문
			- v-if="조건"
			==============
			- v-if="조건"
			- v-else
			==============
			- v-if="조건"
			- v-else-if="조건"
			- v-else-if="조건"
			- v-else
			==============
		- 반복문
			- v-for: forEach => for(int i=0; i<10; i++)
			- 숫자를 배열로
			**** 같은 태그 안에서 v-for, v-if 동시 사용 불가
		- v-bind, v-model, v-show, v-hide
		- v-on:click => @click
--%>
<div class="container">
	<div class="row">
		<h3>Vue 조건문(v-if, v-else-if, v-else)</h3>
		<button type="button" class="btn btn-sm btn-primary" v-on:click="select(1)">한식</button>
		<button type="button" class="btn btn-sm btn-info" @click="select(2)">양식</button>
		<button type="button" class="btn btn-sm btn-warning" @click="select(3)">중식</button>
		<button type="button" class="btn btn-sm btn-danger" @click="select(4)">일식</button>
		<button type="button" class="btn btn-sm btn-success" @click="select(5)">기타</button>
	</div>
	<div class="row text-center" style="margin-top: 20px">
		<div v-if="type===0">
			선택한 음식이 없습니다
		</div>
		<div v-else-if="type===1">
			한식을 선택하셨습니다
		</div>
		<div v-else-if="type===2">
			양식을 선택하셨습니다
		</div>
		<div v-else-if="type===3">
			중식을 선택하셨습니다
		</div>
		<div v-else-if="type===4">
			일식을 선택하셨습니다
		</div>
		<div v-else>
			기타 음식을 선택하셨습니다
		</div>
	</div>
	<div class="row text-center" style="margin-top: 20px">
		<button class="btn-lg btn-success" @click="log()">로그인</button>
		<button class="btn-lg btn-danger" @click="logout()">로그아웃</button>
		<div v-if="login===true">
			<h3>로그인 되었습니다</h3>
		</div>
		<div v-else>
			<h3>로그아웃 되었습니다</h3>
		</div>
	</div>
</div>
<script>
	let sel=Vue.createApp({
		data() {
			return {
				type:0,
				login:false
			}
		},
		methods: {
			select(type) {
				this.type=type
			},
			log() {
				this.login=true
			},
			logout() {
				this.login=false
			}
		}
	}).mount('.container')
</script>
</body>
</html>