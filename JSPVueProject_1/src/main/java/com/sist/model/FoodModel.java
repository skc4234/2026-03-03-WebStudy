package com.sist.model;
import java.io.PrintWriter;
import java.util.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;

@Controller
public class FoodModel {
	@RequestMapping("food/list.do")
	public String food_list(HttpServletRequest request, HttpServletResponse response) {
		/*
		 * String page=request.getParameter("page"); if(page==null) page="1"; int
		 * curPage=Integer.parseInt(page); final int ROWSIZE=12; int
		 * start=(curPage*ROWSIZE)-ROWSIZE; List<FoodVO>
		 * list=FoodDAO.foodListData(start); int totalPage=FoodDAO.foodTotalPage();
		 * request.setAttribute("list", list); request.setAttribute("totalPage",
		 * totalPage);
		 */
		return "../food/list.jsp";
	}
	
	@RequestMapping("food/list_vue.do")
	public void food_list_vue(HttpServletRequest request, HttpServletResponse response) {
		try {
			String page=request.getParameter("page");
			int curPage=Integer.parseInt(page);
			final int ROWSIZE=12;
			int start=(curPage*ROWSIZE)-ROWSIZE;
			List<FoodVO> list=FoodDAO.foodListData(start);
			int totalPage=FoodDAO.foodTotalPage();
			
			final int BLOCK=10;
			int startPage=((curPage-1)/BLOCK*BLOCK)+1;
			int endPage=((curPage-1)/BLOCK*BLOCK)+BLOCK;
			if(endPage>totalPage) endPage=totalPage;
			
			Map map=new HashMap();
			map.put("startPage", startPage);
			map.put("endPage", endPage);
			map.put("curPage", curPage);
			map.put("totalPage", totalPage);
			map.put("food_list", list);
			
			// @RestController ==> 자동 jackson 사용 => JSON
			ObjectMapper mapper=new ObjectMapper();
			String json=mapper.writeValueAsString(map);
			
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("food/detail_vue.do")
	public void food_detail_vue(HttpServletRequest request, HttpServletResponse response) {
		try {
			String no=request.getParameter("no");
			FoodVO vo=FoodDAO.foodDetailData(Integer.parseInt(no));
			
			ObjectMapper mapper=new ObjectMapper();
			String json=mapper.writeValueAsString(vo);
			
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// Spring => @Controller: 화면 변경 / @RestController: JavaScript=>JSON
	//                                 @ResponseBody: 메소드
	
	@RequestMapping("food/find.do")
	public String food_find(HttpServletRequest request, HttpServletResponse response) {
		
		return "../food/find.jsp";
	}
	
	@RequestMapping("food/find_vue.do")
	public void food_find_vue(HttpServletRequest request, HttpServletResponse response) {
		// 1. 받을 변수 : page / column / 검색어
		String page=request.getParameter("page");
		String column=request.getParameter("column");
		String ss=request.getParameter("ss");
		int curPage=Integer.parseInt(page);
		int start=(curPage*12)-12;
		Map map=new HashMap();
		map.put("start", start);
		map.put("column", column);
		map.put("ss", ss);		
		
		List<FoodVO> list=FoodDAO.foodFindListData(map);
		int totalPage=FoodDAO.foodFindTotalPage(map);
		// JSP => 서버 => 새로운 JSP 출력(기존 JSP는 메모리 해제)
		// Vue / Ajax => 화면 변경 없이 그자리에서 처리(JSP 유지)
		
		final int BLOCK=10;
		int startPage=((curPage-1)/BLOCK*BLOCK)+1;
		int endPage=((curPage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalPage) endPage=totalPage;
		
		map=new HashMap();
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("curPage", curPage);
		map.put("totalPage", totalPage);
		map.put("food_list", list);

		try {
			// JSON 제작 => jackson: map을 자동으로 JSON으로 변환
			ObjectMapper mapper=new ObjectMapper();
			String json=mapper.writeValueAsString(map);
			
			// 브라우저 전송
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/*
	 * http://localhost/JSPVueProject_1/food/detail.do?no=31
	 * 
	 * => URI : /JSPVueProject_1/food/detail.do
	 */
	@RequestMapping("food/detail.do")
	public String food_detail(HttpServletRequest request, HttpServletResponse response) {
		return "../food/detail.jsp";
	}
}
