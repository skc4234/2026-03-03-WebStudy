package com.sist.model;

import java.util.List;

import com.sist.dao.*;

import jakarta.servlet.http.HttpServletRequest;

// 데이터 관리
// JSP => Model에서 관리
// => 유지보수, 확장성, 분업
// Model => DAO, VO 포함(자바로 코딩된것)
// MVC => Spring
public class MusicModel {
	public void musicListData(HttpServletRequest request) {
		// 1. 사용자 요청 정보 => page
		String strPage=request.getParameter("page");
		// 페이지 값이 없는 경우 => 첫 화면 실행시
		if(strPage==null) strPage="1";
		int curPage = Integer.parseInt(strPage);
		MusicDAO dao = MusicDAO.newInstance();
		List<MusicVO> list = dao.musicListData(curPage);
		int totalPage = dao.musicTotalPage();
		
		// list.jsp에서 출력할 데이터 전송
		request.setAttribute("curPage", curPage);
		request.setAttribute("list", list);
		request.setAttribute("totalPage", totalPage);
		
		// 자바를 최소화
	}
}
