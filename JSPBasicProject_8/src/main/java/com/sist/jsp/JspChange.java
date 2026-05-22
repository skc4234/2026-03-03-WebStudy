package com.sist.jsp;

// 최대한 jsp에서 java소스를 줄인다
public class JspChange {
	private static String[] jsp = {
		"",
		"../main/home.jsp",
		"../food/detail.jsp",
		"../databoard/list.jsp",
		"../databoard/detail.jsp",
		"../databoard/insert.jsp",
		"../databoard/update.jsp",
		"../databoard/delete.jsp"
	};
	public static String change(int mode) {
		return jsp[mode];
	}
}
