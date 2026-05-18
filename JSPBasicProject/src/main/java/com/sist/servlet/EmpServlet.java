package com.sist.servlet;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/*
	1. 서블릿 / JSP
		서블릿은 순수하게 자바중심의 웹 프로그램 => 초창기
		단점
			- 수정시마다 컴파일해서 톰캣 위에 올려줌 => 수정후 바로 확일 불가
			- 소스가 길어짐
			- CSS나 자바스크립트 처리가 어렵다
		장점
			- 소스가 노출되지 않음 => 보안성이 높다
			- 자바 중심ㅇ기기 때문에 호환성, 유지보수가 용이하다
			- 확장성이 좋다
	2. JSP : HTML 중심 => 화면 UI
		- 장점
			- 서블릿의 단점 보안
			- 수정후에 바로 수행 => 컴파일(톰캣)
			- 소스가 짧음 => HTML/JAVA 구분
			- HTML 중심 => CSS/JavaScript 바로 사용 가능
		- 단덤
			- 소스노출, 확장성 낮음
			
	3. 서블릿의 생명주기
		init() : 초기화(생성자 대체)
			=> DB연결 준비, 설정 파일 읽기(web.mxl)
			=> 공통 자원 초기화(멤버변수, 메소드)
		service() : 클라이언트 요청 시 마다 실행
			- doGet() : 
			- doPost() :
			- sesrvice() : GET/POST를 동시 처리
				=> 요청 시에는 하나만 처리
			- GET
			- POST
			1) 요청 데이터 받기
			2) db 처리
			3) 로직 처리(요청 처리)
			4) 응답 처리
		destroy() : 서버 종료 / 새로고ㅗ침 . 
		
			클라이언트 요청(브라우저)
				|
			서블릿 객체 생성
				|
			init()호출 => 한번만 수행 =>_jspInit()
				|
			요청시마다=>service()=>_jspService()
				|
			응답처리
				|
			서버종료시=>destroy() 호출 => _jspDestroy()
			
			
		1. 동적 컨텐츠
			=> 정적 페이지 / 동적 페이지
				=> HTML만 사용하면 데이터를 변경할 수 없다 => 정적 페이지
				=> JSP / ThymeLeaf / PHP / ASP / DJango
				   ----------------        ---   -----ㅑ
				     자바 중심                      파이썬
				    
				    SpringBoot
				    Spring-Security / JWT / 소셜 로그인
				    Spring WebSocket
				    카프카
		2. 웹 동작(18page) : request, response
			request(브라우저에서 요청) / response(서버에서 요청처리 후 응답)
			'
			실제 동작
				client(브라우저_ ========= web server ===
				요청(주소창:URL)
				JSP/Servlet ㅇㅁ진
		3. servlet/jsp
			- servelt은 자바 중심
			- jps는  HTML 중심
		4. JSP란
		5. JSP의 특징
		6. 서블릿 이해
	=====================
		지시자, 내장객체, Cookie/Session
		
		
		
		
		
 */
@WebServlet("/EmpServlet") // 구분자 => 사용자에 따라 변경 가능
public class EmpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("init() 호출");
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		// default => 바로 실행 => GET  방식 호출 => HTML
		// 글쓰기 폼
		// 실행 후 별환
		/*
		 * 
		 */
		// 응답하는 타입 설정
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.write("<html>");
		out.write("<body>");
		out.write("<h1>Hello Servlet</h1>");
		out.write("</body>");
		out.write("</html>");
		/*	
		 * 1. 역할 : 웹서비스 기능을 처리하는 자바 클래스 : 서블릿
		 * 	- 현재 : controller 역할
		 * 		- 자바+HTML을 묶어주는 역할
		 * 		- 스프링은 이미 만들어짐=>라이브러리
		 * 		- DispatcherServlet
		 * 2. 자바 안에 HTML 코드를 첨부해서 사용
		 * 		out.write("<html>")l
		 * 		- HTML 사용하기 어렵다(복잡) => CSS, JavaScript 사용이 어렵다
		 * 		- 에러 처리가 어렵다
		 * 		- 실행마다 컴파일 해서 사용 => 바로 결과를 볼 수 없다
		 * 		- 소스를 볼 수 없다(.class) => 보안이 높다
		 * 3. 서블릿의 단저 보완
		 * 		=> 
		 * 4. JSP 
		 * 		<% if() { %>
		 * 		<%	} %>
		 * 
		 * 	=. <c:if test="조건문">
		 * 
		 * 
		 * 
		 * a_jsp.java => 톰캣
		 * public class a_jsp extends HttpServlet {
		 * 	public void _jspInit();
		 *  public void _jspDestory();
		 *  public void _jspServier() {
		 *  
		 *  	HttpServletRequest request;
		 *  HttpServlet/h
		 *  }
		 * }
		 * 
		 */
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
