<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	문서 객체 모델(DOM)
		- 태그를 제어하는 프로그램
		- 태그 => 클래스 , 속성 => 멤버변수
		- HTML/XML : ML => Markup Language => 메모리에 저장(트리 형태) => UI
		- DOM : JavaScript에서 제어를 할 수 있게 만든 구조
			- 문서 객체 선택
			- 문서 객체 조작 : 글자, 스타일, 속성 조작
			- 이벤트 : 인라인, 고전, 리스너
			
		- CDN 방식 : Component 방식(Vue,React)
		
	- 문서 객체 선택
		- id : <button id="btn">
			- document.getElementById('btn')
			
		- class : <button class="btns">
			- document.getElementsByClassName('btns')
			- 클래스명이 같은 태그가 여러개 => for로 처리

		- name : <button name="btn">
			- document.getElementsByName('btn')
			
		- **속성이 없는 경우**
			- document.querySelector("CSS 선택자")
				- id : document.querySelector('#id명')
				- class : document.querySelector('.class명')
				- tag : document.querySelector('태그명')
				- 자손 : document.querySelector('태그명 > 태그명')
				- 후손 : document.querySelector('태그명 태그명')
				- 속성선택자 : document.querySelector('태그명[속성=값]')
				- 속성선택자 : document.querySelector('태그명[속성*=값]')
				- 속성선택자 : document.querySelector('태그명[속성$=값]')
				- 속성선택자 : document.querySelector('태그명[속성^=값]')
				- 구조선택자 : document.querySelector('태그명:nth-child(2n)')
		
		- 태그 선택 : document.getElementsByTagName(태그명)
			- 원하는 태그를 읽어온다
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%--
	바닐라 JS : 순수한 자바 스크립트
 --%>
<script type="text/javascript">
let sawon={
	name:"홍길동",
	getName:function(){
		//document.write("이름:"+this.name)
		let h1=document.querySelector("h1")
		h1.style.color="red"
		h1.style.background="yellow"
		h1.textContent=this.name // innerHTML
	},
	setName:function(name){
		this.name=name
	}
}
window.onload=()=>{
	sawon.setName("심청이")
	sawon.getName()
}
</script>
</head>
<body>
<h1></h1>
</body>
</html>