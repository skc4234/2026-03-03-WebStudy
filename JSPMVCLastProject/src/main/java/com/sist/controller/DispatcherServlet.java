package com.sist.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;
import java.io.*;
import java.util.*;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import java.net.*;
// MVC 구조 => 호환성(Windows/Ubuntu => AWS 호스팅) => .jar(라이브러리) 파일로 묶음 
@WebServlet("*.do")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// 클래스 저장 => Model 클래스
	private List<String> clsList = new ArrayList<String>();
	// com.sist.model.FoodModel, com.sist.model.GoodsModel 등
	
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		try {
			URL url = this.getClass().getClassLoader().getResource(".");
			// 파일로 변경
			File file = new File(url.toURI());
			//System.out.println(file.getPath()); // 경로명/파일명
			String path=file.getPath();
			path=path.replace("\\", File.separator); // 경로 자동 변환 - Windows:\\, Ubuntu:/
			// Ubuntu => war파일로 만들어서 tomcat에 올려 실행
			//System.out.println(path);
			/*
			 *   C:\webDev\webStudy\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JSPMVCLastProject\WEB-INF\classes
			 *   xml 파일 읽기 위해서 \classes 제거
			 */
			path=path.substring(0, path.lastIndexOf(File.separator));
			//System.out.println(path);
			path=path+File.separator+"application.xml";
			//System.out.println(path);
			
			// XML 안에 있는 데이터 추출(파싱)
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();

			// 파싱기 생성
			DocumentBuilder db = dbf.newDocumentBuilder();
			
			// 파싱할 XML 읽기
			Document doc = db.parse(new File(path));
			
			// root태그(<beans>) 읽기 => root태그는 table과 같은 역할
			Element beans = doc.getDocumentElement();
			//System.out.println(beans.getTagName()); // => beans
			
			// 같은 이름의 태그를 모아서 한번에 추출
			NodeList list = doc.getElementsByTagName("context:component-scan");
			String pack="";
			for(int i=0; i<list.getLength(); i++) {
				Element elem = (Element)list.item(i);
				pack = elem.getAttribute("basepackage");
			}
			clsList=ComponentScan.componetScan(file.getPath(), pack);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 사용자 요청 => URL 주소
		String uri = request.getRequestURI();
		uri=uri.substring(request.getContextPath().length()+1);
		//System.out.println(uri);
		try {
			/*
			 * 	 @Controller
			 *   public class MainModel {
			 *   	@RequestMapping("main/main.do")
			 *   	public static String main_main() {...}
			 *   }
			 *   
			 *   => uri와 일치하는 메소드 호출
			 */
			// Model 클래스 찾기 => @RequestMapping
			// => 메소드 호출
			for(String clsName : clsList) {
				// 메모리 할당
				Class cls = Class.forName(clsName);
				if(cls.isAnnotationPresent(Controller.class)==false) {
					// @Controller가 없으면
					continue;
				}
				// @Controller 가 있는 경우
				// 메모리 할당
				Object obj = cls.getDeclaredConstructor().newInstance();
				
				// 메소드 찾기
				Method[] methods = cls.getDeclaredMethods();
				for(Method m:methods) {
					RequestMapping rm = m.getAnnotation(RequestMapping.class);
					if(rm.value().equals(uri)) {
						String jsp = (String)m.invoke(obj, request, response);
						if(jsp==null) {
							// JavaScript => Ajax
							return;
						}
						else if(jsp.startsWith("redirect:")) {
							// redirect: 뒤에 들어갈 uri로 redirect
							response.sendRedirect(jsp.substring(jsp.indexOf(":")+1)); 
						}
						else {
							RequestDispatcher rd=request.getRequestDispatcher(jsp);
							rd.forward(request, response);
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
