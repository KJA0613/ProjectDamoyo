package com.bitschool.dto;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class BSearchVO {
	private String query;
	private BPageVO vo;
	private String utfQuery;
	
	public String getQuery() {
		return query;
	}
	public void setQuery(String query) {
		this.query = query;
	}
	public BPageVO getVo() {
		return vo;
	}
	public void setVo(BPageVO vo) {
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
	public void setUtfQuery(String utfQuery) {
		this.utfQuery = utfQuery;
	}
	
	
}
