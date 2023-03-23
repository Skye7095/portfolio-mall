package com.portfolio.mall.common;

import java.util.Random;

public class randomPW {
	
	public static String randomNum() {
		Random random = new Random();
		int createNum = 0;
		String ranNum = "";
		String resultNum = "";
		
		for(int i = 0; i < 6; i++) {
			createNum = random.nextInt(9);
			ranNum = Integer.toString(createNum);
			resultNum += ranNum;
		}
		
		return resultNum;
	}
}
