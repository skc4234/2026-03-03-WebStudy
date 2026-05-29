package com.sist.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import com.sist.model.*;

@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String,Model> clsMap = new HashMap<String,Model>();
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		// XML => 클래스 등록
		// C:\webDev\webStudy\JSPMVCProject_3\src\main\webapp\WEB-INF\application.xml
		try {
			String path="C:\\webDev\\webStudy\\JSPMVCProject_3\\src\\main\\webapp\\WEB-INF\\application.xml";
			// 파싱
			// 파서기 생성 => HTML / WML / XML
			// 클래스 생성 패턴 => 팩토리 패턴
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db=dbf.newDocumentBuilder();
			Document doc = db.parse(new File(path));
			// Document => 문서 저장 공간
			
			// 값 읽기 : 테이블
			Element root = doc.getDocumentElement();
			//System.out.println(root.getTagName()); => <beans>
			// <beans><bean> 을 모아서 데이터 추출
			NodeList list = root.getElementsByTagName("bean");
			for(int i=0; i<list.getLength(); i++) {
				Element bean = (Element)list.item(i);
				String id=bean.getAttribute("id");
				String cls=bean.getAttribute("class");
				//System.out.println("id : " + id +"\nclass : " + cls);
				Class clsName=Class.forName(cls);
				// 싱글턴
				Model model = (Model)clsName.getDeclaredConstructor().newInstance();
				clsMap.put(id, model);
				//System.out.println("id : " + id +"\nclass : " + model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 사용자 요청 받기 => 처리 => 결과값 전송
		/*
		 * Model model1 = clsMap.get("main/main.do"); Model model2 =
		 * clsMap.get("food/detail.do"); Model model3 = clsMap.get("goods/list.do");
		 * System.out.println("m1="+model1); System.out.println("m2="+model2);
		 * System.out.println("m3="+model3);
		 */
		try {
			// uri = JSPMVCProject_3/*.do
			String uri=request.getRequestURI();
			String key=uri.substring(request.getContextPath().length()+1);
			Model model = clsMap.get(key);
			String jsp = model.handleRequest(request, response);
			// 결과값(jsp)을 JSP로 전송
			RequestDispatcher rd = request.getRequestDispatcher(jsp);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}

}
 