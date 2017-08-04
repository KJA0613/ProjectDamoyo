package com.bitschool.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitschool.dto.CompanyDTO;
import com.bitschool.dto.PlaceDTO;
import com.bitschool.service.IPlaceService;

// [메인] - 메인페이지 이동
@Controller
public class MainController {
	
	//----------------------------------------------- 설 정 -----------------------------------------------//
	
	// [로깅]
	private static final Logger logger = LoggerFactory.getLogger(MemberLoginController.class);
	
	// [주입] 서비스 인터페이스
	@Inject
	private IPlaceService placeService;	
	
	//---------------------------------------- 메 인 페 이 지  ----------------------------------------//

	// 01. 개인회원 메인 폼 (Connection URL)
	@RequestMapping(value = "/", method = { RequestMethod.POST, RequestMethod.GET })
	public String DamoyoMain(Model model) {
		String url = null;
		List<PlaceDTO> placeList = null;
		
		// 메인페이지에 모임 장소 최신날짜로 6개 가져오기
		placeList = placeService.getPlaceRecentInfo();
		
		model.addAttribute("plList", placeList);
		
		url = "DamoyoMain";
		
		return url;
	}
	
	
	// 02. 광고주회원 메인 폼 (Connection URL)
	@RequestMapping(value = "/PartnerMain", method = { RequestMethod.POST, RequestMethod.GET })
	public String PartnerMain(HttpSession session, Model model) {
		String url = null;
		
		CompanyDTO cdto = (CompanyDTO) session.getAttribute("cdto");
				
		model.addAttribute("cdto", cdto);
		
		url = "PartnerMain";
		
		return url;		
	}	
}