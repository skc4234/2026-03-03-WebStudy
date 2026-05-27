package com.sist.model;

import jakarta.servlet.http.HttpServletRequest;
import java.util.*;
import com.sist.dao.*;
public class FoodModel {
	public void foodListData(HttpServletRequest request) {
		// 1. 사용자가 요청한 데이터를 받는다
		String strPage = request.getParameter("page");
		if(strPage==null) strPage="1";
		int curPage = Integer.parseInt(strPage);
		// 2. 받은 데이터를 DAO 메소드 매개변수 첨부
		FoodDAO dao = FoodDAO.newInstance();
		List<FoodVO> list = dao.foodListData(curPage);
		// 3. 데이터 읽기 : 화면 읽기
		int totalPage = dao.foodTotalPage();
		
		// 블록별
		final int BLOCK=10;
		int startPage = ((curPage-1)/BLOCK*BLOCK)+1;
		int endPage = ((curPage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalPage) endPage=totalPage;
		
		// 출력에 필요한 데이터를 JSP로 보내준다
		// request가 매개변수로 들어오면 JSP가 가지고 있는 request에 값을 첨부해서 보낼 수 있다
		// Call By Reference : 주소를 넘겨주기 / 주소에 값을 채우는 방법
		// class / 배열 등
		// JSP에서 request.getAttribute()로 가져옴 => ${}으로 출력 가능
		request.setAttribute("curPage", curPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("list", list);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
	}
}
