package com.sist.model;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
/*
 * 	Controller : Java에서 처리된 데이터를 JSP에 전송 : Servlet
 * 	Model : 데이터 처리, DB연동 : Java
 * 			=> 요청값을 받아서 데이터베이스의 값을 읽어온다
 * 		  : Back-End(Java)	
 * 	View : JSP => JSTL/EL => 화면 UI(데이터 처리=>Java)
 * 		 : Front-End(JavaScript)
 * 	=> 분업/확장성/보안
 * 
 * 	=> View단 - HTML,CSS,JavaScript(JQuery,React,Vue등)
 * 	=> **DB단 - 설계, 테이블 생성, SQL문장 제작
 * 	=> **로직단 - Model => 자바처리
 * 	=> SE - CI/CD, AWS
 */
import java.util.*;
import com.sist.dao.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
public class BoardModel {
	// 요청 => JSP 출력에 필요한 데이터 전달
	public void boardListData(HttpServletRequest request) {
		// Java => JSP
		// request, session 객체를 사용(공통으로 사용되는 데이터) => 데이터 유지
		// 1. 사용자 요청 정보 받기
		String page=request.getParameter("page");
		if(page==null) page="1"; // JSP=>Java : 자바 소스 최소화
		int curPage = Integer.parseInt(page); // 현재 페이지
		// 2. 요청받은 값을 이용해서 데이터베이스 연동
		BoardDAO dao = BoardDAO.newInstance();
		List<BoardVO> list = dao.boardListData(curPage);
		int count = dao.boardRowCount();
		int totalPage = (int)(Math.ceil(count/10.0));
		count=count-((10*curPage)-10); // 순차적인 숫자로 출력(시작위치)
		/*
		 *  count = 22
		 *  totalPage=3
		 *  1page : 22,21,20,19,... count=22
		 * 	2page : 12,11,...       count=12
		 *  3page : 2,1				count=2
		 * 
		 * 	
		 */
		// 3. 데이터베이스에서 가져온 데이터를 JSP로 전송 => Controller 역할
		// request.setAttribute() / session.setAttribute()
		request.setAttribute("list", list);
		request.setAttribute("curPage", curPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("count", count);
		request.setAttribute("today", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		request.setAttribute("msg", "관리자가 삭제한 게시물입니다");
	}
	
	public void boardInsert(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String pwd = request.getParameter("pwd");
		
		BoardVO vo = new BoardVO();
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		
		BoardDAO dao = BoardDAO.newInstance();
		dao.boardInsert(vo);
		
		try {
			response.sendRedirect("list.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void boardDetail(HttpServletRequest request) {
		String no=request.getParameter("no");
		BoardDAO dao = BoardDAO.newInstance();
		BoardVO vo = dao.boarDetail(Integer.parseInt(no));
		
		request.setAttribute("vo", vo);
	}
	
	public void boardUpdateData(HttpServletRequest request) {
		String no=request.getParameter("no");
		BoardDAO dao = BoardDAO.newInstance();
		BoardVO vo = dao.boardUpdateData(Integer.parseInt(no));
		
		request.setAttribute("vo", vo);
	}
	
	public void boardUpdate(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		String name=request.getParameter("name");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		String pwd=request.getParameter("pwd");
		
		BoardVO vo = new BoardVO();
		vo.setNo(Integer.parseInt(no));
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		
		BoardDAO dao = BoardDAO.newInstance();
		boolean bCheck = dao.boardUpdate(vo);
		
		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			if(bCheck==true) out.write("yes");
			else out.write("no");
			
			/*
			 * if(bCheck==true) { // 비밀번호 맞음 => 수정 => detail.jsp?no=
			 * response.sendRedirect("detail.jsp?no="+no);
			 * 
			 * } else { // 수정안됨 => history.back()
			 * response.setContentType("text/html; charset=UTF-8"); PrintWriter
			 * out=response.getWriter(); out.write("<script>");
			 * out.write("alert(\"비밀번호가 틀립니다!!\");"); out.write("history.back();");
			 * out.write("</script>"); }
			 */
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 답변 달기
	public void boardReply(HttpServletRequest request, HttpServletResponse response) {
		String pno = request.getParameter("pno");
		
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String pwd = request.getParameter("pwd");
		
		BoardVO vo = new BoardVO();
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		
		BoardDAO dao = BoardDAO.newInstance();
		dao.boardReply(Integer.parseInt(pno), vo);
		
		try {
			response.sendRedirect("list.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 삭제
	public void boardDelete(HttpServletRequest request, HttpServletResponse response) {
		String no = request.getParameter("no");
		String pwd = request.getParameter("pwd");
		
		BoardDAO dao = BoardDAO.newInstance();
		boolean bCheck = dao.boardDelete(Integer.parseInt(no), pwd);
		
		try {
			if(bCheck==true) {
				response.sendRedirect("list.jsp");
			}
			else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.write("<script>");
				out.write("alert(\"비밀번호가 틀립니다!!!!!\");");
				out.write("history.back();");
				out.write("</script>");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
