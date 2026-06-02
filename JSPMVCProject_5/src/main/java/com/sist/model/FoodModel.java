package com.sist.model;

import java.util.List;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.FoodDAO;
import com.sist.vo.FoodVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// 메소드 찾기 => if 제거 => 
/*
 *  1. 클래스 검색 => Map => 구분자 찾기 => Annotaion
 *  2. 리플렉션 => 클래스명으로 
 * 	Controller : 이미 업체마다 개발되어 있다
 * 	ㄴSpring에서 제공, 포털사이트는 자체 Controller 사용
 * 
 *  MVC 구조
 *  	- Model(VO,DAO)
 *  	- View(JSP, Servlet)  
 */
@Controller
public class FoodModel {
	// 기능
	// 1. 목록
	@RequestMapping("main/main.do")
	public String food_list(HttpServletRequest request, HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null) page="1";
		int curPage = Integer.parseInt(page);
		int start = (curPage*12)-12;
		List<FoodVO> list = FoodDAO.foodListData(start);
		int totalPage = FoodDAO.foodTotalPage();

		// 브라우저(JSP)에 출력할 데이터 전송
		request.setAttribute("list", list);
		request.setAttribute("curPage", curPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("active", 1);
		// include 하는 JSP 확인
		request.setAttribute("main_jsp", "../food/list.jsp");
		// 실제 화면 출력
		return "../main/main.jsp";
	}
	
	// 2. 상세보기
	@RequestMapping("food/detail.do")
	public String food_detail(HttpServletRequest request, HttpServletResponse response) {
		String no = request.getParameter("no");
		FoodVO vo = FoodDAO.foodDetailData(Integer.parseInt(no));
		
		request.setAttribute("vo", vo);
		// include 하는 JSP 확인
		request.setAttribute("main_jsp", "../food/detail.jsp");
		// 실제 화면 출력
		return "../main/main.jsp";
	}
	
	// 3. 좋아요 / 찜하기 / 예약 / 추천 / 근처맛짐 / 길찾기 / 검색 등,,,
}
