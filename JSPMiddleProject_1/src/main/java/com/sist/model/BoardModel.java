package com.sist.model;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
import jakarta.servlet.http.*;
public class BoardModel {
	public void boardListData(HttpServletRequest request) {
		// 1. 사용자 요청 정보 => page
		String strPage = request.getParameter("page");
		if(strPage==null) strPage="1";
		// 현재 페이지 지정
		int curPage = Integer.parseInt(strPage);
		BoardDAO dao = BoardDAO.newInstance();
		List<BoardVO> list = dao.boardListData(curPage);
		int totalPage = dao.boardTotalPage();
		
		// JSP로 출력에 필요한 데이터를 전송
		request.setAttribute("list",list); // ${} 바로 사용 가능
		request.setAttribute("curPage", curPage);
		request.setAttribute("totalPage", totalPage);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(new Date());
		request.setAttribute("today", today);
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
	
	// 상세보기
	public void boardDetailData(HttpServletRequest request) {
		String no = request.getParameter("no");
		BoardDAO dao = BoardDAO.newInstance();
		BoardVO vo = dao.boardDetailData(Integer.parseInt(no));
		request.setAttribute("vo", vo);
	}
}
