package com.sist.model;

import java.io.PrintWriter;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.*;
import com.sist.vo.*;
import com.sist.dao.*;
@Controller
public class MainModel {
	@RequestMapping("main/main.do")
	public String main_main(HttpServletRequest request, HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null) page="1";
		int curPage=Integer.parseInt(page);
		int start=(curPage*12)-12;
		List<FoodVO> list=FoodDAO.foodListData(start);
		int totalPage=FoodDAO.foodTotalPage();
		
		// 블록별 페이지 나누기
		final int BLOCK=10;
		int startPage=((curPage-1)/BLOCK*BLOCK)+1;
		int endPage=((curPage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalPage) endPage=totalPage;
		
		// 출력에 필요한 데이터 보내기
		request.setAttribute("list", list);
		request.setAttribute("curPage", curPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		
		// Cookie 읽기
				Cookie[] cookies=request.getCookies();
				List<FoodVO> cList=new ArrayList<FoodVO>();
				int j=0;
				if(cookies!=null) {
					for(int i=cookies.length-1; i>=0; i--) { // 최신순
						if(cookies[i].getName().startsWith("food_")) {
							if(j>=9) break;
							// getName: Key name   getValue() : 실제 값
							String cno=cookies[i].getValue();
							FoodVO cvo=FoodDAO.foodDetailData(Integer.parseInt(cno));
							cList.add(cvo);
							j++;
						}
					}
				}
		
		
		
		request.setAttribute("main_jsp", "../food/list.jsp");
		request.setAttribute("cList", cList);
		return "../main/main.jsp";
	}
	
	@RequestMapping("member/login.do")
	public void member_login(HttpServletRequest request, HttpServletResponse response) {
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		System.out.println();
		MemberVO vo=MemberDAO.memberLogin(id, pwd);
		if(vo.getMsg().equals("OK")) {
			// 정상수행(id,pwd 일치)
			// => session에 저장
			HttpSession session=request.getSession();
			session.setAttribute("id", vo.getId());
			session.setAttribute("name", vo.getName());
			
		}
		try {
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println(vo.getMsg());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("member/logout.do")
	public void member_logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		session.invalidate(); // session에 있는 모든 정보 메모리 해제
		// request => session/cookie 제어 가능
		try {
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("YES");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
