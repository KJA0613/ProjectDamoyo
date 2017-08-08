package com.bitschool.helper;

import java.io.IOException;
import java.util.Collections;
import java.util.LinkedList;

import org.springframework.stereotype.Component;

@Component
public class Recommend {
	
	public LinkedList<Gathering> startReccomend() {
		RecommendHelper rc = new RecommendHelper();
		LinkedList<Gathering> list = new LinkedList<Gathering>();
		WordComparator wc = new WordComparator();
		boolean loginSession = false;
		
		try {
			if(!loginSession) {
				list = rc.fileReader("D:\\dev\\score.txt");
				Collections.sort(list, wc);
			} 
/*			else if(loginSession) {
				list = rc.fileReader("D:\\dev\\score.txt");
				for(int i=0;i<list.size();i++) {
					list.get(i).setScore(list.get(i).getScore()*3);
				}
				LinkedList<Gathering> tempList = new LinkedList<Gathering>();
				tempList = rc.fileReader("D:\\dev\\loginScore.txt");
				for(int i=0;i<tempList.size();i++) {
					tempList.get(i).setScore(tempList.get(i).getScore()*7);
				}
				LinkedList<Gathering> newList = new LinkedList<Gathering>();
				newList.addAll(list);
				newList.addAll(tempList);
				Collections.sort(newList, wc);
				}*/
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void test() {
		System.out.println("test");
	}
}
