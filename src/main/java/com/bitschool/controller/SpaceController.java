package com.bitschool.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("space")
@Controller
public class SpaceController {
	
	//----------------------------------------------- 설 정 -----------------------------------------------//
	
	// [로깅]
	private static final Logger logger = LoggerFactory.getLogger(MemberLoginController.class);
	
	
	
	// ---------------------------------------- [광고주 회원] 공 간 등 록 ----------------------------------------//
	
	// 00. 모임공간 등록 폼 (Connection URL)
	@RequestMapping(value = "/SpaceRegistForm",  method = { RequestMethod.POST, RequestMethod.GET })
	public String SpaceRegistForm() {
		String url = "space/SpaceRegistForm";
		
		return url;		
	}
	
	
	// 01. 모임공간 등록 
	@RequestMapping(value = "/SpaceRegist",  method = RequestMethod.POST)
	public String SpaceRegist() {
		String url = null;
		
		
		
		
		return url;
	}
	
	
	
}