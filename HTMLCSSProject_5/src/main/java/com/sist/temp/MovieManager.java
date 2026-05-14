package com.sist.temp;

import java.util.*;
import java.net.*;
import java.io.*;
public class MovieManager {
	private String[] urls = {
		"",
		"searchMainDailyBoxOffice.do",
		"searchMainRealTicket.do",
		"searchMainDailySeatTicket.do"
	};
	private static final String BASEURL="https://www.kobis.or.kr/kobis/business/main/";
	public String movieListData(int no) {
		String data="";
		try {
			URI uri = new URI(BASEURL+urls[no]);
			URL url = uri.toURL();
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			if(conn!=null) {
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				while(true) {
					String s = br.readLine();
					if(s==null) break;
					data+=s;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return data;
	}
	
	public static void main(String[] args) {
		MovieManager mv = new MovieManager();
		String s = mv.movieListData(1);
		System.out.println(s);
	}
}
