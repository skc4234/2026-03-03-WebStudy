package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.*;
import com.sist.vo.*;
import com.sist.dao.*;

@Controller
public class FoodModel {
	@RequestMapping("food/list.do") // 중복되면 실행불가
	public String food_list(HttpServletRequest request, HttpServletResponse response) {
		/*
		 *    3가지 메소드 형식
		 *    1. void ==> Ajax 사용
		 *    2. String("redirect:") ==> sendRedirect() // request 없음
		 *    3. String ==> forward() // request 전달
		 */
		
		String page=request.getParameter("page");
		if(page==null) page="1";
		int curPage=Integer.parseInt(page);
		final int ROWSIZE=12;
		int start=(curPage*ROWSIZE)-ROWSIZE;
		List<FoodVO> list=FoodDAO.foodListData(start);
		int totalPage=FoodDAO.foodTotalPage();
		
		final int BLOCK=10;
		int startPage=((curPage-1)/BLOCK*BLOCK)+1;
		int endPage=((curPage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalPage) endPage=totalPage;
		
		request.setAttribute("list", list);
		request.setAttribute("curPage", curPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("main_jsp", "../food/list.jsp");
		return "../main/main.jsp";
	}
	
	// 쿠키 저장 => http는 html/header 한번에 둘 중 하나만 보낼수 있다 
	@RequestMapping("food/detail_before.do")
	public String food_detail_before(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		Cookie cookie=new Cookie("food_"+no, no);
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		
		// 브라우저로 전송
		response.addCookie(cookie);
		return "redirect:../food/detail.do?no="+no; // request 초기화 => no값을 같이 보내줌
	}
	
	@RequestMapping("food/detail.do")
	public String food_detail(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		FoodVO vo=FoodDAO.foodDetailData(Integer.parseInt(no));
		String[] addrs=vo.getAddress().split(" ");
		List<FoodVO> list=FoodDAO.foodRearData(addrs[1]+" "+addrs[2]);
		request.setAttribute("vo", vo);
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../food/detail.jsp");
		return "../main/main.jsp";
	}
}
