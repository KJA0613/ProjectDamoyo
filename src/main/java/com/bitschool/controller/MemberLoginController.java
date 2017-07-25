package com.bitschool.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitschool.dto.EmailDTO;
import com.bitschool.dto.PersonDTO;
import com.bitschool.dto.RecommGatherDTO;
import com.bitschool.service.EmailSender;
import com.bitschool.service.IGatheringService;
import com.bitschool.service.IMemberService;

// [개인&기업회원] - 로그인&로그아웃
// 회원(Member) = 개인(Person) + 기업(Company)
@RequestMapping("/member")
@Controller
public class MemberLoginController {		
	
	//----------------------------------------------- 설 정 -----------------------------------------------//
	
	// [로깅]
	private static final Logger logger = LoggerFactory.getLogger(MemberLoginController.class);

	// [주입] 서비스 인터페이스
	@Inject
	private IMemberService memberService;	
	
	@Inject
	private IGatheringService gService;
	
	
	//----------------------------------------------- 로 그 인 -----------------------------------------------//	
	
	// 00. [개인&기업회원] 로그인 폼 (Connection URL)
	@RequestMapping(value="/LoginForm", method={RequestMethod.POST, RequestMethod.GET})
	public String LoginForm() {
		String url = "login/LoginForm";
		
		/*-------------------------- [2차 처리 예정] --------------------------
			1) 개인/기업 > 체크박스 추가 	2) 개인/기업 > DB등록된 코드값 비교해서 로그인 처리 
			3) 로그인 유지 > 체크박스 추가
		 ------------------------------------------------------------------*/

		return url;
	}
	
	
	// 01. [개인회원] 로그인
	// "쿠키"와 "세션" 설명 : http://88240.tistory.com/190 > [1차 처리] 세션 > [2차 처리 고민] 스프링 제공
	@RequestMapping(value = "/PersonLogin", method = {RequestMethod.POST, RequestMethod.GET})
	public String LoginCheck(@RequestParam("guserId") String guserId, @RequestParam("guserPw") String guserPw, HttpSession session, Model model, 
							 HttpServletRequest request, RedirectAttributes redirectAttributes) {
							
		String url = null;

		// 사용자가 로그인 폼에 입력한 데이터 > DB에 있는 데이터인지 여부 확인
		PersonDTO pdto = memberService.PersonLogin(guserId, guserPw);

		System.out.println("[TEST-로그인(개인)/세션유지] 세션에 저장된 회원 정보 확인: " + pdto);

		// 로그인 성공 (DB에 해당 데이터 있음)
		if(pdto != null) {
			
			// 세션에 사용자 정보 저장
			session.setAttribute("pdto", pdto);			
			
			List<RecommGatherDTO> recommgatherList = new ArrayList<RecommGatherDTO>();
			session.setAttribute("recommgatherList", recommgatherList);
			
			//redirectAttributes.addFlashAttribute("pdto", pdto);
			//System.out.println("리다이렉트 값: " + pdto);
			
			// 이전 페이지로 복귀
			//String referer = request.getHeader("Referer");
			//System.out.println("페이지 경로명: " + referer);		// [출력] http://localhost:5050/member/LoginForm		
			//String[] loginReferer = referer.split("/");
			
			//System.out.println("4번째: " + loginReferer[4]);
			
			// 메인페이지 이동 (reload)
			//url = "redirect:/member/" + loginReferer[4].toString();
			url = "redirect:/";
			
		// 로그인 실패 (DB에 해당 데이터 없음)
		} else {	
			// 에러 메세지 > 로그인 폼 페이지로 전송
			model.addAttribute("loginErrorMsg", "※ 아이디 또는 비밀번호를 잘못 입력하셨습니다. 다시 입력해주세요!");
			
			// 로그인 폼 페이지 이동
			url = "login/LoginForm";
		}

		return url;
	}

	
	// 02. [개인&기업회원] 로그아웃 (세션 유지 해제)
	@RequestMapping(value = "/Logout", method = RequestMethod.GET)
	public String Logout(HttpSession session) {
		String url = null;

		// guser가 선택한 것을 담아놓은 dto를 db에 넣음
		@SuppressWarnings("unchecked")
		List<RecommGatherDTO> recommgatherList = (List<RecommGatherDTO>) session.getAttribute("recommgatherList");
		
		if(recommgatherList!=null){
		
			boolean flag  = gService.mergeRecommend(recommgatherList);
			
			if(flag){
				System.out.println("성공했다 짜식아");
			}
		}
		// 세션 초기화		
		session.invalidate();

		// 로그아웃 된 상태로 메인 페이지 이동 (reload)
		url = "redirect:/";

		return url;
	}


	// 03. [개인&기업회원] 아이디 찾기 폼
	@RequestMapping(value = "/findID", method = { RequestMethod.POST, RequestMethod.GET })
	public String findID() {
		String url = "login/findID";

		return url;
	}
		

	// 04. [개인&기업회원] 아이디 찾기
	@RequestMapping(value = "/findIDCheck", method = RequestMethod.POST)
	public String findIDCheck(@RequestParam("guserEmail") String guserEmail,
			@RequestParam("guserName") String guserName, Model model) {
		String url = null;

		PersonDTO pdto = memberService.getfindID(guserEmail, guserName);

		model.addAttribute("pdto", pdto);

		url = "login/comFindID";

		return url;
	}

	
	// 05. [개인&기업회원] 비밀번호 찾기
	@RequestMapping(value = "/findPW", method = { RequestMethod.POST, RequestMethod.GET })
	public String findPW() {
		String url = "login/findPW";

		return url;
	}
	
					
	// 06. [개인&기업회원] 비밀번호 찾기 - 이메일
	@Autowired
	private EmailSender emailSender;
	@Autowired
	private EmailDTO email;

	@RequestMapping(value = "/sendEmailAction", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView sendEmailAction(@RequestParam("guserEmail") String guserEmail,
										@RequestParam("guserId") String guserId) {
		ModelAndView mav;
		String url = null;

		PersonDTO pdto = memberService.getfindPW(guserEmail, guserId);

		String pw = pdto.getGuserPw();

		// System.out.println(pw);
		if (pw != null) {
			email.setContent("비밀번호는 " + pw + " 입니다.");
			email.setReceiver(pdto.getGuserEmail());
			email.setSubject(pdto.getGuserId() + "님 비밀번호 찾기 메일입니다.");
			try {
				emailSender.SendEmail(email);
			} catch (Exception e) {
				e.printStackTrace();
			}
			mav = new ModelAndView("redirect:/member/LoginForm");
			return mav;
		} else {
			mav = new ModelAndView("redirect:/");
			return mav;
		}

	}
}