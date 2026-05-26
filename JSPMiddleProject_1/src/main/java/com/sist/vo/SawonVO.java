package com.sist.vo;

import lombok.Data;

// <%= %> 사용 x => ${} 대체
// 1. Spring/SpringBoot => MVC
@Data
public class SawonVO {
	private int sabun;
	private String name, dept, job, loc;
}
