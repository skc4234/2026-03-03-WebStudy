<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	1. Cookie / Session
	2. File Upload
	3. ConnectionPool
	------------------> SpringBoot
	
	JSP는 변경 가능 가능한 HTML => 데이터 변경 가능 => 한 파일에서 여러개를 수행(동적 페이지)
		화면 출력 => HTML, 데이터 변경 => Java
		단점 : HTML+Java => 복잡하다, 여러명이 동시에 작업할 수 없다(협업 불가능)
			=> 분리 - HTML ---- Java
					 View      Model
					Front-End  Back-End
		MVC : 금융권, 공기업, 대기업
			  Spring
			  React
			  포털사이트 => 자체 Controller
			  => Server 각자 수행 => MSA 방식
			  배포 => Docker-Compose / 쿠바네티스
			        ---------------   ------
			              AWS          Ubuntu
		Back-End : 1. 자바  2. JSP=>MVC  3. SpringFrameWork  4. JDBC=>DBCP
					5. SpringBoot  6. MyBatis  7. JPA
		Front-End : 1. JavaScript  2. JQuery/바닐라JS  3. VueJS=>Vuex=>Pinia
					4. React=>Redux=>TanStack-Query=>NextJS
					5. NodeJS / TypeScript
		CI/CD : 1. Git Action  2. Docker  3. Docker-Compose  4.DockerHub
				5. 쿠바네티스,우분투  6. Jenkins  7. Ngnix / Ngrook
				
				
		1. JSP 지시자
			- 전체 설정을 담당하는 태그
			- page, tag, include
			- RestFul
			- page
				- errorPage : 오류가 발생하면 이동하는 페이지 설정
				- buffer : HTML을 출력하기 위해 저장된 메모리 공간
			- taglib : 자바의 기본(제어문), String, 날짜변환, 숫자 변환
				- => 태그형으로 만들어져있다 => <%%>를 사용하지 않게 만든다
				- <c:forEach>, <c:if>, <c:choose>
				- <c:redirect> : sendRedirect()
				- <fmt:formatDate>, <fmt:formatNumber>
				- <fn:substring>
					=> 이미 제작되어 있다(JSTL)
		2. JSP 내장 객체
			- 미리 생성된 객체
			- **request : 클라이언트 요청 정보(사용자가 보낸 값)
			- **response : 응답하는 클래스(HTML, Cookie)
			- **session : 사용자 당 1개만 생성 -> 서버에 저장
				- 보안이 뛰어나다 => 로그인/장바구니
			- application : 전체 내용 관리
			- out : 출력 버퍼 관리
			- pageContext : <jsp:include> <jsp:forward>
			
		3.  Cookie
			- 클라이언트 브라우저에 저장
			- 보안이 약하다
			- 만료시간 설정(보통 24h) => 제한적이다
			- 문자열 저장 가능
			- 기능 : 최근 방문 / 로그인 유지 / 자동 로그인
										--------> 비밀번호 암호화
		===========================================================
		1. 액션 태그
			- **<jsp:include>** : 실무에서도 사용
			- <jsp:param>
			- <jsp:forward>
			- **<jsp:useBean>**
			- **<jsp:setProperty>**
			- <jsp:getProperty>
		2. 자바빈즈
			- VO, DTO 와 비슷, JSP에서는 Bean
			- 데이터를 모아서 전송
			- 캡슐화(데이터 보호) 사용
			- 데이터 은닉화(private) / 변수에 기능 부여(getter/setter)
			- 읽기/쓰기는 public
			- private boolean admin;
				- public boolean isAdmin() {}

--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>