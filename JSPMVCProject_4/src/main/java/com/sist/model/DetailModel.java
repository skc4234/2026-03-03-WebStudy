package com.sist.model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.sist.dao.*;
import com.sist.vo.*;

public class DetailModel implements Model {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		// 1. 사용자가 보낸 값을 받는다
		String no = request.getParameter("no");
		
		// 2. DB 연동
		DataBoardVO vo = DataBoardDAO.dataBoardDetailData(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		return "detail.jsp";
	}

}
