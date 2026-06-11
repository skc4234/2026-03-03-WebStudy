package com.sist.model;

import java.io.PrintWriter;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.FoodDAO;
import com.sist.vo.FoodVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/*
 *   MVC
 *   	- 브라우저에서 사용자 요청 : URL
 *   	- Controller가 요청값을 받아서 해당 메소드를 수행
 *   		- 자동 호출: Annotaion을 이용해서 자동 호출
 *   		- @RequestMapping => invoke()
 *    		- 매개변수: request, response
 *   	- 완료된 내용(출력)을 JSP로 전송
 *   
 *   	==> SpringFramework
 *   	@RequestMapping - @GetMapping, @PostMapping
 *   	@Autowried / @Before,@After
 *   	@Component / @Repository / @Service
 */

@Controller
public class FoodModel {
	@RequestMapping("food/list.do")
	public String food_list(HttpServletRequest request, HttpServletResponse response) {
		// 비즈니스 로직
		// Model : Model / VO / DAO / Service ==> Java 클래스를 모두 Model로 분류
		/*
		 *    View : JSP => 퍼블리셔+Front
		 * 	  로직  : Model(Java) => Back
		 *    DB   : Mapper(XML) => DBA
		 */
		// 1. 사용자 요청 받기
		String page=request.getParameter("page");
		if(page==null) page="1";
		
		// 2. 현재 페이지 저장
		int curPage=Integer.parseInt(page);
		int start=(curPage*12)-12;
		
		// 3. DAO에서 목록 가져오기
		List<FoodVO> list=FoodDAO.foodListData(start);
		
		// 4. DAO에서 총페이지 가져오기
		int totalPage=FoodDAO.foodTotalPage();
		
		// 5. 블록별 페이지
		final int BLOCK=10;
		int startPage=((curPage-1)/BLOCK*BLOCK)+1;
		int endPage=((curPage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalPage) endPage=totalPage;
		
		// 6. 결과값 넘겨주기
		request.setAttribute("list", list);
		request.setAttribute("curPage", curPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);	
		
		return "../food/list.jsp";
	}
	
	@RequestMapping("food/list_ajax.do")
	public void food_list_ajax(HttpServletRequest request, HttpServletResponse response) {
		// 1. 사용자 요청 받기
		String page=request.getParameter("page");
		if(page==null) page="1";
		
		// 2. 현재 페이지 저장
		int curPage=Integer.parseInt(page);
		int start=(curPage*12)-12;
		
		// 3. DAO에서 목록 가져오기
		List<FoodVO> list=FoodDAO.foodListData(start);
		
		// 4. DAO에서 총페이지 가져오기
		int totalPage=FoodDAO.foodTotalPage();
				
		// 5. 블록별 페이지
		final int BLOCK=10;
		int startPage=((curPage-1)/BLOCK*BLOCK)+1;
		int endPage=((curPage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalPage) endPage=totalPage;
		
		// 6. 
		int i=0;
		JSONArray arr=new JSONArray(); // List를 JSON으로 변환
		for(FoodVO vo: list) {
			// vo와 일치 => JSONObject {} => RestFul
			JSONObject obj=new JSONObject();
			obj.put("no", vo.getNo());
			obj.put("poster", vo.getPoster());
			obj.put("name", vo.getName());
			if(i==0) { // 첫번째 배열에만 값을 넣는다
				obj.put("curPage", curPage);
				obj.put("totalPage", totalPage);
				obj.put("startPage", startPage);
				obj.put("endPage", endPage);
			}
			arr.add(obj);
			i++;
		}
		
		try {
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(arr.toJSONString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("food/detail.do") // RequestMapping URI이 중복되면 안된다
	public String food_detail(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		FoodVO vo=FoodDAO.foodDetailData(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		String[] address=vo.getAddress().split(" ");
		request.setAttribute("addr", address[0]+" "+address[1]+" "+address[2]);
		request.setAttribute("rcount", 0);
		//System.out.println(address[2]);
		return "../food/detail.jsp";
	}
}
