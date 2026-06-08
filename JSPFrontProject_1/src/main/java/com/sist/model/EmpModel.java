package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import java.io.PrintWriter;
import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.dao.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class EmpModel {
	@RequestMapping("js/js_8.do")
	public void empListData(HttpServletRequest request, HttpServletResponse response) {
		List<EmpVO> list = EmpDAO.empListData();
		JSONArray arr=new JSONArray(); // List => []
		for(EmpVO vo : list) { // vo => {}
			// arr=[{"empno":7788, "ename":"allen", ...},{},...]
			JSONObject obj=new JSONObject();
			obj.put("empno", vo.getEmpno());
			obj.put("ename", vo.getEname());
			obj.put("job", vo.getJob());
			obj.put("dbday", vo.getDbday());
			obj.put("dname", vo.getDvo().getDname());
			obj.put("loc", vo.getDvo().getLoc());
			
			arr.add(obj);
		}
		
		// 브라우저로 전송
		try {
			response.setContentType("text/plain; charset=UTF-8");
			PrintWriter out=response.getWriter();
			//System.out.println(arr);
			out.write(arr.toJSONString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
