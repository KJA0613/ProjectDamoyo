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

import com.bitschool.dto.BTempDTO;
import com.bitschool.dto.CategoryDTO;
import com.bitschool.dto.CompanyDTO;
import com.bitschool.dto.PersonDTO;
import com.bitschool.dto.PlaceDTO;
import com.bitschool.helper.Recommend;
import com.bitschool.service.BTempService;
import com.bitschool.service.IMemberService;
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
	
	@Inject
	private BTempService tService;
	
	@Inject
	private IMemberService memberService;	
	
	@Inject
	private Recommend recom;
	
	//---------------------------------------- 메 인 페 이 지  ----------------------------------------//

	// 01. 개인회원 메인 폼 (Connection URL)
	@RequestMapping(value = "/", method = { RequestMethod.POST, RequestMethod.GET })
	public String DamoyoMain(Model model, HttpSession session) {
		String url = null;
		Recommend recommend = new Recommend();
		List<PlaceDTO> placeList = null;
		
		// 메인페이지에 모임 장소 최신날짜로 6개 가져오기
		placeList = placeService.getPlaceRecentInfo();

		////////////////////////////////////////////////////////////////////////////////////////
		// 세션만들기
		
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		List<BTempDTO> top10List = null;
		List<BTempDTO> list = tService.listAll();		
		
		if(list.size() >= 10) {
			list = recommend.beforeLogin(list);
			if(pdto == null) {
				session.setAttribute("tempList", list);
				top10List = list.subList(0, 10);
				for(BTempDTO dto : list) {
					System.out.println(dto);
				}
			}
			else {
				//list = (List<BTempDTO>)session.getAttribute("tempList");
				CategoryDTO cdto = memberService.PersonHopeCategoryAll(pdto.getGuserId());
				top10List = recommend.afterLogin(list, cdto);
				for(BTempDTO dto : list) {
					System.out.println(dto);
				}
			}
			model.addAttribute("list", top10List);
		}
		
		////////////////////////////////////////////////////////////////////////////////////////
		
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