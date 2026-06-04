package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.FoodDAO;
import com.sist.vo.FoodVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// .do => Controller => Model이 받음
@Controller
public class FoodModel {
	@RequestMapping("food/detail.do")
	public static String food_detail(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		FoodVO vo=FoodDAO.foodDetailData(Integer.parseInt(no));
		
		request.setAttribute("vo", vo);
		
		request.setAttribute("main_jsp", "../food/detail.jsp");
		return "../main/main.jsp";
	}
}
