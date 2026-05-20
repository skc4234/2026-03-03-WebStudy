<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	1. JSP 내장 객체 : JSP 컨테이너에서 미리 생성된 객체
		- *request* : HttpServletRequest => 요청 정보
		- *response* : HttpServletResponse => 응답 정보
		- *session* : HttpSession => 서버에 필요한 데이터 저장
		- out : JspWriter => 출력 버퍼(실행 시 HTML 저장하는 메모리 공간)와 제어
			- <%= %> ==> EL ${}	
		- *application* : ServletContext => 서버 정보
		- pageContext : PageContext => 내장 객체 관리, include, foward 관리
			- <jsp:include>, <jsp:forward>
		===============================================
		- exception : Exception => 예외처리
		- page : Object => 자신의 객체(this)
		- config : ServletConfig => 환경설정 파일(web.xml)
		
		
		
	- request : HttpServletRequest
		- 역할
			- 전체 URL
			- http://localhost /JSPBasicProject_4/jsp/response.jsp
			  ---------------- -----------------------------------
			      서버 정보            요청 정보 => URI
			                   /JSPBasicProject_4 => ContextPath
			- 주소창을 통해서 서버로 전송
			- 서버 정보
				- getServerName() : 서버 이름
				- getProtocol() : 프로토콜
				- getMethod() : 전송 방식
					- RestFul => GET / POST / DELETE / PUT
					-          SELECT INSERT  DELETE  UPDATE
					- Web에서는 GET/POST 자주 사용
			- 브라우저 정보
				- 클라이언트의 IP / PORT 정보
				- *getRemoteAddr()* : IP
				- getServerPort() : Port
			- URL/URI/ContextPath
				- getRequestURL
				- *getRequestURI*
				- *getContextPath()*
			- 사용자 요청 정보
				- getParameter("name 속성값") : 단일값 읽기
				- getParameterValues() : 다중값 읽기 => checkbox, <select multiple>
				- setChararctoerEncoding("UTF-8")
					- 자바에서 디코딩
					
					
					
			- 전송
				- main.jsp?no=10
						   키  값
						   key 중복 불가 => map방식
					- 10을 main.jsp로 전달한다
					- 메소드의 매개변수에서 받아서 처리
					- 검색어
					- 회원가입 => 입력값 전체
					- 로그인
			 - 추가 정보
			 	- void setAttribute("키", 값)
			 	- Object getAttribute("키") =
			 	
			 	
		- response : HttpServletResponse
			- 응답하는 객체
			- setContentType("text/html; charset=UTF-8");
			- Cookie 전송
				- addCookie(쿠키명);
				- setHeader()
			- 두개를 동시에 응답할 수 없다 => 파일 한개만 전송 가능
			
		- 화면 이동 정보
			- sendRedirect("이동할 파일명") : GET
			- insert => insert_ok => list
						sendRedirect("list")
			- 단점 : request를 초기화
			- 보안 : forward
				- request를 계속 유지
			
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