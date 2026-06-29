package com.sist.model;
// 응집성이 높게 => 하나의 기능에 관련된 모든 변수,메소드 등을 모아서 재사용
// 결합성은 낮게 => 다른 클래스 수정 시 영향을 낮게(의존성)
import java.util.*;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.service.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@Controller
public class GoodsModel {
	private GoodsService service=new GoodsServiceImpl();
	
	@RequestMapping("goods/list.do")
	public String goods_list(HttpServletRequest request, HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null) page="1";
		int curPage=Integer.parseInt(page);
		int start=(curPage*12)-12; // OFFSET=>0번, rownum=>1번
		List<GoodsVO> list=service.goodsListData(start);
		int totalPage=service.goodsTotalPage();
		
		final int BLOCK=10;
		int startPage=((curPage-1)/BLOCK*BLOCK)+1;
		int endPage=((curPage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalPage) endPage=totalPage;
		
		// class A a=new A(); => let a={} => JSON
		request.setAttribute("list", list); // JavaScript: [{},{},...] => RestFul
		request.setAttribute("curPage", curPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		return "../goods/list.jsp";
	}
}
