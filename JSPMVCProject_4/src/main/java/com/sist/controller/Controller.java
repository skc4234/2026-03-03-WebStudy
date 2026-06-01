package com.sist.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import java.util.*;
import com.sist.model.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
// _jspService(GET / POST)
/*
 * 결과값 출력 (요청) === 요청 받기 / Model 찾기 === 결과값 전송 ==== 요청처리 
 * --------------          Controller                  비즈니스로직(데이터 처리)
 *  JSP => View                                          Model
 *                                                        1) VO 
 *                                                        2) DAO
 *                                                        3) 통합 => request값 담기 
 *                                                          Model 
 *                                                        4) Open API / WebSocket 
 */

// Controller는 수정되지 않아야 한다 => 파일(xml)로 변경사항을 읽어온다
@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private String[] cls = {
		"com.sist.model.ListModel",
		"com.sist.model.InsertModel",
		"com.sist.model.DetailModel",
		"com.sist.model.DeleteModel"
	};
	private String[] keys= {
		"databoard/list.do",
		"databoard/insert.do",
		"databoard/detail.do",
		"databoard/delete.do"
	};

	// Map으로 uri/model 저장=> if문 없이 찾기 가능
	// Spring에서는 <bean id="databoard/list.do" class="com.sist.model.ListModel"> 로 제어
	private Map<String, Model> clsMap=new HashMap<String, Model>();
	
	// 초기화 => 메뉴 저장
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		try {
			for(int i=0; i<cls.length; i++) {
				// 리플렉션 : 클래스 명으로 메모리 할당 / 멤버변수 설정 / 생성자 호출 / 메소드 호출
				Class clsName=Class.forName(cls[i]);
				Model model = (Model)clsName.getDeclaredConstructor().newInstance(); // 메모리 할당
				clsMap.put(keys[i], model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 요청 처리 => Model
		try {
			// 1. 요청 받기
			// URI : JSPMVCProject_4/databoard/list.jsp
			// ContextPath : JSPMVCProject_4
			String uri=request.getRequestURI();
			String key=uri.substring(request.getContextPath().length()+1);
			
			// 2. 해당 Model 찾기
			Model model = clsMap.get(key);
			
			// 3. 메소드 호출 => JSP로 받는다
			String jsp=model.requestHandler(request, response);
			
			if(jsp.startsWith("redirect:")) {
				// 4-1. request 유지하지 않고 이동 => sendRedirect
				response.sendRedirect(jsp.substring(jsp.indexOf(":")+1));
			}
			else {
				// 4-2. request에 값을 넣고 유지하면서 이동 => forward
				RequestDispatcher rd=request.getRequestDispatcher(jsp);
				rd.forward(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
