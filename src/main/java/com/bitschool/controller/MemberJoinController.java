package com.bitschool.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitschool.dto.AreaDTO;
import com.bitschool.dto.CategoryDTO;
import com.bitschool.dto.CompanyDTO;
import com.bitschool.dto.PersonDTO;
import com.bitschool.service.IMemberService;

//[개인&기업회원] - 회원가입
//회원(Member) = 개인(Person) + 기업(Company)
@RequestMapping("join")
@Controller
public class MemberJoinController {
	
	//----------------------------------------------- 설 정 -----------------------------------------------//
	
	// [로깅]
	private static final Logger logger = LoggerFactory.getLogger(MemberLoginController.class);

	// [주입] 서비스 인터페이스
	@Inject
	private IMemberService memberService;	

	
	// ---------------------------------------- [개인회원] 회 원 가 입 ----------------------------------------//

	// 00. 회원가입 유형 선택 폼 (Connection URL)
	@RequestMapping(value="/JoinChoiceForm", method={RequestMethod.POST, RequestMethod.GET})
	public String JoinChoiceForm() {
		String url = "join/JoinChoiceForm";

		return url;
	}
	

	// 01. 회원가입 유형 > 개인회원: value = A (name값: 'person' 넘어옴)
	@RequestMapping(value="/JoinChoiceCheck", method=RequestMethod.POST)
	public String JoinChoiceCheck(@RequestParam("person") String person, PersonDTO pdto,Model model) {
		String url = null;
	
		// pdto에 guserCode값(A) > 새로 저장
		pdto.setGuserCode(person);

		// 개인회원 > value = A 저장해서 값 넘김 (hidden > 코드값 받아올 예정이므로 model에 저장)
		model.addAttribute("pdto", pdto);	
		
		// pdto에 A값 저장한 상태로 "회원가입 1단계 폼"으로 이동
		url = "join/JoinPersonInto";

		return url;
	}
	
	//01-1. 회원가입 유형 > 기업회원: value = B (name값: 'company' 넘어옴)
	@RequestMapping(value="/JoinChoiceCheck2", method=RequestMethod.POST)
	public String JoinChoiceCheck2(@RequestParam("company") String company, CompanyDTO cdto,Model model){
		String url = null;
		
		// cdto에 comCode값(B) > 새로 저장
		cdto.setComCode(company);
		
		// 기업회원 > value = B 저장해서 값 넘김 (hidden > 코드값 받아올 예정이므로 model에 저장)
		model.addAttribute("cdto",cdto);
		
		// cdto에 B값 저장한 상태로 "회원가입 1단계 폼"으로 이동		
		url = "join/JoinCompanyInto";
		
		return url;
	}
	
	// 02. [개인회원가입-1단계] 개인회원가입 1단계에 입력한 값 저장 후 > 지역, 카테고리 선택하는 폼으로 넘기기
	@RequestMapping(value="/PersonDataRegist", method=RequestMethod.POST)
	public String PersonDataRegist(PersonDTO pdto, Model model) {
		String url = null;
		
		// 2단계 가기 전, pdto 전체 데이터 저장
		model.addAttribute("pdto", pdto);
			
		// 희망 지역, 카테고리 선택 폼 > "회원가입 2단계 폼"으로 이동
		url = "join/JoinPersonDetail";
		
		return url;
	}
	
	// 02-1. [기업회원가입-1단계] 회원가입 1단계에 입력한 값 저장 후 >상세정보입력하는 폼으로 넘기기
	@RequestMapping(value = "/CompanyDataRegist", method = RequestMethod.POST)
	public String CompanyDataRegist(CompanyDTO cfdto, HttpSession session, Model model) {
		String url = null;

		// 2단계 가기 전,cdto 전체 데이터 저장
		session.setAttribute("cfdto", cfdto);
		System.out.println("[TEST 1단계]" + cfdto);

		model.addAttribute("cfdto", cfdto);

		// 기업상세정보선택"회원가입 2단계 폼"으로 이동
		url = "join/JoinCompanyDetail";

		return url;
	}
	
	// 03. [회원가입-2단계] 지역 및 카테고리 등록	
	@RequestMapping(value = "/PersonDatailRegist", method = { RequestMethod.GET, RequestMethod.POST })
	public String PersonDatailRegist(PersonDTO pdto, AreaDTO adto, CategoryDTO cdto) {
		String url = null;
		
		// 현재 회원가입 진행중인 사람의 아이디 > 2단계 진입 > adto에 아이디값 저장
		adto.setGuserId(pdto.getGuserId());
		
		
		// [Flag_01] 유저 코드값(A) + 회원가입 1단계 데이터
		//System.out.println("[TEST-회원가입(2)] 1단계에서 받아온 데이터: " + pdto);		
		boolean flagInfo = memberService.PersonDataRegist(pdto);		
		
		// [Flag_02] 희망 지역 삽입
		//System.out.println("[TEST-회원가입(2)] 2단계 희망 지역: " + adto);		
		boolean flagArea = memberService.PersonAreaRegist(adto);
		
		// [Flag_03] 희망 카테고리 삽입 
		//System.out.println("[TEST-회원가입(2)] 2단계 희망 카테고리: " + cdto);		
		boolean flagCtg = memberService.PersonCategoryRegist(cdto);
		
		// [모두 TRUE] 회원가입 완료 > 메인 페이지
		if(flagInfo && flagArea && flagCtg) {
			url = "redirect:/"; 
		}
		
		return url;
	}
	
	// 03-1. [기업회원가입-2단계] 기업상세정보 등록	
	@RequestMapping(value = "/CompanyDetailRegist", method = { RequestMethod.GET, RequestMethod.POST })
	public String CompanyDetailRegist(CompanyDTO cdto ,HttpSession session, Model model){

		CompanyDTO cfdto = (CompanyDTO) session.getAttribute("cfdto");
	
		cdto.setComManager(cfdto.getComManager());
		cdto.setComId(cfdto.getComId());
		cdto.setComPw(cfdto.getComPw());
		cdto.setComEmail(cfdto.getComEmail());
		cdto.setComPhone(cfdto.getComPhone());
		cdto.setComCode(cfdto.getComCode());
		
		String url = null;
		
		boolean flagInsert = memberService.CompanyRegist(cdto);
				
		if(flagInsert){
			url="redirect:/";
		}
		return url;
	}
	
	
	
	// ---------------------------------------- [개인&기업 회원] 아이디 중복 체크 ----------------------------------------//
	
	// 04-01. [개인회원] 회원가입 - 데이터 유효성 검사 > 아이디 중복 체크
	@ResponseBody 
	@RequestMapping(value="/checkDuplicatePersonIdAjax", method=RequestMethod.POST)
	public String checkDuplicatePersonIdAjax(@RequestParam("guserId") String guserId, Model model) {
		String result = null;

		//System.out.println("[TEST] Ajax Data(아이디 값 받아오기): " + guserId);

		// DB에 저장된 아이디랑 비교
		result = memberService.checkDuplicatePersonId(guserId);		
		//System.out.println("[TEST] DB Data(DB에 저장된 결과): " + result);
		
		// 입력한 id = DB에 조회한 id
		if (result == null) {							// 가입 가능한 아이디
			result = "OK";
		} else {										// 중복 된 아이디
			result = "FAIL";
		}
		
		return result;		
	}
	
	
	// 04-02. [기업회원] 회원가입 - 데이터 유효성 검사 > 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "/checkDuplicateCompanyIdAjax", method = RequestMethod.POST)
	public String checkDuplicateCompanyIdAjax(@RequestParam("comId") String comId, Model model) {
		String result = null;

		//System.out.println("[TEST] Ajax Data(아이디 값 받아오기): " + comId);

		// DB에 저장된 아이디랑 비교
		result = memberService.checkDuplicateCompanyId(comId);
		//System.out.println("[TEST] DB Data(DB에 저장된 결과): " + result);

		// 입력한 id = DB에 조회한 id
		if (result == null) { // 가입 가능한 아이디
			result = "OK";
		} else { // 중복 된 아이디
			result = "FAIL";
		}

		return result;
	}

}