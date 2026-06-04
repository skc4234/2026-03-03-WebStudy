package com.sist.controller;

import java.util.*;
import java.io.*;

// XML 파일 읽기
public class ComponentScan {
	public static List<String> componetScan(String path, String pack) {
		List<String> list = new ArrayList<String>();
		try {
			path=path+File.separator+pack.replace(".", File.separator);
			// path = "...\WEB-INF", pack="com.sist.model"
			// => "...\WEB-INF\com\sist\model"
			File dir = new File(path);
			// 모든 클래스 받기
			File[] files=dir.listFiles();
			for(File f:files) {
				//System.out.println(f.getName());
				String name=f.getName();
				String ext=name.substring(name.lastIndexOf(".")+1);
				if(ext.equals("class")) { // 확장자가 class
					String clsName=name.substring(0,name.lastIndexOf("."));
					String packname=pack+"."+clsName;
					list.add(packname);
					//System.out.println(packname);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
