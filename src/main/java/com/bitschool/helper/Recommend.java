package com.bitschool.helper;

import java.util.Collections;
import java.util.List;

import org.springframework.stereotype.Component;

import com.bitschool.dto.BTempDTO;
import com.bitschool.dto.CategoryDTO;
import com.bitschool.dto.PersonDTO;

@Component
public class Recommend {
	
	public List<BTempDTO> beforeLogin(List<BTempDTO> listAll) {
		List<BTempDTO> top10 = null;
		for(BTempDTO dto : listAll) {
			dto.setHitCnts((int)(Math.random()*1000+1));
			dto.setWishCnts((int)(Math.random()*30+1));
			dto.setNewBlogCnts((int)(Math.random()*10+1));
			// 나중엔 자동으로 들어가야 할 데이터
			int score = (int)(dto.getHitCnts() / 50.0 + dto.getWishCnts() / 5.0 + dto.getNewBlogCnts() / 3.0);
			dto.setRecomScore(score);
		}
		Collections.sort(listAll, new ScoreComparator());
		top10 = listAll.subList(0, 10);
		System.out.println("로그인 전입니다.");
		
		return listAll;
	}

	public List<BTempDTO> afterLogin(List<BTempDTO> listAll, CategoryDTO cdto) {
		List<BTempDTO> top10 = null;
		//int num = 3;
		for(BTempDTO dto : listAll) {
			if(dto.getGatherCategoryBot().equals(cdto.getCatBotOne())) {
				dto.setRecomScore(dto.getRecomScore()+10);
			} else if(dto.getGatherCategoryBot().equals(cdto.getCatBotTwo())) {
				dto.setRecomScore(dto.getRecomScore()+7);
			} else if(dto.getGatherCategoryBot().equals(cdto.getCatBotThr())) {
				dto.setRecomScore(dto.getRecomScore()+5);
			}
		}
		Collections.sort(listAll, new ScoreComparator());
		top10 = listAll.subList(0, 10);
		System.out.println("로그인 후입니다.");
		return top10;
	}
	
//	int calculScore() {
//		
//	}
//	
//	int 찜하기() {
//		
//	}
//	
//	int 조회수상승량() {
//		
//	}
	
	
//	public LinkedList<Gathering> startReccomend() {
//		RecommendHelper rc = new RecommendHelper();
//		LinkedList<Gathering> list = new LinkedList<Gathering>();
//		WordComparator wc = new WordComparator();
//		boolean loginSession = false;
//		
//		try {
//			if(!loginSession) {
//				list = rc.fileReader("D:\\dev\\score.txt");
//				Collections.sort(list, wc);
//			} 
//			else if(loginSession) {
//				list = rc.fileReader("D:\\dev\\score.txt");
//				for(int i=0;i<list.size();i++) {
//					list.get(i).setScore(list.get(i).getScore()*3);
//				}
//				LinkedList<Gathering> tempList = new LinkedList<Gathering>();
//				tempList = rc.fileReader("D:\\dev\\loginScore.txt");
//				for(int i=0;i<tempList.size();i++) {
//					tempList.get(i).setScore(tempList.get(i).getScore()*7);
//				}
//				LinkedList<Gathering> newList = new LinkedList<Gathering>();
//				newList.addAll(list);
//				newList.addAll(tempList);
//				Collections.sort(newList, wc);
//				}
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		return list;
//	}
}
