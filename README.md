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

### CSS의 종류

<details><summary>숨기기/펼치기</summary>

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

</details>

 ***
 

### CSS 선택자

<details><summary>숨기기/펼치기</summary>


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


	   </details>

	 ***
