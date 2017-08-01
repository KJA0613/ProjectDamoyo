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
	public String PlaceRegistForm(HttpSession session, Model model) {
		String url = null;
	
		// 광고주 > 세션에 저장된 정보 가져오기
		CompanyDTO cdto = (CompanyDTO) session.getAttribute("cdto");
		System.out.println("[TEST-세션에 저장된 정보] cdto : " + cdto);		
	
		model.addAttribute("cdto", cdto);
		
		url = "place/PlaceRegistForm";
		
		return url;		
	}
	
	
	
	// 01. 모임 공간 등록 
	@RequestMapping(value = "/PlaceRegist",  method = { RequestMethod.POST, RequestMethod.GET })
	public String PlaceRegist(PlaceDTO pl_dto, CompanyDTO cdto, HttpSession session, Model model) {
		String url = null;		

		// 광고주 > 세션에 저장된 정보 가져오기
		cdto = (CompanyDTO) session.getAttribute("cdto");
		//System.out.println(cdto);
		
		// 세션에 저장된 광고주 id 장소 등록 테이블에 담기
		pl_dto.setComId(cdto.getComId());
		
		boolean flag = placeService.PlaceRegist(pl_dto);
		System.out.println("[TEST] pl_dto : " + pl_dto);
		
		model.addAttribute("pl_dto", pl_dto);
		
		if(flag) {
			url = "redirect:/place/PlaceListAll";			// 전체 조회 (Reload) : Insert 후, 최신 정보로 업뎃		
		} else {
			url = "default";
		}

		return url;
	}
	
	
	
	// 02. 모임 전체 조회
	@RequestMapping(value = "/PlaceListAll",  method = { RequestMethod.POST, RequestMethod.GET })
	public String PlaceListAll(Model model) {
		String url = null;
		
		List<PlaceDTO> placeList = placeService.getPlaceListAll();		
		System.out.println("[TEST] 전체조회: " + placeList);
		
		model.addAttribute("placeList", placeList);
		
		url = "PartnerMain";
		
		return url;
	}
	
	
}