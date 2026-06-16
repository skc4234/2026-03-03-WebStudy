package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.sist.vo.*;
import com.sist.dao.*;

import java.io.PrintWriter;
import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

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
	// Vue(ThymeLeaf) / Jquery(JSP) ==> CDN 방식
	// React(단독) => SpringBoot+NodeJS
	

	@RequestMapping("food/find.do")
	public String food_find(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../food/find.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("food/find_ajax.do")
	public void food_find_ajax(HttpServletRequest request, HttpServletResponse response) {
		String fd=request.getParameter("fd"); // <input type="text">
		//if(fd==null) fd="마포";
		String col=request.getParameter("col"); // <select><option> name,address,type
		//if(col==null) col="address";
		String page=request.getParameter("page");
		if(page==null) page="1";
		int curPage=Integer.parseInt(page);
		int start=(curPage*12)-12;
		Map map=new HashMap();
		map.put("column", col);
		map.put("fd", fd);
		map.put("start", start);
		List<FoodVO> list=FoodDAO.foodFindData(map);
		int totalPage=FoodDAO.foodFindTotalPage(map);
		final int BLOCK=10;
		int startPage=((curPage-1)/BLOCK*BLOCK)+1;
		int endPage=((curPage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalPage) endPage=totalPage;
		
		// JSON으로 변경 후 전송
		try {
			// List => JSONArray / VO => JSONObject
			JSONArray arr=new JSONArray(); // [{},{},{},...]
			int j=0;
			for(FoodVO vo: list) {
				JSONObject obj=new JSONObject();
				obj.put("no", vo.getNo());
				obj.put("name", vo.getName());
				obj.put("poster", vo.getPoster());
				obj.put("address", vo.getAddress());
				
				if(j==0) { // 한번만 수행
					obj.put("curPage", curPage);
					obj.put("totalPage", totalPage);
					obj.put("startPage", startPage);
					obj.put("endPage", endPage);
				}
				arr.add(obj);
				j++;
			}
			
			// arr에 있는 데이터를 Ajax(JavaScript)로 보냄 ==> RestFul
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(arr.toJSONString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	@RequestMapping("food/movie.do")
	public String food_movie(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../food/movie.jsp");
		return "../main/main.jsp";
	}
}
