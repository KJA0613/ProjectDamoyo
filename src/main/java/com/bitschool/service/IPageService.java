package com.bitschool.service;

import java.util.ArrayList;

import com.bitschool.dto.PageVO;

public interface IPageService {
	
	public int getTotalBook(String query, String boardName);
	public PageVO getPageVO(int page,int amount);
	public ArrayList<String> makePageList(int page, int amount, String boardName, String query);
	
}
