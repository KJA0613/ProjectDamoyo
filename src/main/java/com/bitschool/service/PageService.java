package com.bitschool.service;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitschool.dao.IPageDAO;
import com.bitschool.dto.PageVO;

@Service
public class PageService implements IPageService{
	
	@Inject
	private IPageDAO dao;
	
	@Override
	public int getTotalBook(String query, String boardName){
		int total = 0;
		try {
			total = dao.selectSearchCount(query, boardName);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return total;
	}
	
	@Override
	public PageVO getPageVO(int page,int amount){
		PageVO vo = new PageVO();
		vo.setStart(page*amount+1);
		vo.setEnd(page*amount+amount);
		return vo;
	}
	
		
	@Override
	public ArrayList<String> makePageList(int page, int amount, String boardName, String query){
		ArrayList<String> list = null;
		int pageCount = (int)Math.ceil(this.getTotalBook(query, boardName)/(double)amount);
		int pageUnit = page/amount;
		int endPage = (pageUnit*amount)+amount;
		endPage = endPage<=pageCount?endPage:pageCount;
		list = new ArrayList<String>();
		if(pageUnit!=0){
			list.add(" <a href='/board/listAll?page="+((pageUnit-1)*amount)+"&boardName="+boardName+"&query="+query+"'> prev </a> ");
		}
		for(int i=pageUnit*amount;i<endPage;i++){
			list.add(" <a href='/board/listAll?page="+(i)+"&boardName="+boardName+"&query="+query+"'>"+(i+1)+"</a> ");
		}
		//next
		if(endPage<pageCount){
			list.add(" <a href='/board/listAll?page="+(endPage)+"&boardName="+boardName+"&query="+query+"'> next </a> ");
		}
		return list;
	}
	
}




