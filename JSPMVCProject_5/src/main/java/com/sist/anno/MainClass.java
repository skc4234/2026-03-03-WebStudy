package com.sist.anno;

import java.util.*;
public class MainClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scan = new Scanner(System.in);
		System.out.print("메뉴: 맛집(1), 상품(2), 댓글(3), 회원(4)");
		int menu = scan.nextInt();
		if(menu==1) {
			System.out.print("기능 선택: 목록(1), 상세보기(2):");
			FoodModel model = new FoodModel();
			int m=scan.nextInt();
			if(m==1) {
				model.food_list();
			}
			else if(m==2) {
				model.food_detail();
			}
		}
		else if(menu==2) {
			
		}
		else if(menu==3) {
			
		}
		else if(menu==4) {
			
		}
		else {
			
		}
	}

}
