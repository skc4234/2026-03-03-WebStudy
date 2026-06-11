<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
let httpRequest=null
// JQuery => $.ajax({})
// axios : React / fetch : Vue / ajax : JQuery
function getXMLHttpRequest(){
	// 브라우저 내장 객체 => XMLHttpRequest => 서버 => 처리결과를 읽어오는 역할
	// 바닐라 JS 형식
	if(window.XMLHttpRequest) {  // 브라우저에 존재한다면
		alert("XMLHttpRequest 생성")
		return new XMLHttpRequest() // chrome, firefox 등
	}
	else {
		return null;
	}
}
// 서버에 전송 => 수신
// $.ajax({
//	method:...
// })
// sendRequest("list.do","no=1",result,"GET")
function sendRequest(url,params,callback,method) {
	// 1. 객체 생성
	httpRequest=getXMLHttpRequest()
	
	// 2. method 방식 지정
	let httpMethod=method?method:'GET' // default: GET
	if(httpMethod!='GET'&&httpMethod!='POST') httpMethod='GET'
	
	// 3. params 처리 => ?no=1
	let httpParams=(params===null||params==="")?null:params
	// 4. url 변경
	let httpUrl=url
	// 4-1  GET 방식
	if(httpMethod==='GET'&&httpParams!=null) {
		httpUrl=httpUrl+"?"+httpParams
	}
	// 4-2 POST 방식
	
	
	// 5. 서버 연결                      true => 비동기
	httpRequest.open(httpMethod,httpUrl,true)
	
	// 6. 데이터 전송
	httpRequest.setRequestHeader("Content-Type", // 한글
			"application/x-www-form-urlencoded")
			
	// 7. 결과값을 읽어오는 함수 지정 => callback
	httpRequest.onreadystatechange=callback
	// 8.데이터 전송
	httpRequest.send(httpMethod==="POST"?httpParams:null)
}

function send() {
	sendRequest('sub.jsp',null,ok,'POST')
}

// CallBack 함수
/*
 *   readyState
 	0 : 서버연결 준비
 	1 : 서버연결 => open()
 	2 : 서버 연결완료
 	3 : 데이터 전송 준비 => send()
 	4 : 데이터 전송 완료
 */
function ok() {
	if(httpRequest.readyState===4) {
		if(httpRequest.status===200) {
			let div=document.querySelector("#print")
			div.innerHTML=httpRequest.responseText
		}
	}
}

</script>
</head>
<body>
<button onclick='send()'>전송</button>
<div id=print></div>
</body>
</html>