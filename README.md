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

</details>


***



## JSP


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
