package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.net.*;
import java.io.*;

/*
1. 박스오피스 searchMainDailyBoxOffice.do
2. 실시간 예매율 searchMainRealTicket.do
3. 좌석점유율 searchMainDailySeatTicket.do
https://www.kobis.or.kr/kobis/business/main/
*/

@Controller
public class MovieModel {
	private String baseURL="https://www.kobis.or.kr/kobis/business/main/";
	private String[] movie= {
		"",
		"searchMainDailyBoxOffice.do",
		"searchMainRealTicket.do",
		"searchMainDailySeatTicket.do"
	};
	@RequestMapping("js/movie_list.do")
	public void movie_list(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		try {
			URI uri = new URI(baseURL+movie[Integer.parseInt(no)]);
			URL url = uri.toURL();
			// 사이트 연결
			HttpURLConnection conn=(HttpURLConnection)url.openConnection();
			String json="";
			if(conn!=null) { // 연결 성공
				BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				while(true) {
					String s=in.readLine(); // 한줄씩 읽어옴
					if(s==null) break;
					json+=s;
				}
				conn.disconnect();
			}
			//System.out.println(json);
			response.setContentType("text/plane;charset=UTF-8");
			PrintWriter out = response.getWriter();
			// 브라우저로 전송
			out.write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
