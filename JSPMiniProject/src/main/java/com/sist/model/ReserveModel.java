package com.sist.model;

import com.sist.controller.Controller;

import com.sist.controller.RequestMapping;
import com.sist.dao.FoodDAO;
import com.sist.vo.FoodVO;

/*
 *   승인: 관리자
 *   ------------
 *   승인 버튼 => 해당 유저에게 알림(stromp)
 *   				- 자바스크립트 라이브러리(Socket)
 *   				- 없는 경우: DB에 저장 => 로그인시 알림
 *   => CRUD: 데이터베이스 연동
 *   	- Cookie/Session 저장
 *   	- MVC 구조
 *   	- MyBatis 사용법
 *   	- 전반적인 Web 흐름: Request/Response, 로그인/예약 등 실패 처리
 *   	- Ajax/JQuery 사용법
 *   	==> JSP(JSTL/EL)
 */
import java.util.*;
import java.text.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@Controller
public class ReserveModel {
	@RequestMapping("reserve/diary.do")
	public String reserve_diary(HttpServletRequest request, HttpServletResponse response) {
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-M-d");
		// MM: 01,02,..  M: 1,2,..
		// MM 사용시 8진법 문제 => 오류
		String strYear=request.getParameter("year");
		String strMonth=request.getParameter("month");
		
		String today=sdf.format(date);
		StringTokenizer st=new StringTokenizer(today,"-");
		String sYear=st.nextToken();
		String sMonth=st.nextToken();
		String sDay=st.nextToken();
		
		if(strYear==null) strYear=sYear;
		if(strMonth==null) strMonth=sMonth;
		
		int year=Integer.parseInt(strYear);
		int month=Integer.parseInt(strMonth);
		int day=Integer.parseInt(sDay);
		
		Calendar cal=Calendar.getInstance();
		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, month-1); // month는 0부터 시작
		cal.set(Calendar.DATE, 1);
		
		int week=cal.get(Calendar.DAY_OF_WEEK);
		week=week-1; // week는 1부터 시작
		
		int lastDay=cal.getActualMaximum(cal.DATE); // for문 사용시 필요
		
		// 데이터 전송
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("today", day);
		request.setAttribute("week", week);
		request.setAttribute("lastday", lastDay);
		String[] strWeek={"일","월","화","수","목","금","토"};
		request.setAttribute("strWeek", strWeek);

		request.setAttribute("sYear", sYear);
		request.setAttribute("sMonth", sMonth);
		
		return "../reserve/diary.jsp";
		//request.setAttribute("main_jsp", "../reserve/diary.jsp");
		//return "../main/main.jsp";
	}
	
	@RequestMapping("reserve/reserve_food.do")
	public String reserve_food(HttpServletRequest request, HttpServletResponse response) {
		String type=request.getParameter("type");
		//System.out.println(type);
		List<FoodVO> list=FoodDAO.foodCategoryData(type);
		//System.out.println(list);
		request.setAttribute("list", list);
		return "../reserve/reserve_food.jsp";
	}
	
	@RequestMapping("reserve/reserve_time.do")
	public String reserve_time(HttpServletRequest request, HttpServletResponse response) {
		String time=TimeConfig.reserveTime();
		request.setAttribute("time", time);
		return "../reserve/reserve_time.jsp";
	}
	
	@RequestMapping("reserve/reserve_inwon.do")
	public String reserve_inwon(HttpServletRequest request, HttpServletResponse response) {
		
		return "../reserve/reserve_inwon.jsp";
	}
	
	
	
	
	
	
	/*
	 * public static void main(String[] args) { reserveTime(); }
	 */
}
