package com.sist.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.sist.model.DeleteModel;
import com.sist.model.DetailModel;
import com.sist.model.InsertModel;
import com.sist.model.ListModel;
import com.sist.model.UpdateModel;

/*
 *   서블릿 동작 방식
 *       init() : 환경설정 => web.xml
 *         |
 *      service() : doGet()+doPost() 동시 처리
 *         |---------doGet():GET    /  doPost():POST
 *         |		  -sendRedirect    	-<form>    
 *         |		  -<a>				-ajax
 *         |		  -location.href	-vue
 *         |							-react
 *      destroy() : 메모리 해제
 *   - 브라우저 => Controller => 해당 Model을 찾는다
 *   					   => 처리된 결과를 가지고 온다
 *   					   => JSP에 전송
 *   					   		- 공통적인 부분 : session에 담는다
 *   							- JSP마다 다르게 : request에 담는다
 *   - 브라우저 : JSP => 사용자(손님)
 *   	  | => 요청 : 주문 받기
 *   - Controller : Servlet => 서빙
	   |        ^		
 *     |오더 찾기  | 결과 전송
 *     v        |
 *   - Model : Java => 주방
 *      
 *   - Controller => 처리 방식 동일 => 찾기+보내기
 * 
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void init(ServletConfig config) throws ServletException {
		// Model 클래스 메모리 할당
	}
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 주문 받기 : 요청
		// http://localhost/JSPMVCProject_1/Controller?cmd=list
		String cmd=request.getParameter("cmd");
		if(cmd==null) cmd="list";
		
		// 2. 주문을 담당하는 해당 클래스나 메소드를 찾기
		String jsp="";
		if(cmd.equals("list")) {
			ListModel model = new ListModel();
			model.execute(request);
			jsp="view/list.jsp";
		}
		else if(cmd.equals("detail")) {
			DetailModel model = new DetailModel();
			model.execute(request);
			jsp="view/detail.jsp";
		}
		else if(cmd.equals("insert")) {
			InsertModel model = new InsertModel();
			model.execute(request);
			jsp="view/insert.jsp";
		}
		else if(cmd.equals("update")) {
			UpdateModel model = new UpdateModel();
			model.execute(request);
			jsp="view/update.jsp";
		}
		else if(cmd.equals("delete")) {
			DeleteModel model = new DeleteModel();
			model.execute(request);
			jsp="view/delete.jsp";
		}
			
		
		// 3. 요청 처리(Model이 가지고 있는 메소드 호출)
		// 4. 담당 JSP 찾기
		// 5. request / session에 처리 결과값 보내기 
		RequestDispatcher rd = request.getRequestDispatcher(jsp);
		rd.forward(request, response);
	}

}
