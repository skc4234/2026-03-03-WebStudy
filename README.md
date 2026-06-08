# Web Study (05/06~)

## HTML 태그


<details><summary>숨기기/펼치기</summary>

	
- 글자 태그
  - h1~h6 : 제목 출력 => 번호가 커질수록 크기는 작아진다
    ```
	  <h1>출력문</h1>
    ```
	  - bold를 포함
	  - 여는 태그 / 닫는 태그 사용
    - block 속성 => 한줄에 하나씩 => 자동 줄바꿈
    - h1/h3 태그 주로 사용
  - br : 다음줄에 출력(\n)
    - HTML은 한줄 문자열 => 줄나누기
    - 단독 태그 => 닫는 태그 미사용
    - 데이터를 가지고 있지 않다
  - p : 단락을 나누는 경우
    ```
    // <br><br> 과 동일
	  - 값이 있는 경우 => <p>출력문</p>
	  - 값이 없는 경우 => <p>
    ```
	  - 회원가입 폼(입력창)
	  - table 사용 가급적 자제
	  - 카드 제작 시 주로 사용
  - hr : 수평선 출력 / 구분이 없는 경우에 주로 사용
	  - 단독 태그
  - pre : 있는 그대로 출력 => 공백, 띄어쓰기 등 그대로 출력
    ```
    <pre>출력문</pre>
    ```
    - 상세보기, 줄거리, 맛집소개 등 긴 글에 사용
- 문자 제어 태그
  - small : <small>출력문</small> => 작은 글자 출력(부제목), inline 속성
  - address : 주소 출력 => 이태릭체
  - sup : 윗첨자 : 새글 등록 new
  - b : bold 
  - sub : 아래첨자
  - em : 강조체 => <strong></strong>
  - i : 이태릭(기울임체)
  - mark : 형광색 글씨체
  - marquee : 전광판 효과
  - \&lt;  <
	- \&gt;  >
	- \&nbsp;  " " => 공백 출력
	- \&raquo;  >>
	- \&laquo;  <<

- 멀티미디어
	- \<img src="" title=""> : 이미지 출력 => 시각화
	  - src=이미지파일 : gif, png, jpg
	  - title=풍선 도움말
	- \<embed src="" width="" height=""> : 동영상 출력
	- \<iframe src="" width="" height=""> : 동영상 및 다른 HTML 등 파일 출력
  - \<a href="URL"> : 링크 => 화면 이동
	  - 목록 => 상세보기 이동
	  - <... target="_blank"> : 없는 경우-현재 페이지, 있는 경우-새로운 창
	  - 사용처 : 목록 / 이미지 클릭 시 이동


- 목록 출력
  - ul : 메뉴
	- ol
	- dl : 상세보기
	- table : 게시판 등 일반목록
- 입력창               
	- \<input type=""> => type => button, submit, reset, image, text, password, date, week, number, hidden, file
	- \<textarea>                 
	- \<select>
	- \<button>
- 분할 태그
	- 가로 분할 : \<span>
	- 세로 분할 : \<div>

 </details>


***




## CSS


<details><summary>숨기기/펼치기</summary>


### CSS의 종류


1. 내부 CSS
	- 파일 하나 제어
	```
	<head>
	<style>
	// CSS 스타일 작성
	</style>
	</head>
	```
2. 인라인 CSS
	- 태그 하나 제어
	```
	<a href="" style="CSS 스타일 작성">
	```
3. 외부 CSS
	- 여러개 파일 제어
	```
	<link rel="stylesheet" href="css파일 이름">
 	```

***
 

### CSS 선택자


- 선택자 우선순위
  ```
  전체(*) < 태그 < 클래스 < 아이디 < 인라인 < !important
  ```
- 선택자의 종류
	- 기본 선택자
		- 전체 선택자(*)
  			- 간격 조절(margin, padding 등)
			- 글꼴 통일(font-family)
			- 형식
			```
			<style type="text/css">
   			* {
				속성: 값;
				font-family: 맑은 고딕; // 반드시 시스템에 등록된 폰트 사용(import)
			}
			</style>
   			```
		- 태그 선택자
  			- 자주 사용하지 않음 => 중복 태그에 같은 css 적용되기 때문
			- 형식
			```
			태그 {
				속성: 값;
			}
			```
   		- 아이디 선택자
			- 중복이 없는 구분자 생성
			- 형식
			```
			<p id="a"></p>
			<p id="b"></p>
			<a id="a"></a>

			// 중복이 없다
   			p#a {
			}
			p#b {
			}
			a#a {
			}
   			```
		- 클래스 선택자
   			- 같은 형식의 디자인 적용
			- 형식
			```
			<a href="" class="a"></a>
			<a href="" class="a"></a>
			<a href="" class="a"></a>
			<a href="" class="a"></a>
			<a href="" class="a"></a>

  			a.a {
				속성: 값;
			}
			```
  	- 속성 선택자
		- 선택자[속성=값] => 같은 값일때
		- 선택자[속성^=값] => 시작 값일때
		- 선택자[속성$=값] => 끝 값일때
		- 선택자[속성*=값] => 포함 값일때
  	  	- 사용처
  	  		- \<img> 태그에서 src 속성에서 확장자명(.png/.jpg)이 아닌 태그 찾을때 사용
			- \<input> 태그에서 type 속성 구별할때 사용
			- \<a> 태그에서 href 속성 구별할때 사용
		- 예시
  	  	```
		a[href="https://www.java.com"] {
			color: red;
		}
		a[href^="http"] {
			color: orange;
		}
		a[href$="net"] {
			color: magenta;
		}
		a[href*="www"] {
			color: black;
		}
		input[type="text"] {
			border-radius: 20px;
		}
  	    ```
	- 후손/자손/동위 선택자
   		```
     	<div>
			<p></p>
			<h1></h1>
			<h1></h1>
			<span>
				<h1></h1>
			</span>
		</div>
     	```
     	```
      		div
			 |
		-------------
		|  |   |    |
		p  h1  h1  span
				     |
				     h1

      	- 자손 선택자 : div > p, div > h1
      	- 후손 선택자 : div span h1
      	- 동위 선택자 : p+h1 => p 태그와 가장 근접한 h1 태그
                       p~h1 => p 태그와 동일선상에 있는 모든 h1 태그
  		```
   	- 반응 선택자
  		- hover : mouse-over(마우스가 위로 올라갔을때)
   	  	```
		img:hover {
			opacity: 0.3;
			cursor: pointer;
			border: 3px solid green;
		}
   	   	```
	- 상태 선택자
   		- *checked : 선택되었을때(checkbox)
		- focus : input 태그에 포커스를 두었을
		- enabled : 활성화
		- disabled : 비활성화
  	- 구조 선택자
  	  	- \<ul>, \<ol> 태그 등에 주로 사용
  	  	- :first-child : 형제 관계 중 첫번째 태그에만 적용
		- :last-child : 마지막 태그에만 적용
		- :nth-child(수열) : 수열에 맞는 태그에만 적용
  	  	- 2n : even, 2n+1 : odd
  	- 문자 선택자
  		- ::before : 해당 태그 바로 앞
  	   	- ::after : 해당 태그 바로 뒤


***


### CSS 단위
- 크기 단위 => 글자 크기
	```
	font-size: 16px => 100%(16px) / 50%(8px) / 150%(24px)
		- em : 배수 단위
		0.2em => 16*0.2 => 3.2px
		2em => 16*2 => 32px
 	```
- 색상
	```
	color:
		1. 시스템 색상(red, blue, pink 등)
		2. rgb(255,255,255)
		3. #999999
 	```


### CSS 속성
- 박스 속성
	- margin : 외부 간격 조절 => 태그와 태그 사이의 여백
   		- margin-top
		- margin-right
		- margin-bottom
		- margin-left
    	- margin: 10px 10px 10px 10px => top, right, bottom, left
	- padding : 내부 간격 조절 => 태그 안의 이미지 등 컨텐츠와의 여백
   		- padding-top
		- padding-right
		- padding-bottom
		- padding-left
    	- padding: 10px 10px 10px 10px => top, right, bottom, left
	- border : 테두리
		- border-style : 선 종류
		- border-width : 두께
		- border-color : 테두리 색상
		- border-collapse : 테두리 통합
		- border-radius : 타원형
		- border: border-style border-width border-color
			- 순서 상관x  	
- 가시 속성
	- display: none, block, inline, inline-block
   	- inline 속성 : 자동으로 해당 크기만큼 차지
  		- \<img>, \<a>, 글자 모양 태그(\<b>, \<sup> 등), \<span>, \<input>, \<select>, \<textarea>
	- block 속성 : 한 줄 전체 차지
   		- \<h1>~\<h6>, \<br>, \<p>, \<ul>\<ol>\<li>, \<dl>, \<div>
	- none : 화면에 보이지 않음 => JavaScript 등으로 볼 수 있게
   	```
    <div style="display: none;">
    
    // a 태그로 JQuery 이용해서 보이게 처리
	<script type="text/javascript" src="https://code.jquery.com/jquery.js"></script>
	<script type="text/javascript">
	let i=0;
	$(function(){
		$('a').click(function() {
			if(i==0) {
				$('a').text("닫기")
				i=1;
				$('div').show();
			}
			else {
				$('a').text("더보기")
				i=0;
				$('div').hide();
			}
		})
	})
	</script>
    ```
	- 가시 속성(display: none, visibility: hidden, opacity: 0.0) 차이
    
    	<img width="324" height="533" alt="Image" src="https://github.com/user-attachments/assets/83d6d82f-9201-4605-99ff-fadb3b124148" />

  	- overflow:
		- 공간을 벗어나는 경우
  	  	- visible : 공간을 벗어나도 모두 출력한다
  	  	- hidden : 공간까지만 출력한다
  	  	- scroll : 강제로 스크롤 바 생성
  	  	- auto : 컨텐츠가 공간을 벗어날 경우 자동으로 스크롤 바 생성
	- z-index:
		- 레이어 위에 원하는 태그를 올리는 경우
    	- 숫자가 클수록 앞에 위치한다


- 배경 속성
	- background
 		- background-color : 배경색 지정(원색은 되도록 사용 자제)
		- background-image : 배경에 이미지 삽입
   			- : url('이미지 주소')
		- background-repeat : 이미지 반복 여부(타일)
    		- : no-repeat : 반복 없애기
		- background-position : 배경 이미지 위치 지정
		- background-size : 배경 이미지 크기 지정
		- background-attachment : 배경 고정 여부
    		- : fixed : 스크롤 이동해도 배경 이미지는 고정


- 글자 속성
	- font / text
		- *color* : 글자 색상
		- *font-size* : 글자 크기 => px / em
		- font-weight : 두께(normal / bold, 100~900)
		- *font-family* : 글꼴(시스템 글꼴 / 구글 폰트)
		- *text-align* : 정렬(left, center, right)
		- *text-decoration* : underline / none => a 태그 밑줄 지우는 용도
		- text-transform : 대소문자 변환 => 거의 안쓰임
		- letter-spacing : 글자 간격
		- word-spacing : 단어 간격
		- *line-height* : 줄 간격(자간)
		- *white-space* : 자동 줄바꿈
		- text-shadow : 그림자 효과
		- *font* : 단축 속성

- 위치 속성
	- position:
   		- static : 기본 HTML 흐름에 따라 배치(default)
    	- absolute : 절대 좌표(가장 가까운 태그 기준으로 배치)
       	- relative : 상대 좌표(원래 자리에서 지정한 좌표만큼 이동)
       	- fixed : 고정 좌표(스크롤 영향x)
       	- sticky : 스크롤 시 고정됨


- 유동 속성
	- float: left/right
   	- 사용처 : 이미지 카드, 메뉴바에서 메뉴와 로그인 버튼 양쪽으로 분리할때 사용
   	- flex/grid로 대체 가능

</details>


***



## JSP

<details><summary>숨기기/펼치기</summary>



### Servlet / JSP
- Servlet
	- 초창기의 자바중심 웹 프로그램
   	- 장점
  		- 소스가 노출되지 않음 => 보안성이 높다
   	  	- 자바중심이기 때문에 호환성/유지보수가 좋다
   	- 단점
   	  	- 수정 후에 바로 확인할 수 없다
		- 소스가 길고 CSS나 JavaScript 처리가 어렵다
- JSP
  	- HTML 중심의 웹 스크립트 언어
  	- 장점
  	  	- Servlet의 단점 보완
  	  	- 수정 후에 바로 컴파일한다
  	  	- 소스가 짧고 HTML과 JAVA의 구분이 확실하다
  	  	- HTML 중심이기 때문에 CSS나 JavaScript 추가가 쉽다
  	- 단점
  	  	- 소스가 노출되기 쉽고 확장성이 안좋다

- Servlet의 생명 주기
	- init() => _jspInit()
   		- 초기화(생성자 대체)
       	- DB 연결 준비나 설정파일(web.xml)을 읽는다
       	- 공통자원을 초기화 한다
    - service() => _jspService()
      	- 클라이언트가 요청할때마다 실행하고 화면을 출력한다
      	- doGet()
      		- 요청 방식이 GET 방식인 경우 호출
      	 	- 보통 화면 출력 담당
      	- doPost()
      	  	- 요청 방식이 POST 방식인 경우 호출
      	  	- 사용자 요청 처리 담당
      	- service()는 GET과 POST를 동시에 처리한다
      	- GET : URL 뒤에 "?키=값"형식으로 데이터를 전송한다
      		- 값이 노출되기 때문에 간단한 검색어나 상세보기 등에 사용된다
      	- POST : 내부적으로 값을 감춰서 전송한다
      		- 보안이 필요하거나 보낼 데이터가 많은 경우 사용한다
    - destroy() => _jspDestroy()
  		- 서버 종료 / 새로고침 / 화면 이동 시 자동으로 Servlet이 제거된다
      	- DB 연결 해제, 메모리 해제, 로그 저장 등의 기능 수행
      	- 한번만 호출된다
     
### JSP 기초
- JSP 동작 과정
	- 브라우저 URL을 이용해서 요청 => 반드시 파일명 포함
   		- 데이터는 GET/POST 방식으로
   	- 웹 서버에서 요청 받기
   		- 톰캣이 JSP파일을 자바로 변경한다
   	   	- 변경된 자바 파일은 컴파일해서 .class파일로 만들고 HTML은 메모리에 저장한다
   	   	- 자바 파일로 요청을 수행하고 출력버퍼에 저장된 HTML을 브라우저에 읽어서 출력한다
- 지시자 : page / include / taglib
- 스크립트릿 : <% %> <%= %> <%! %>
- 내장 객체
	- request / response / session / pageContext / out / application / config / exception / page
 - 상태 관리 : session / cookie
 - 데이터베이스 연동 : JDBC / ConnectionPool

### JSP 지시자
- JSP 페이지가 실행될 때 필요한 정보 주입
1. **page**
    - 가장 많이 사용되는 지시자
	- 형식) <%@ page 속성="값" %>
	- 중요한 속성 여러개
		- info="설명" : 페이지 정보 기록
		- language="java" : 사용할 언어 지정
		- contentType="text/html" : 어떤 형태로 출력할 것인지 지정
		- import="라이브러리" : 자바 라이브러리나 사용자 지정 라이브러리를 가져와서 사용할 경우
			- 유일하게 page 지시자를 중복해서 사용할 수 있다
     	- buffer="8kb" : jsp 페이지 출력 크기 지정, 8kb가 디폴트
    	- errorPage="이동할 페이지" : 현재 페이지에서 예외가 발생할 경우 에러 페이지로 이동한다
       	- isErrorPage="true" : 에러 처리 담당 페이지 여부 확인, false가 디폴트
       	- pageEncoding="UTF-8" : 한글 사용을 위해서 반드시 UTF-8 또는 EUC-KR 지정
2. include
	- 파일을 여러개 모아서 한번에 컴파일 하는 용도
	- 형식) <%@ include file="" %>
	- 사용 빈도가 거의 없다
3. **taglib**
	- prefix
	- uri

### JSP 액션 태그
- 형식) <jsp:forward page="">
- **include** : 특정 위치에 다른 jsp 추가
	- include 지시자와 같은 기능이지만 액션 태그를 더 많이 사용한다
- forward : 파일 이동 => redirect와 달리 request된 값을 유지한다
- useBean : 객체 생성
- setProperty
- getProperty
- param : 추가적인 데이터가 있는 경우 사용



### JSP 내부 객체
- JSP 컨테이너가 제공하는 미리 생성된 객체(9개)
1. **request** : HttpServletRequest
	- 사용자 요청 정보, 서버, 브라우저 정보 등을 담고 있다
	- getServerName() : 서버 이름(IP)
	- getProtocol() : 사용중인 프로토콜
	- getMethod() : GET/POST 방식 여부
	- getRequestURL() : 주소 전체 출력
	- **getRequestURI()** : 기본 주소 제외한 식별 가능한 식별자
	- **getContextPath()** : 현재 웹의 컨텍스트 경로
	- getRemoteAddr() : 요청한 사용자의 IP
	- getServerPort() : 요청한 사용자의 PORT 번호
	- **getParameter()** : 지정된 파라미터의 단일값 반환
	- **getParemeterValues()** : 지정된 파라미터의 모든 값 반환
	- setCharacterEncoding("UTF-8") : POST방식으로 반환된 문자열 형식을 한글로 변환
	- void setAttribute("키", "값") : 데이터 추가
	- Object getAttribute("키") : 데이터 읽기
2. **response** : HttpServletResponse
	- 응답 정보
	- setHeader() : HTTP 응답 Header를 설정한다 / 파일을 다운로드 할 수 있다
	- addCookie() : 쿠키를 설정한다
		- 헤더와 쿠키를 동시에 전송할 수 없다 => 하나만 선택해서 전송
	- setContentType("text/html; charset=UTF-8") : 출력되는 브라우저의 contentType 설정(한글 등)
	- **sendRedirect("이동할 파일명")** : 지정된 파일로 이동, GET 방식
		- request 정보가 초기화 된다
4. out : JspWriter
	- 출력 버퍼(실행 시 HTML을 저장하는 메모리 공간) 제어
	- 사용자 당 출력 버퍼는 한개씩만 생성
	- 브라우저에 읽으면 자동으로 reflush(autoFlush)
	- println() : 브라우저에 출력
	- write() : 문자열 출력
	- getBufferSize() : 출력 버퍼 전체 크기
	- getRemaining() : 현재 사용하지 않는 버퍼 크기
6. **session** : HttpSession
	- 서버에 필요한 데이터 저장
8. **application** : ServletContext
	- 서버 정보, 로그 정보, 자원 정보 등
	- getServerInfo() : 서버 정보
	- **getRealPath()** : 실제 저장되는 위치 => 자원 정보
	- **getInitParameter()** : 로그 정보
		- web.xml에 저장된 param 정보를 읽을 수 있다(보안성)
	- log("message") : 로그 파일에 message를 기록한다
10. pageContext : PageContext
	- 내장 객체 관리, <jsp:include>, <jsp:forward> 관리
	- include("페이지") : 해당 페이지를 포함시킨다 => request 정보를 공유한다
	- forward("페이지") : 화면을 이동한다 => URL 주소는 변경 X
12. page : Object
	- 자신의 객체(this)
14. config : ServerConfig
	- 환경설정 파일(web.xml)
16. exception : Exception
	- 예외 처리


### Javabeans
```
<jsp:useBean id="bean" class="com.sist.bean.MemberBean">
	<jsp:setProperty name="bean" property="*"/>
	<%-- useBean의 id와 setProperty의 name이 같아야함 --%>
</jsp:useBean>
...
이름:<jsp:getProperty property="name" name="bean"/><br>
나이:<jsp:getProperty property="age" name="bean"/><br>
성별:<jsp:getProperty property="sex" name="bean"/><br>
주소:<jsp:getProperty property="address" name="bean"/><br>
전화:<jsp:getProperty property="phone" name="bean"/><br>
소개:<jsp:getProperty property="content" name="bean"/><br>
```



### Session / Cookie

- 요약


 |구분|cookie|session|
 |----|------|------|
|저장위치|컴퓨터(브라우저)|접속한 서버|
|보안|낮다|높다|
|용량|적다(문자열 저장)|크다(Object)|
|유지|오래간다|로그아웃/브라우저 종료시| 
|속도|빠르다|cookie에 비해 느리다| 
|용도|최근 방문/라이센스 정보|로그인 상태/장바구니/예약|
		 	     
- HTTP 프로토콜은 상태가 없다 => 지속적인 연결을 위해서 세션과 쿠키 사용
- Session
	- 서버가 자신에게 접속한 클라이언트의 정보를 갖고 있다
   	- 클라이언트 당 1개씩만 생성된다
   	- 브라우저 종료/로그아웃 시 사라진다
   	- Object 단위로 저장한다
   	- 로그인 상태 유지, 회원 일부 정보, 장바구니, 관리자 인증, 예약 등에 사용된다
   	- 주요 메소드
   	```
	1. 저장 => setAttribute(key, value) => key가 중복이면 덮어쓴다 => 덮어쓰는 경우 : 회원 수정
	2. 읽기 => getAttribute(key)
	3. 전체 삭제 => invalidate()
	4. 장바구니 삭제 => removeAttribute(key)
	----------------------------------
	5. getId() => 각 클라이언트(브라우저) 당 1개만 배정된 고유번호
	6. isNew() => 처음 저장된 상태 => 장바구니 기능 활용
    7. setMaxInactiveInterval(초단위) => 세션 유지 시
    ```
-  Cookie
	- 클라이언트 정보가 브라우저에 저장된다
   	- 세션에 비해 용량이 작고 문자열만 저장한다
   	- 브라우저를 종료해도 쿠키는 남아있다
   	- 자동 로그인, 최근 방문, 팝업창(오늘 하루 보지 않음) 등에 사용한다
   	- **헤더와 쿠키를 동시에 전송할 수 없다** => HTML 만들기 전에 쿠키를 먼저 전송해야 한다
   	- 쿠키 작성법
   	```
	// 번호 받기
	String no = request.getParameter("no");
	// 1. 쿠키 생성
	Cookie cookie = new Cookie("food_"+no, no);
	
	// 2. 기간 정하기
	cookie.setMaxAge(60*60*24); // 하루만 저장
	// session => default 1800초(30분), cookie는 default 없음 => 설정 필요
	// 쿠키 삭제 => cookie.setMaxAge(0);
	
	// 3. 저장위치 지정
	cookie.setPath("/");
	
	// 4. 해당 브라우저로 쿠키 전송
	response.addCookie(cookie);
	
	// 5. 화면 이동
	response.sendRedirect("../main/main.jsp?mode=2&no="+no);
	// GET 방식, request 초기화
    ```

### Connection Pool
- DBCP(DataBase ConnectionPool)
	- 기존 JDBC 방식은 데이터베이스 연결, sql문장, 결과 받기를 매번 수행
   		- 데이터베이스 연동 시간이 가장 오래 걸림
       	- => 데이터베이스 연결 객체 미리 생성
    - Connection 객체를 미리 생성하고 Pool에 집어넣어 필요시마다 사용-회수 한다
  	- 톰캣 서버에 server.xml 파일에 DB 관련 파일을 작성한다
  	```
   	driverClassName="oracle.jdbc.driver.OracleDriver" => 드라이버 설정
    url="" => 데이터베이스 주소
    username="" => 이름
    password="" => 비밀번호
    maxActive="10" => 동시에 사용할 수 있는 Connection 개수(default 8개)
    maxIdle="10" => 항상 유지하고 최소 Connection 개수(default 8개)
    maxWait="-1" => 반환까지 기다리는 시간
    auth="Container" => 데이터베이스 관리 주체
    name="" => 별칭
    type="javax.sql.DataSource" => 사용 라이브러리
	```
	- 실제 사용
   	```
	// Pool 연결
	Context init = new InitialContext();
	Context c=(Context)init.lookup("java://comp/env/"); // c:\\
	DataSource ds = (DataSource)c.lookup("별칭");
    ```


### EL / JSTL
- EL(Expression Language) : 표현식
	- JSP의 <%= %> 태그 대체
   	- HTML과 Java의 분리
   	- 사용법 : ${값} => request나 session에 저장되어 있는 값만 출력 가능
  	- 연산자
  		- 산술연산자(+,-,/,%)
  	   		- +는 순수한 덧셈만 가능, 문자열 결합은 +=
  	    - 비교연산자(==, !=, <=, >=)
  	    - 논리연산자(and, or, not)
  	    - 삼항연산자(조건식?값1:값2)
  	- 내장 객체
  		- request.setAttribute("키",값) => ${"키"}
  	 	- session.setAttribute("키",값)
  	  	- pageContext.request.contextPath => 경로
- JSTL(Java Standard Tag Library)
  	- 대부분 자바에서 처리후에 전송하기 때문에 사용빈도는 낮다
	- core
   		```
     	<%@ taglib prefix="c" uri="jakarta.tags.core" %>
		<c:set var="list" values="<%=list%>"> // 값 주입

		// 중요
     	<c:forEach var="i" begin="1" end="10" step="1">
     	//<c:forEach var="name" items="${list }" varStatus="s"> // List 형식에서도 사용가능
		${i}
    	</c:forEach>

     	<c:forTokens items="red,blue,green" delims="," var="color">

     	<c:if test="조건문">
     	// else가 없다 => c:otherwise 활용

     	<c:choose>
     		<c:when test="조건문">
     		...
     		<c:otherwise>
     	</c:choose>

     	<c:redirect>
     	```
   	- fmt
  		```
   		// 날짜/숫자 변경 시 사용
   		// 보통 DB에서 변경해서 오기때문에 사용빈도 낮음
   		<fmt:formatDate value="${today }" pattern="yyyy-MM-dd"/>
   		<fmt:formatNumber value="1234567" type="currency"/>
   		```
   	- fn
		```
   		// String 클래스의 메소드 활용
		${fm:length()} 등
   		```
</details>

******


## JavaScript


### 기본 문법
- 변수
	- var : 변수(ES5)
   		- 괄호({}) 밖을 벗어나도 마음대로 사용 가능 => 메모리 누수 현상 발생
   	- **let** : 변수(ES6)
  		- 괄호({})를 벗어나면 자동 메모리 삭제 => 메모리 누수 현상 방지
   	- **const** : 상수
   		- 한 번 초기화하면 바꿀 수 없는 값
- 자료형(데이터형)
	- 변수는 데이터형이 없다 => 자동 데이터형 인식
   	- 기본형
  		- number, string, boolean, null, undefined 등
   	- 참조형
   		- object, array, function 등
   	- 데이터형 확인 방법 : typeof
   	- 형변환
   		- Number(문자) : 문자 => 숫자
   		- String(숫자) : 숫자 => 문자
   	   	- Boolean(변수) : 논리형 변환(0, 0.0, null, '', "" 제외한 나머지 true 반환)
   	- **서버와 데이터형 연결**
   		- List : [] (배열)
   	   	- VO : {} (객체)
- 연산자
	- 단항연산자
   		- 증감연산자 : ++, --
       	- 부정연산자 : !
       	- 형변환 연산자 : Number(), String(), Boolean()
   	- 이항연산자
  		- 산술연산자 : +, -, *, /, %
   	  		- 숫자가 아닌 변수와 연산이 안되는 경우 : NaN
   	      	- 0으로 나눌 수 없다 : Infinity
   	      	- 변수의 초기값이 없는 경우 : undefined
   	      	- 정수/정수 = 실수
   	      	- % 사용 시 부호는 왼쪽 변수를 따라간다
   	  	- 비교연산자 : ==, !=, ===, !==, <=,>=,<,>
   	  	  	- 문자, 날짜 비교도 가능하다
   	  	  	- ==, != 는 값만 비교하지만 ===, !== 는 데이터형도 비교한다
		- 논리연산자 : &&, ||
   	- 삼항연산자
   		- 조건 ? 값1 : 값2
   	- 연산자 사용 시 주의점
   		- 숫자가 아닌 변수와 연산이 안되는 경우 : NaN
   	    - 0으로 나눌 수 없다 : Infinity
   	    - 변수의 초기값이 없는 경우 : undefined
   	    - 정수/정수 = 실수
   	    - HTML에서 입력 값을 받는 경우는 무조건 string 타입
- 제어문
	- 조건문
   		- **단일조건문**
       		```
			if(조건문) { 실행문장 }
         	```
        - **선택조건문**
   			```
			if(조건문) { 실행문장 }
        	else { 실행문장 }
         	```
        - 다중조건문 : 유효성 검사 등에 사용
   			```
			if(조건문) { 실행문장 }
			else if(조건문) { 실행문장 }
        	...
        	else { 실행문장 }
         	```
      	- 선택문
  			```
      		// break가 없으면 break 만날때까지 밑에 문장을 계속 실행한다
			switch(number/string) {
			case 값1:
      			실행문장
      			break;
      		case 값2:
     		...
      		default:
      			실행문장
      		}
      		```
    - 반복문
  		- do~while
      	- while
      	- **일반 for**
      	- for in
			```
			for(변수 in 배열) {
				// 배열의 인덱스 번호를 가지고 온다
				// 배열 여러개 동시출력
			}
			```
		- **for of**
			```
			for(변수 of 배열) {
				// 배열의 실제 데이터를 가지고 온다
			}
			```
		- **forEach** : 데이터가 집합일 경우(배열/객체)
			```
			배열.forEach(function(변수,index){ // 자동호출되는 함수
    			//
			}) 
			```
		- **map** : 목록 출력
			```
			배열.map(function(변수,index) { // forEach와 동일
			 	//
			})
			```
