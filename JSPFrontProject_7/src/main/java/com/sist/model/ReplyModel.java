package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/*
 *   댓글 / 게시판
 *   페이징 / 상세보기
 *   JSP / Spring / Spring-Boot
 *   오라클 / MySQL
 *   MyBatis / JPA
 *   Cookie / Session
 */
@Controller
public class ReplyModel {
	@RequestMapping("reply/insert.do")
	public String reply_insert(HttpServletRequest request, HttpServletResponse response) {
		String fno=request.getParameter("fno");
		String msg=request.getParameter("msg");
		HttpSession session=request.getSession();
		ReplyVO vo=new ReplyVO();
		vo.setFno(Integer.parseInt(fno));
		vo.setId((String)session.getAttribute("id"));
		vo.setName((String)session.getAttribute("name"));
		vo.setMsg(msg);
		ReplyDAO.replyInsert(vo);
		return "redirect:../food/detail.do?no="+fno;
	}
	
	// 실행 순서
	// 요청 => JSP => mapper.xml => DAO => Model => 확인(JSP)
	@RequestMapping("reply/update.do")
	public String reply_update(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		String fno=request.getParameter("fno");
		String msg=request.getParameter("msg");
		Map map=new HashMap();
		map.put("msg", msg);
		map.put("no", no);
		ReplyDAO.replyUpdate(map);
		
		return "redirect:../food/detail.do?no="+fno;
	}
	
	@RequestMapping("reply/delete.do")
	public String reply_delete(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		String fno=request.getParameter("fno");
		ReplyDAO.replyDelete(Integer.parseInt(no));
		
		return "redirect:../food/detail.do?no="+fno;
	}
}
