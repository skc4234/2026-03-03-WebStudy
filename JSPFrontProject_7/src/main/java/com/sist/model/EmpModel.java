package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class EmpModel {
	@RequestMapping("emp/if_where.do")
	public String emp_if(HttpServletRequest request,HttpServletResponse response) {
		EmpVO vo=new EmpVO();
		vo.setEname("S");
		vo.setDeptno(0);
		vo.setEmpno(0);
		List<EmpVO> list=EmpDAO.empFindData(vo);
		request.setAttribute("list", list);
		return "../emp/if_where.jsp";
	}
	
	@RequestMapping("emp/if_where2.do")
	public String emp_bind(HttpServletRequest request,HttpServletResponse response) {
		String ename="ER";
		List<EmpVO> list=EmpDAO.empFindData2(ename);
		request.setAttribute("list", list);
		return "../emp/if_where.jsp";
	}
	
	@RequestMapping("emp/if_where3.do")
	public String emp_choose(HttpServletRequest request,HttpServletResponse response) {
		String job="MANAGER";
		List<EmpVO> list=EmpDAO.empFindData3(job);
		request.setAttribute("list", list);
		return "../emp/if_where.jsp";
	}
	
	/*
	 *   sql: 중복된 문장 모으기
	 *   
	 */
	@RequestMapping("emp/if_where4.do")
	public String emp_trim(HttpServletRequest request,HttpServletResponse response) {
		EmpVO vo=new EmpVO();
		
		vo.setEname(null);
		vo.setJob("PR");
		 
		List<EmpVO> list=EmpDAO.empFindData5(vo);
		request.setAttribute("list", list);
		return "../emp/if_where.jsp";
	}
	
	@RequestMapping("emp/list_ok.do")
	public String emp_list_ok(HttpServletRequest request,HttpServletResponse response) {
		String[] data=request.getParameterValues("data");
		Map map=new HashMap();
		map.put("data", data);
		List<EmpVO> list=EmpDAO.empFindData4(map);
		request.setAttribute("list", list);
		return "../emp/list_ok.jsp";
	}
	
	@RequestMapping("emp/list.do")
	public String emp_list(HttpServletRequest request,HttpServletResponse response) {
		List<EmpVO> list=EmpDAO.empGetData();
		request.setAttribute("list", list);
		return "../emp/list.jsp";
	}
}
