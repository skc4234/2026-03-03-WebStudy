<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	**새로고침/화면이동 시 request 객체는 초기화
	내장(내부) 객체
		- JSP에서 미리 생성된 객체
	public void _jspService(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
      		PageContext pageContext;
    		HttpSession session = null;
    		ServletContext application;
    		ServletConfig config;
    		JspWriter out = null;
    		Object page = this;
    		Exception exception; => 총 9개의 내장 객체

    		
    		--------------------
    		 JSP에서 소스 코딩 => JSP는 _jspService()에 코딩
    		--------------------
      }
      
      request : 사용자 요청 정보 / 서버 정보 / 브라우저 정보 / 추가 정보
      response : 이동 정보 / 응답 정보
      session : 상태(데이터) 정보 / 사용자 정보 저장 => 종료 전까지 유지
      out : 출력 정보
      application : 서버 정보 / 자원 정보
      pageContext : include / forward / 내장 객체 읽기
      ---------------------
      config : web.xml를 이용해서 설정시에 사용 => 등록된 정보 읽기
      exception : try~catch
      page : this
      -------------------------
      
      cookie : 저장 요청시마다 메모리 할당(브라우저에 저장) => 최근 방문 페이지 정도만 저장 / JWT
      
      
      - request 객체
      	- 가장 많이 사용되는 객체
      	1. 서버 정보
      		getServerName() : 서버 이름 출력
      	    getProtocol() : 사용된 프로토콜
      	    getMethod() : GET/POST 방식 확인
      	    getRequestURL()
      	    getRequestURI()
      	    getContextPath()
      	    
      	    http://localhost/JSPBasicProject_3/jsp3/object.jsp
      	    ---------------- ---------------------------------
      	    서버 정보            클라이언트 요청 정보
      	    
      	2. 브라우저 정보 => 로그 파일
      		getRemoteAddr() : 사용자의 IP
      		getServerPort() : 사용자의 PORT
      		
      	3. 사용자 요청정보
      		- 단일값
      			getParameter()
      		- 다중값(checkbox 등)
      			getParameterValues()
      		- 한글
      			decode : setCharacterEncoding()
      	4. 추가 정보
      		- setAttribute
      		- getAttribute
      		
      		사용자 전송 === 서버에서 값 받기
      		--------    -------------
      		  송신            수신
      		  => 어떤 값을 전송할지
      		  => 값을 받은 경우에 어떻게 처리
      		  => 검색어 / 상세보기
      		  => 숨겨서 보낸다 : id/pwd 등 
      	
      	
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>request => 서버 정보</h1>
	<ul>
		<li>
			서버 이름 : <%=request.getServerName() %>
		</li>
		<li>
			사용 프로토콜 : <%=request.getProtocol() %>
		</li>
		<li>
			URL : <%=request.getRequestURL() %>
		</li>
		<li style="color: red">
			URI : <%=request.getRequestURI() %>
		</li>
		<li style="color: red">
			ContextPath : <%=request.getContextPath() %>
		</li>
	</ul>
	<h1>request => 브라우저 정보</h1>
	<ul>
		<li style="color: blue">
			클라이언트 IP : <%=request.getRemoteAddr() %>
		</li>
		<li>
			클라이언트 PORT : <%=request.getServerPort() %>
		</li>
		
	</ul>
	<h1>request => 사용자 요청 정보</h1>
	<ul>
		<li style="color: red">
			단일 값 : getParameter()
		</li>
		<li style="color: red">
			다중 값 : getParameterValues()
		</li>
		<li style="color: red">
			한글변환 값 : setCharacterEncoding()
		</li>
	</ul>
	<h1>데이터 추가 정보(MVC)</h1>
	<ul>
		<li style="color: green">
			데이터 추가 : setAttribute()
		</li>
		<li style="color: green">
			 데이터 읽기 : getAttribute()
		</li>
	</ul>
</body>
</html>