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

// insert.jsp => <form action="/UploadServlet">
// JSP로 처리하려면 web.xml
// Servlet으로 처리
@WebServlet("/UploadServlet") // URL Mapping 결로 설정
@MultipartConfig(
	fileSizeThreshold = 1024*1024, // 1MB => 메모리에 저장하려는 파일의 최소 크기(임시저장장소)
	maxFileSize = 1024*1024*100, // 100MB => 업로드 허용 최대 크기
	maxRequestSize = 1024*1024*50 // 50MB => 요청에 포함된 모든 파일 및 데이터 전체 최대 크기
	// 파일 업로드 => Part1.file / Part2.text
) 
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIR="uploads"; // 업로드 시 저장될 파일경로
	// default doGet => 405(Method가 틀린 경우)
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uploadPath = getServletContext().getRealPath("")
							+File.separator+UPLOAD_DIR;
		// File.separator : 운영체제별로 경로 구분
		// Windows : \
		// Mac,Ubuntu : /
		// ServletContext application=getServletContext()
		File uploadDir=new File(uploadPath);
		if(!uploadDir.exists()) { // 폴더가 없을 경우 => 새로 생성
			uploadDir.mkdir(); // 폴더 생성
		}
		// 파일 저장
		/*
		 * Part1 : file
		 * Part2 : text
		 */
		try {
			// 1. 한글 깨짐 방지
			request.setCharacterEncoding("UTF-8");
			// 인코딩으로 넘어온 파일을 디코딩
			// %EC%9E%90%EB%B0%94 => 인코딩
			// 자바 => 디코딩
			// Windows11에서는 자동 디코딩
			
			// 2. 사용자가 보내준 데이터 받기 : name, subject, content,pwd
			String name = request.getParameter("name");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String pwd = request.getParameter("pwd");
			
			// DB에 전송
			DataBoardVO vo = new DataBoardVO();
			vo.setName(name);
			vo.setSubject(subject);
			vo.setContent(content);
			vo.setPwd(pwd);
			
			// <input type="file" name=upload> // name과 일치
			Part filePart = request.getPart("upload");
			if(filePart==null || filePart.getSize()==0) {
				// 업로드가 안된 상태
				vo.setFilename("");
				vo.setFilesize(0);
			}
			else { // 파일이 존재하면
				// 실제 보낸 파일명
				String fileName = filePart.getSubmittedFileName(); // 사용자가 보낸 파일명
				filePart.write(uploadPath+File.separator+fileName);
				
				// 업로드
				File f = new File(uploadPath+File.separator+fileName);				
				vo.setFilename(fileName);
				vo.setFilesize((int)f.length());
			}
			
			// DAO 연결
			DataBoardDAO.databoardInsert(vo);
			
			response.sendRedirect("databoard/list.do");
			// 이름 중복은 제외
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
