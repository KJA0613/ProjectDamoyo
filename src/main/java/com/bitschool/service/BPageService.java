package com.bitschool.service;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitschool.dao.BPageDAO;
import com.bitschool.dto.BPageVO;
import com.bitschool.dto.BSearchVO;

@Service
public class BPageService{
	
	@Inject
	private BPageDAO dao;
	
	public int getTotalBook(){
		int total = 0;
		try {
			total = dao.selectCountAll();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return total;
	}
	public BPageVO getPageVO(int page,int amount){
		BPageVO vo = new BPageVO();
		vo.setStart(page*amount+1);
		vo.setEnd(page*amount+amount);
		return vo;
	}
	
	public int getSearchCount(BSearchVO vo){
		int total = 0;
		try {
			total = dao.selectSearchCount(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return total;
	}
	public ArrayList<String> makeSerachList(int page,int amount,BSearchVO vo){
		ArrayList<String> list = null;
		//System.out.println(amount+"--->"+this.getSearchCount(vo));
		int pageCount = (int)Math.ceil(this.getSearchCount(vo)/(double)amount);
		int pageUnit = page/amount;
		int endPage = (pageUnit*amount)+amount;
		endPage = endPage<=pageCount?endPage:pageCount;
		list = new ArrayList<String>();
		if(pageUnit!=0){
			list.add(" <a href='/blog/board/search?page="+((pageUnit-1)*amount)+"&query="+vo.getUTFQuery()+"'> prev </a> ");
		}
		for(int i=pageUnit*amount;i<endPage;i++){
			list.add(" <a href='/blog/board/search?page="+(i)+"&query="+vo.getUTFQuery()+"'>"+(i+1)+"</a> ");
		}
		//next
		if(endPage<pageCount){
			list.add(" <a href='/blog/board/search?page="+(endPage)+"&query="+vo.getUTFQuery()+"'> next </a> ");
		}
		return list;
	}
	
	public ArrayList<String> makePageList(int page,int amount){
		ArrayList<String> list = null;
		int pageCount = (int)Math.ceil(this.getTotalBook()/(double)amount);
		int pageUnit = page/amount;
		int endPage = (pageUnit*amount)+amount;
		endPage = endPage<=pageCount?endPage:pageCount;
		list = new ArrayList<String>();
		if(pageUnit!=0){
			list.add(" <a href='/blog/board/listAll?page="+((pageUnit-1)*amount)+"'> prev </a> ");
		}
		for(int i=pageUnit*amount;i<endPage;i++){
			list.add(" <a href='/blog/board/listAll?page="+(i)+"'>"+(i+1)+"</a> ");
		}
		//next
		if(endPage<pageCount){
			list.add(" <a href='/blog/board/listAll?page="+(endPage)+"'> next </a> ");
		}
		return list;
	}
	
}




