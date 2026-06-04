package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;

@Controller
public class MainModel {
	@RequestMapping("main/main.do")
	public static String main_main(HttpServletRequest request, HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null) page="1";
		
		// 1. 현재 페이지
		int curPage=Integer.parseInt(page);
		int start=(curPage*12)-12;
		
		// 2. 맛집 목록
		List<FoodVO> list=FoodDAO.foodListData(start);
		
		// 3. 총페이지
		int totalPage=FoodDAO.foodTotalPage();
		
		// 4. 블록별 페이지 처리
		final int BLOCK=10;
		int startPage=((curPage-1)/BLOCK*BLOCK)+1;
		int endPage=((curPage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalPage) endPage=totalPage;
		
		request.setAttribute("list", list);
		request.setAttribute("curPage", curPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		request.setAttribute("main_jsp", "../main/home.jsp");
		
		return "../main/main.jsp";
	}
}
