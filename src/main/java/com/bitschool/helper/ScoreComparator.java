package com.bitschool.helper;

import java.util.Comparator;

import com.bitschool.dto.BTempDTO;

public class ScoreComparator implements Comparator<BTempDTO>{

	@Override
	public int compare(BTempDTO o1, BTempDTO o2) {
		int num1 = o1.getRecomScore();
		int num2 = o2.getRecomScore();
		
		if(num1 > num2) {
			return -1;
		} else if(num1 < num2) {
			return 1;
		} else {
			return 0;
		}
	}
}
