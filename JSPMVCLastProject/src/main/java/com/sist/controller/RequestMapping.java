package com.sist.controller;

import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;

@Retention(RUNTIME)
@Target(METHOD)
public @interface RequestMapping {
	public String value(); // Annotation에 값 주입시 메소드 지정
	// Annotation은 기능이 없다 => 인덱스 역할(빠르게 찾기)
	// Annotation => if문 추가
	// 리플렉션을 이용하기 때문에 개발자가 클래스명/메소드명 마음대로 사용 가능
}
