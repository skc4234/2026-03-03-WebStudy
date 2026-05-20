<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<h1>JSP에서 지원하는 내장 객체: 미리 생성된 객체</h1>
		</div>
		<table class="table">
			<tr>
				<th>객체</th>
				<th>사용범위</th>
				<th>공유여부</th>
			</tr>
			<tr>
				<td>request</td>
				<td>요청하는 동안</td>
				<td>같은 JSP안에서만 사용 가능(include 시 공유)</td>
			</tr>
			<tr>
				<td>response</td>
				<td>브라우저가 유지하는 동안(브라우저 종료/로그아웃)</td>
				<td>사용자별 유지</td>
			</tr>
			
			<tr>
				<td>session</td>
				<td>요청하는 동안</td>
				<td>같은 JSP안에서만 사용 가능(include 시 공유)</td>
			</tr>
		</table>
		<h1>JSP 내장 객체 종류</h1>
		<table class="table">
			<caption>내장 객체는 서블릿으로 변환시에 자동으로 생성되는 객체</caption>
			<tr>
				<th>객체명</th>
				<th>클래스명</th>
				<th>주요기능</th>
				<th>주요메소드</th>
				<th>사용법</th>
			</tr>
			<tr>
				<td>request</td>
				<td>HttpServletRequest</td>
				<td>클라이언트가 보낸 요청 데이터를 모아서 전송(쿠키 읽기, 세션 읽기)</td>
				<td>
					<ul>
						<li>getParameter()</li>
						<li>getParameterValues()</li>
						<li>getRequestURL()</li>
						<li>getRequestURI()</li>
						<li>getContextPath()</li>
					</ul>
				</td>
				<td>사용자 요청 정보 / 쿠키, 세션 읽기
					<br>
					Cookie[] cookies = request.getCookies();
					<br>
					HttpSession session = request.getSession();
				</td>
			</tr>
			<tr>
				<td>response</td>
				<td>HttpServletResponse</td>
				<td>서버에서 클라이언트로 응답 시 사용
				<br>
				HTML 전송 / Cookie 전송 중 한개 선택(두 개를 동시에 보낼 수 없음)
				<br>
				HTML => setContentType("text/html; charset=UTF-8"); => page 지시자 안에 포함
				<br>
				response.addCookie(cookie)
				</td>
				<td>
					<ul>
						<li>*sendRedirect()* : GET => 다른 파일로 이동</li>
						<li>addCookie() => cookie로 전송</li>
						<li>setHeader() => 데이터 전송 전에 송신 : 다운로드</li>
					</ul>
				</td>
				<td>
					쿠키 전송 / 다운로드 / 채팅
				</td>
			</tr>
			<tr>
				<td>application</td>
				<td>ServletContext : Spring => request/response 읽기</td>
				<td>서버에 대한 정보 / 로그 정보 / 자원 정보</td>
				<td>
					<ul>
						<li>getInitParameter() : web.xml에 등록된 데이터 읽기(보안)</li>
						<li>*getRealPath()* : 실제 톰캣에서 읽은 파일 : 소프트웨어 이행
						<br>
						File.separator => 윈도우 \ , 리눅스 /
						</li>
					</ul>
				</td>
				<td>AWS 호스팅 / 파일 업로드</td>
			</tr>
			<tr>
				<td>out</td>
				<td>JspWriter</td>
				<td>출력 버퍼(HTML 출력을 위한 저장공간) 관리 : 사용자 당 1개 생성</td>
				<td>
					<ul>
						<li>getBufferSize() : 총 버퍼 크기</li>
						<li>getRemaining() : 남아 있는 버퍼 크기</li>
						<li>print() / write() / println() : &lt;%= %&gt;</li>
					</ul>
				</td>
				<td>브라우저에 출력 시 주로 사용 => 최근에는 EL로 변경</td>
			</tr>
			<tr>
				<td>pageContext</td>
				<td>pageContext</td>
				<td>페이지의 흐름()</td>
				<td>
					<ul>
						<li>include()</li>
						<li>forwoard()</li>
					</ul>
				</td>
				<td>&lt;jsp:include &gt;
				&lt;jsp:forward &gt;
				</td>
			</tr>
			<tr>
				<td colspan="5">
				<ul>
					<li>session :나중에</li>
					<li>exception : try~catch</li>
					<li>config : web.xml</li>
					<li>page : this</li>
				</ul>
			</tr>
		</table>
	</div>
</body>
</html>