package com.bitschool.dto;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class SearchVO {
	private int type;
	private String query;
	private PageVO vo;
	private String utfQuery;
	
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getQuery() {
		return query;
	}
	public void setQuery(String query) {
		this.query = query;
	}
	public PageVO getVo() {
		return vo;
	}
	public void setVo(PageVO vo) {
		this.vo = vo;
	}
	
	public String getUTFQuery(){
		String temp = null;
		try {
			temp = URLEncoder.encode(query,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return temp;
	}
	public String getUtfQuery() {
		try {
			utfQuery = URLEncoder.encode(query,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return utfQuery;
	}
	
	
}
