package com.sist.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
// 자바 / HTML 분리
// Model  View(JSP)
// <% %>가 아직 View에 남아있음 => Controller에서 처리 => MVC 구조
// JSP는 확장,재사용 불가 
public class DataVO {
	// 데이터마이닝 => 꼬꼬마(형태소 분석) => 라이브러리
	private String word;
	private int count;
}
