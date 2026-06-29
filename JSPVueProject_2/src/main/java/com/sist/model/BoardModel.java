package com.sist.model;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;

import java.io.PrintWriter;
import java.util.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class BoardModel {
	// 화면만 이동 => Router
	// 실제 처리 => Front
	@RequestMapping("board/list.do")
	public String board_list(HttpServletRequest request, HttpServletResponse response) {
		
		return "../board/list.jsp";
	}
	
	@RequestMapping("board/list_vue.do")
	public void board_list_vue(HttpServletRequest request, HttpServletResponse response) {
		String page=request.getParameter("page");
		int curPage=Integer.parseInt(page);
		int start=(curPage*10)-10;
		List<BoardVO> list=BoardDAO.boardListData(start);
		int count=BoardDAO.boardRowCount();
		int totalPage=(int)(Math.ceil(count/10.0));
		count=count-start;
		Map map=new HashMap();
		map.put("curPage", curPage);
		map.put("count", count);
		map.put("list", list);
		map.put("totalPage", totalPage);
		
		try {
			ObjectMapper mapper=new ObjectMapper();
			String json=mapper.writeValueAsString(map);
			
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("board/insert.do")
	public String board_insert(HttpServletRequest request, HttpServletResponse response) {
		// 화면 이동
		return "../board/insert.jsp";
	}
	
	@RequestMapping("board/insert_ok.do")
	public void board_insert_ok(HttpServletRequest request, HttpServletResponse response) {
		String name=request.getParameter("name");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		String pwd=request.getParameter("pwd");
		
		BoardVO vo=new BoardVO();
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		
		BoardDAO.boardInsert(vo);
	}
	
	@RequestMapping("board/detail.do")
	public String board_detail(HttpServletRequest request, HttpServletResponse response) {
		
		return "../board/detail.jsp";
	}
	
	@RequestMapping("board/detail_vue.do")
	public void board_detail_vue(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		BoardVO vo=BoardDAO.boardDetailData(Integer.parseInt(no));
		
		try {
			ObjectMapper mapper=new ObjectMapper();
			String json=mapper.writeValueAsString(vo);
			
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("board/delete_vue.do")
	public void board_delete_vue(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		String pwd=request.getParameter("pwd");
		boolean bCheck = BoardDAO.boardDelete(Integer.parseInt(no),pwd);
		String msg="";
		if(bCheck==true) msg="yes";
		else msg="no";
		try {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("board/update.do")
	public String board_update(HttpServletRequest request, HttpServletResponse response) {
		
		return "../board/update.jsp";
	}
	
	@RequestMapping("board/update_vue.do")
	public void board_update_vue(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		BoardVO vo=BoardDAO.boardUpdateData(Integer.parseInt(no));
		// then(response=>
		try {
			// JSON 만들기(jackson)
			ObjectMapper mapper=new ObjectMapper();
			String json=mapper.writeValueAsString(vo);
			
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("board/update_ok.do")
	public void board_update_ok(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		String name=request.getParameter("name");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		String pwd=request.getParameter("pwd");
		
		BoardVO vo=new BoardVO();
		vo.setNo(Integer.parseInt(no));
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		
		boolean bCheck=BoardDAO.boardUpdate(vo);
		String msg="";
		if(bCheck==true) msg="yes";
		else msg="no";
		
		try {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
