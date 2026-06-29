package com.sist.model;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.*;
import com.sist.vo.*;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.manager.UploadServlet;
@Controller
public class DataBoardModel {
	@RequestMapping("board/list.do")
	public String board_list(HttpServletRequest request, HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null) page="1";
		int curPage=Integer.parseInt(page);
		final int ROWSIZE=10;
		int start=(curPage*ROWSIZE)-ROWSIZE;
		List<DataBoardVO> list=DataBoardDAO.boardListData(start);
		int count=DataBoardDAO.boardRowCount();
		int totalPage=(int)(Math.ceil(count/(double)ROWSIZE)); 
		count=count-((curPage*ROWSIZE)-ROWSIZE);
		request.setAttribute("list", list);
		request.setAttribute("curPage", curPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("count", count);
		request.setAttribute("main_jsp", "../board/list.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("board/insert.do")
	public String board_insert(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("main_jsp", "../board/insert.jsp");
		return "../main/main.jsp";
	}
	
	// 어떤 값을 보낼지(request) / 누가 받을지(JSP) 결정
	// 데이터는 무조건 Oracle에서
	// .do? 뒤에 어떤 값을 붙여서 보낼지
	@RequestMapping("board/detail.do")
	public String board_detail(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		DataBoardVO vo=DataBoardDAO.boardDetailData(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../board/detail.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("board/download.do")
	public void board_download(HttpServletRequest request, HttpServletResponse response) {
		try {
			ServletContext context=request.getServletContext();
			request.setCharacterEncoding("UTF-8");
			String fn=request.getParameter("fn");
			String uploadPath=context.getRealPath("")+File.separator+"uploads";
			File f=new File(uploadPath+File.separator+fn);
			response.setHeader("Content-Disposition", "attachment;filename="+URLEncoder.encode(fn,"UTF-8"));
			response.setContentLength((int)f.length());
			BufferedInputStream bis=new BufferedInputStream(new FileInputStream(f));
			BufferedOutputStream bos=new BufferedOutputStream(response.getOutputStream());
			byte[] buffer=new byte[1024];
			int i=0;
			while((i=bis.read(buffer,0,1024))!=-1) {
				bos.write(buffer,0,i);
			}
			bis.close();
			bos.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
