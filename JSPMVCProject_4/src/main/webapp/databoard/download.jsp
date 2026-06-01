<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.net.*, java.io.*"%>
<%
	try {
		String fn = request.getParameter("fn");
		String path = application.getRealPath("")+File.separator+"uploads"
										+File.separator+fn;
		// File.seperator => AWS / Ubuntu 경로(/,\) 자동 변환
		File file = new File(path);
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
		BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
		// response.getOutputStream() => 클라이언트 브라우저(폴더)
		
		// 다운로드창 생성을 위해 파일명, 파일크기를 미리 보냄
		// 1. 파일명 => 파일 다이얼로그
		response.setHeader("Content-Disposition", "attachment;filename="+URLEncoder.encode(fn, "UTF-8"));

		// 2. 프로그래스바 => 파일 크기
		response.setContentLength((int)file.length());
		
		// 3. 실제 파일 데이터 전송
		int i=0;
		byte[] buffer = new byte[1024];
		while((i=bis.read())!=-1) {
			bos.write(buffer,0,i);
		}
		bis.close();
		bos.close();
		
	} catch(Exception e) {
		e.printStackTrace();
	}
%>