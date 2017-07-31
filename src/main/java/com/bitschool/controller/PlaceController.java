package com.bitschool.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitschool.dto.PlaceDTO;
import com.bitschool.service.IPlaceService;

@RequestMapping("place")
@Controller
public class PlaceController {
	
	//----------------------------------------------- 설 정 -----------------------------------------------//
	
	// [로깅]
	private static final Logger logger = LoggerFactory.getLogger(MemberLoginController.class);
	
	// [주입] 서비스 인터페이스
	@Inject
	private IPlaceService placeService;	
	
	
	// ---------------------------------------- [광고주 회원] 공 간 등 록 ----------------------------------------//
	
	// 00. 모임공간 등록 폼 (Connection URL)
	@RequestMapping(value = "/PlaceRegistForm",  method = { RequestMethod.POST, RequestMethod.GET })
	public String PlaceRegistForm() {
		String url = "place/PlaceRegistForm";
		
		return url;		
	}
	
	
	// 광고주 dto 넣기
	// 01. 모임공간 등록 
	@RequestMapping(value = "/PlaceRegist",  method = RequestMethod.POST)
	public String PlaceRegist(PlaceDTO pl_dto) {
		String url = null;
		
		boolean flag = placeService.PlaceRegist(pl_dto);
		
		if(flag) {
			url = "/PartnerMain";			
		}
		
		return url;
	}
	
	
	
}