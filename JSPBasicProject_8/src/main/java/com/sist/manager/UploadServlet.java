package com.sist.manager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

import com.sist.dao.DataBoardDAO;
import com.sist.vo.DataBoardVO;

// JSP+Servlet => Spring

@WebServlet("/UploadServlet")
@MultipartConfig(
	fileSizeThreshold = 1024*1024, // 1MB
	maxFileSize = 1024*1024*10, // 10MB
	maxRequestSize = 1024*1024*50 // 50MB
)
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIR="uploads";
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ServletContext 객체 = application 객체
		String uploadPath=getServletContext().getRealPath("")
				+File.separator+UPLOAD_DIR;
		// File.separator : / or \ 알아서 만들어줌
		// Windows=>\   Ubuntu=>/
		File uploadDir = new File(uploadPath);
		if(!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		/*
		 *  Part1 = file
		 *  Part2 = text
		 */
//		Part filePart = request.getPart("upload");
//		String fileName = filePart.getSubmittedFileName();
//		String filePath = uploadPath+File.separator+fileName;
//		filePart.write(filePath);
//		response.setContentType("text/html; charset=UTF-8");
//		response.getWriter().print("<h1>파일 업로드 완료</h1>");
		
		try {
			request.setCharacterEncoding("UTF-8");
			String name = request.getParameter("name");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String pwd = request.getParameter("pwd");
			DataBoardVO vo = new DataBoardVO();
			vo.setName(name);
			vo.setSubject(subject);
			vo.setContent(content);
			vo.setPwd(pwd);

			Part filePart = request.getPart("upload");
			if(filePart==null || filePart.getSize()==0) { // 파일 업로드 안했을때
				vo.setFilename("");
				vo.setFilesize(0);
			}
			else { // 파일 업로드 했을떄
				String fileName = filePart.getSubmittedFileName();
				// 업로드
				filePart.write(uploadPath+File.separator+fileName);
				vo.setFilename(fileName);
				File f = new File(uploadPath+File.separator+fileName);
				vo.setFilesize((int)f.length());
			}
			
			DataBoardDAO dao = DataBoardDAO.newInstance();
			dao.databoardInsert(vo);
			// .. 사용x => Servlet 파일은 루트(/)에 있기 때문에
			response.sendRedirect("main/main.jsp?mode=3");
			// 파일명 중복 처리, 파일 다운로드
			// 댓글 올리기
			// 결제 창
			// 회원가입 => 우편번호 검색 => Daum API
			// MV 구조 , MVC 구조, Spring 구조
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
