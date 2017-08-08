package com.bitschool.helper;

import java.util.Comparator;

public class WordComparator implements Comparator<Gathering>{

	@Override
	public int compare(Gathering o1, Gathering o2) {
		int num1 = o1.getScore();
		int num2 = o2.getScore();
		
		if(num1 > num2) {
			return -1;
		} else if(num1 < num2) {
			return 1;
		} else {
			return 0;
		}
	}
}
