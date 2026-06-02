package com.sist.anno;
@Controller
public class MemberModel {
	@RequestMapping("member/login.do")
	public void login() {
		System.out.println("login call...");
	}
	@RequestMapping("member/join.do")
	public void join() {
		System.out.println("join call...");
	}
}
