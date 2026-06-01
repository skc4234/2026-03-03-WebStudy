package com.sist.model;

import java.util.List;

import com.sist.dao.DataBoardDAO;
import com.sist.vo.DataBoardVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ListModel implements Model {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response) {
		String strPage=request.getParameter("page");
		if(strPage==null) strPage="1";
		int curPage = Integer.parseInt(strPage);
		int start = (curPage*10)-10;
		List<DataBoardVO> list = DataBoardDAO.databoardListData(start);
		int totalPage = DataBoardDAO.databoardTotalPage();
		// JSP에서 <% %> 사용 금지 => Model 클래스에서 처리, EL로 출력 
		// list.jsp에 값 보내기
		request.setAttribute("curPage", curPage); // ${curPage}
		request.setAttribute("totalPage", totalPage); // ${totalPage}
		request.setAttribute("list", list); // ${list}
		return "../databoard/list.jsp";
	}

}
