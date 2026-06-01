package com.sist.model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// 인터페이스 => 서로다른 클래스를 하나로 묶어서 처리 => 클래스만 바꿔서 동일 메소드 호출
// Spring에서 주로 사용하는 방식

public interface Model {
	// 요청, 처리 기능만
	public String requestHandler(HttpServletRequest request, HttpServletResponse response);
	// Model에 요청 처리 => 요청 내용 받기(request), 응답(response)
}
