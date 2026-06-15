package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.sist.vo.*;
import com.sist.dao.*;
import java.util.*;

@Controller
public class FoodModel {
	// response가 동시에 두가지 일을 수행할 수 없음
	// ==> 1. 쿠키 응답  2. html 응답
	@RequestMapping("food/detail_before.do")
	public String food_detail_before(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		Cookie cookie=new Cookie("food_"+no, no);
		cookie.setMaxAge(60*60*24);
		cookie.setPath("/");
		response.addCookie(cookie); // 방문기록 저장
		return "redirect:../food/detail.do?no="+no; // request 초기화
		// sendRedirect()
	}
	
	// Cookie => 브라우저에 저장(보안 취약)
	// 	- 문자열만 저장할 수 있다
	// 	- 자동 로그인/장바구니/최근 방문 페이지
	
	// Session => 서버에 저장(보안성이 높다)
	// 	- Object 단위로 저장할 수 있다
	// 	- 접속자의 일부 정보를 저장할 때
	// Cookie와 Session은 Request를 이용하여 생성
	// Cookie[] cookies = request.getCookies()
	// HttpSession session=request.getSession()
	@RequestMapping("food/detail.do")
	public String food_detail(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		FoodVO vo=FoodDAO.foodDetailData(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../food/detail.jsp");
		
		List<ReplyVO> rList=ReplyDAO.replyListData(Integer.parseInt(no));
		request.setAttribute("rList", rList);
		request.setAttribute("rcount", rList.size());
		
		return "../main/main.jsp"; // forward : request 유지
	}
}
