package com.sist.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.*;
import com.sist.model.*;

// Ubuntu => AWS(유료) 사용
// 오라클 => IP 주소로 연결
// Domain => ngrook
// URI 주소 => .do가 있으면 Servlet(Controller)을 호출
// MVC는 무조건 Controller를 거쳐야 수행
/*					      
 * 						 DispatcherServlet
 *    브라우저(주소창) 요청 ===== Controller ===== Model 찾기
 *    										   |
 *    										 Model 메소드 호출 및 DAO 연동
 *    										   |
 *    										 결과값(request/session에 담기)
 *    										   |
 *    									   Controller
 *    										   |
 *    									   호출한 JSP 찾아서 결과값 전송
 *    1) 클래스 구분 / 메소드 찾기 => Annotation
 *    	=> 기능은 없지만 쉽게 찾을 수 있다
 *    2) 필요한 데이터 등록 => XML
 *    3) 데이터베이스 연동 => MyBatis / JPA
 *    4) MVC 동작 방법
 *    =============================> Spring 동작 구조 / SpringBoot					 
 * 
 *    - Annotation : 알아보기 쉽게 만든 것(주석x)
 *    	=> 구분을 위한 마커
 *    	- 복잡한 XML / if문 을 단순하게 만들어줌 => 소스의 간결화, 생산성 확대
 *    
 *    - Annotation 제작 방법
 *    	1. Retention : 메모리 할당 시 생명주기
 *    		- SOURCE: 컴파일 시 소멸(@Override 등)
 *    		- CLASS
 *    		- **RUNTIME : 프로그램 종료시까지 유지
 *    	2. Target : 어떤 타입에 붙여야 하는지 정의 => 위나 왼쪽에 붙인다
 *    		- **Type : 클래스 위 (클래스 찾기)
 *    		- **Method : 메소드 위 (메소드 찾기)
 *    		- Constructor : 생성자 위 (생성자 찾기)
 *    		- Parameter : 매개변수 위 (매개변수 찾기)
 *    		- **Field : 멤버변수 위 (멤버변수 찾기)
 *    
 */
// Spring은 @WebServlet이 없다 => web.xml에 등록
@WebServlet("*.do")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String pack="com.sist.model"; // XML에 등록
	private List<String> clsList = new ArrayList<String>();
	
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		try {
			// 수정 => realPath() => 리눅스 호환
			// 경로가 다름 => File.separator
			// github에 올리면 path 바뀜
			String path="C:\\webDev\\webStudy\\JSPMVCProject_5\\src\\main\\java";
			String s=path+"\\"+pack.replace(".", "\\");
			File dir=new File(s);
			File[] files=dir.listFiles();
			for(File f : files) {
				if(f.isFile()) {
					String name=f.getName();
					String ext=name.substring(name.lastIndexOf(".")+1);
					if(ext.equals("java")) {
						//System.out.println(name);
						String ss=pack+"."+name.substring(0,name.lastIndexOf("."));
						/*
						 * Class c = Class.forName(ss); Object obj =
						 * c.getDeclaredConstructor().newInstance(); System.out.println(obj);
						 */
						clsList.add(ss);
					}
				}
			}
			//System.out.println(s);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 사용자 요청 받기
		// uri = JSPMVCProject_5/food/list.jsp
		// getContextPath = JSPMVCProject_5/
		String uri = request.getRequestURI();
		String cmd=uri.substring(request.getContextPath().length()+1);
		try {
			// 메소드 찾기
			for(String cls : clsList) {
				Class clsName = Class.forName(cls);
				
				// clsName에 @Controller가 없는 클래스면
				if(clsName.isAnnotationPresent(Controller.class)==false) {
					// 사용하지 않는다
					continue;
				}
				// 메모리 할당
				Object obj = clsName.getDeclaredConstructor().newInstance();
				
				// 클래스 안에서 메소드 찾기
				// 클래스의 전체 메소드를 가지고 온다
				Method[] methods = clsName.getDeclaredMethods();
				for(Method m : methods) {
					// 메소드 위에 @RequestMapping이 있는 메소드 찾기
					RequestMapping rm = m.getAnnotation(RequestMapping.class);
					
					// @RequestMapping("...") 값과 일치하면
					if(rm.value().equals(cmd)) {
						// jsp는 리턴값
						String jsp=(String)m.invoke(obj, request, response);
						if(jsp==null) {
							// 리턴형이 void면 메소드 자체 처리만함
							// Jquery / JavaScript 등
							return;
						}
						else if(jsp.startsWith("redirect:")) {
							// sendRedirect() 포함 메소드 => request 초기화 후 화면 변경
							response.sendRedirect(jsp.substring(jsp.indexOf(":")+1));
						}
						else {
							// 리턴형이 있는 경우 => request 전송(유지) => forward 사용
							RequestDispatcher rd=request.getRequestDispatcher(jsp);
							rd.forward(request, response);
						}
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
