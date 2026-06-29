<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%--
	저장공간
	- Session: 접속 시에 서버에 저장
		- 한명당 하나만 생성
		- port가 다른 경우에는 저장이 안됨(ex. React(Client, 3000)<->SpringBoot(Server, 8080))
			=> javascript의 session으로 연결
			=> JWT: cookie 기반(카카오 로그인 등)
		- 사용자 정보 저장(로그인)
		- 브라우저 종료/로그아웃 시에 세션이 사라진다
		- 자동 로그인 불가(저장x)
		- 내장 객체(HttpSession)
		- Object 단위로 저장
		- 주요 메소드
			- setAttribute(String key, Object obj)
				- session 저장
			- getAttribute(String key)
				- 출력 시 ${sessionScope.key}
			- invalidate()
				- 전체 session 해제 => 메모리 삭제
				- 로그아웃/브라우저 종료 시 사용
			- isNew()
				- 처음 저장하는지 여부 확인
				- 장바구니 처음 생성할 때 사용
			- getId()
				- 사용자마다 구분하는 고유번호
				- 실시간 채팅 등에 사용
			- setMaxInactiveInterval(int ms)
				- session 유지 시간(default: 1800, 30분)
				
	- Cookie
		- 브라우저에에 저장
		- new Cookie()
		- 문자열만 가지고 있다
		- 자동 로그인, 최근 방문, 장바구니 등(브라우저에 저장되어 있음)
		- 주요 메소드
			- Cookie cookie=new Cookie(String key, String value)
				- cookie 생성
			- setPath()
				- 저장 위치 지정(기본 "/")
			- cookie.getName(): key값 읽기
			- cookie.getValue(): value값 읽기
			- setMaxAge(0)
				- cookie 삭제
				- ms만큼 cookie 유지
	
	====> 상태 관리 프로그램	(Session/Cookie)
	- request: Session/Cookie 생성/읽기 가능
		- request.getSession() / request.getCookies()
		- getParameter() / getParameterValues() : 단일/복수개 값 받는 경우
		- setAttribute(): request 안에 새로운 데이터 저장
		- getAttribute(String key): JSP의 ${key} 와 같다
	
	- response: 응답
		- setContentType("text/html")
			- http헤더에 전달형식 전송
			- text/xml, text/plain 등
		- addCookie(): 쿠키 추가
		- setHeader(): 헤더 지정
		- sendRedirect(): request없이 전달
		
	- application: 서버 관리
		- getRealPath() / getResource()
			- 현재 App의 실제 주소값 출력
			- getResource()는 운영체제 상관없이 가능
			
	=================================================
	
	- MVC 구조
			브라우저(*.do)
			   |    ---> 
		DispatcherServlet
		       |    --->
     		 Model
		       |    --->
		DispatcherServlet
		       |    --->
			해당 JSP ---> 호출된 jsp로 값 전달
	
	- MyBatis
		- Config.xml: 환경설정 파일, Connection 설정
		- mapper.xml: 테이블당 sql 문장 파일
		- DAO
			- selectList("ID명", 매개변수) ==> List
			- selectOne("ID명", 매개변수) ===> 단일 데이터형
				===> 매개변수는 하나만 가능 => hashMap/VO 사용
				- map.put("key",값)
			- insert/update/delete: 모두 기능이 같다(void)
	
	- XML
		- id: 구분자(중복x)
		- resultType: SQL 실행 후 결과값 받는 변수
		- parameterType: ?에 값을 채우는 변수
		- resultMap: JOIN / 컬럼명이 다른 경우에 사용
		- parameterMap: PROCEDURE 사용시 변수 설정
			- IN/OUT/INOUT
		- CREATE PROCEDURE pro_name ... : 반복 많은 경우/보안/트랜젝션
		
	- 접속
		```
		Session session=ssf.openSession();
		// autoCommit: false
		// DML(INSERT, UPDATE, DELETE)는 commit 필요
		```
	
	- JQuery
		- $('태그명/클래스명/선택자'): DOM
		- 값 읽기
			- val(): <input>, <select>, <textarea>
			- text(): <태그>text</태그>
			- html(): HTML형식으로 출력
			- attr(): 속성값 읽기
			- append(): 태그 뒤에 붙이기
		- 이벤트: $(CSS 선택자).on('click',function(){})
			- click
			- change
			- keyup
			- mousedown
			- hover
		- 효과
			- show
			- hide
			- fadeIn / fadeOut
		- 서버 연결
			```
			// 1. ajax
			$.ajax({
				type: get/post
				url: 연결할 사이트 주소(JSON 등)
				data: {"키":값, ...} => 값 전송
				success:function(결과값){실행 문장}
				error:function(error){에러 처리}
			})
			
			// 2. fetch(): 내장함수
			// 3. axios(): 가장 많이 사용
			```	
		====> jquery:javascript, model:java, dao:sql
			
			
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="breadcumb-area" style="background-image: url(../img/bg-img/breadcumb.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="bradcumb-title text-center">
                        <h2>맛집 목록</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="breadcumb-nav">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Archive Page</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ****** Breadcumb Area End ****** -->

    <!-- ****** Archive Area Start ****** -->
    <section class="archive-area section_padding_80">
        <div class="container">
            <div class="row">
            	
            	<c:forEach var="vo" items="${list }">
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-post wow fadeInUp" data-wow-delay="0.1s">
                        <!-- Post Thumb -->
                        <div class="post-thumb">
                        <a href="../food/detail_before.do?no=${vo.no }">                     
                            <img src="${vo.poster }" alt="">
                        </a>
                        </div>
                        <!-- Post Content -->
                        <div class="post-content">
                            <div class="post-meta d-flex">
                                <div class="post-author-date-area d-flex">
                                    <!-- Post Author -->
                                    <div class="post-author">
                                        <a href="#">${vo.type }</a>
                                    </div>
                                    <!-- Post Date -->
                                    <div class="post-date">
                                        <a href="#">${vo.phone }</a>
                                    </div>
                                </div>
                                <!-- Post Comment & Share Area -->
                                <div class="post-comment-share-area d-flex">
                                    <!-- Post Favourite -->
                                    <div class="post-favourite">
                                        <a href="#"><i class="fa fa-heart-o" aria-hidden="true"></i>${vo.likecount }</a>
                                    </div>
                                    <!-- Post Comments -->
                                    <div class="post-comments">
                                        <a href="#"><i class="fa fa-comment-o" aria-hidden="true"></i>${vo.replycount }</a>
                                    </div>
                                    <!-- Post Share -->
                                    <div class="post-share">
                                        <a href="#"><i class="fa fa-share-alt" aria-hidden="true"></i></a>
                                    </div>
                                </div>
                            </div>
                            <a href="../food/detail_before.do?no=${vo.no }">
                                <h4 class="post-headline">${vo.name }</h4>
                            </a>
                        </div>
                    </div>
                </div>
				</c:forEach>

                <div class="col-12">
                    <div class="pagination-area d-sm-flex mt-15">
                        <nav aria-label="#">
                            <ul class="pagination">
                            	<c:if test="${startPage>1 }">
                            	<li class="page-item">
                                    <a class="page-link" href="../food/list.do?page=${startPage-1 }"><i class="fa fa-angle-double-left" aria-hidden="true"></i> 이전</a>
                                </li>
                                </c:if>
                                
                                <c:forEach var="i" begin="${startPage }" end="${endPage }">
                                	<li class="page-item ${curPage==i?'active':'' }"><a class="page-link" href="../food/list.do?page=${i }">${i }</a></li>
                                </c:forEach>
                                
                                <c:if test="${endPage<totalPage }">
                                <li class="page-item">
                                    <a class="page-link" href="../food/list.do?page=${endPage+1 }">다음 <i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
                                </li>
                                </c:if>
                            </ul>
                        </nav>
                        <div class="page-status">
                            <p>Page ${curPage } of ${totalPage } results</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>

</body>
</html>