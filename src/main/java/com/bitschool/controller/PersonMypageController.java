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
import org.springframework.web.bind.annotation.RequestParam;

import com.bitschool.dto.AreaDTO;
import com.bitschool.dto.CategoryDTO;
import com.bitschool.dto.GatherAddonsDTO;
import com.bitschool.dto.GatheringDTO;
import com.bitschool.dto.PersonDTO;
import com.bitschool.service.IGatheringService;
import com.bitschool.service.IMemberService;

//[개인회원] - 마이페이지
//회원(Member) = 개인(Person) + 기업(Company)
@RequestMapping("mypage")
@Controller
public class PersonMypageController {
	
	//----------------------------------------------- 설 정 -----------------------------------------------//
	
	// [로깅]
	private static final Logger logger = LoggerFactory.getLogger(MemberLoginController.class);

	// [주입] 서비스 인터페이스
	@Inject
	private IMemberService memberService;	
	
	@Inject
	private IGatheringService gatherService;
	
	
	// --------------------------------------- [개인회원] 마 이 페 이 지  ---------------------------------------//

	// 00. [개인회원] 마이페이지 - 마이페이지 관리 폼 (Connection URL)
	// 마이페이지에 관련된 JSP파일 > 모두 Include 처리함
	@RequestMapping(value = "/MyPageManagement", method = RequestMethod.GET)
	public String MyPageManagement() {
		String url = "mypage/MyPageManagement";
		
		return url;
	}
	

	
	// 01-01-01. [개인회원] 마이페이지 - 개인정보 수정 > 비밀번호 확인 후, "수정할 수 있는 페이지로 이동"
	@RequestMapping(value="/PersonFirstModify", method = RequestMethod.POST)
	public String PersonFirstModify(@RequestParam("guserInfoPw") String guserInfoPw, HttpSession session, Model model){
		String url = null;
		
		// 현재 세션에 저장된 정보 > pdto에 저장
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
			
		//System.out.println("[TEST-회원정보 수정(비밀번호 확인)] 세션에 저장된 비밀번호: " + pdto.getGuserPw());
		//System.out.println("[TEST-회원정보 수정(비밀번호 확인)] 폼에 입력한 현재 비밀번호: " + guserInfoPw);
		
		// 세션에 저장되어있는 현재 비밀번호 == 입력한 현재 비밀번호
		if(guserInfoPw != null && pdto.getGuserPw().equals(guserInfoPw)) {	
			
			// pdto 모델에 저장 (세션과 확인한 비밀번호를 가진 사용자 > 회원가입 데이터 불러와야하기 때문에)
			model.addAttribute("pdto", pdto);
						
			//System.out.println("[TEST-회원정보 수정(비밀번호 확인)] 1단계 수정 전 > 데이터: " + pdto);				
			// 회원가입한 정보 > 수정 가능한 페이지로 이동	(기존 정보 뿌려주기)
			url = "mypage/PersonInfoFirstModify";
			
		} else {
			/*------------------- [2차 처리 예정] ------------------
				2) 비밀번호들 일치 안 할 경우 > 예외처리 > 에러 메세지
 	 	     ---------------------------------------------------*/
			url = "redirect:/mypage/MyPageManagement";
		}		
		
		return url;
	}
	
	
	// 01-01-02. [개인회원] 마이페이지 - 1단계 > 개인정보 수정 
	// [1단계] 아이디, 패스워드 > hidden으로 값 받아오기
	// [2단계] PersonInfoFirstModify.jsp > hidden > guserId값 가져오기 
	@RequestMapping(value = "/PersonSecondModify", method = RequestMethod.POST)
	public String PersonSecondModify(PersonDTO pdto, @RequestParam("guserId") String guserId, Model model) {
		String url = null;
		boolean flag = false;

		// 1단계에서 수정 된 데이터 업데이트 (받아온 pdto 이용)
		flag = 	memberService.PersonFirstModifyCheck(pdto);		
		//System.out.println("[TEST-회원정보 수정(데이터 수정)] 1단계 DB에 수정 완료된 데이터: " + pdto);
		
		// 로그인 된 사용자의 > 희망지역 > 정보 가져오기
		AreaDTO adto = memberService.PersonHopeAreaAll(guserId);
		//System.out.println("[TEST-회원정보 수정(희망 지역)] 로그인 사용자 > 희망지역 데이터: " + adto);
		
		// 로그인 된 사용자의 > 희망카테고리 > 정보 가져오기
		CategoryDTO cdto = memberService.PersonHopeCategoryAll(guserId);
		//System.out.println("[TEST-회원정보 수정(희망 카테고리)] 로그인 사용자 > 희망카테고리 데이터: " + cdto);	
		
		// 희망지역, 카테고리 > 데이터 저장해서 보내기 (뿌려주기 위해서)
		model.addAttribute("pdto", pdto);
		model.addAttribute("adto", adto);
		model.addAttribute("cdto", cdto);
		
		System.out.println("참/거짓: "+ flag);
		
		// 희망지역, 카테고리 > 2단계 수정페이지에 데이터들 뿌려주기
		if(flag) {	
			// 희망지역, 카테고리 변경 가능한 페이지로 이동
			url = "mypage/PersonInfoSecondModify";
		}
		
		return url;
	}
	
	
	// 01-01-03. [개인회원] 마이페이지 - 2단계 > 희망지역 및 카테고리 > 전체 조회
	@RequestMapping(value="/PersonFinalCheck", method=RequestMethod.POST)
	public String PersonFinalCheck(PersonDTO pdto, AreaDTO adto, CategoryDTO cdto, Model model) {
		String url = null;			
		
		System.out.println("[TEST-회원정보 수정(개인정보 수정)] 1단계 수정 완료된 데이터: " + pdto);
		System.out.println("[TEST-회원정보 수정(희망 지역 수정)] 2단계 수정 완료된 데이터: " + adto);
		System.out.println("[TEST-회원정보 수정(희망 카테고리 수정)] 2단계 수정 완료된 데이터: " + cdto);
		
		// 희망지역 & 희망카테고리 수정
		//boolean adtoFlag = memberService.PersonHopeAreaModify(adto);
		//boolean cdtoFlag = memberService.PersonHopeCategoryModify(cdto);
		
		// model 사용
		//model.addAttribute("adto", adto);
		//model.addAttribute("cdto", cdto);
		
		// 개인회원 마이페이지 비밀번호 확인 폼 이동
		url = "mypage/MyPageManagement";
		
		return url;
	}
	
	
	// 01-02. [개인회원] 마이페이지 - 비밀번호 변경
	// guserCurPw : 현재 비밀번호 / guserNewPwCheck: 새 비밀번호
	@RequestMapping(value = "/PersonPwModify", method = RequestMethod.POST)
	public String PersonPwModify(@RequestParam("guserCurPw") String guserCurPw,
								 @RequestParam("guserNewPwCheck") String guserNewPwCheck, HttpSession session) {
		
		String url = null;
		boolean flag = false;

		// 로그인 된 세션 정보 받아와서 > pdto에 저장
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");

		//System.out.println("[TEST-비밀번호 변경(개인)] 세션에 저장되어있는 사용자 정보: " + pdto);
		//System.out.println("[TEST-비밀번호 변경(개인)] 폼에 입력한 현재 비밀번호: " + guserCurPw);
		//System.out.println("[TEST-비밀번호 변경(개인)] 폼에 입력한 새 비밀번호: " + guserNewPwCheck);

		// 세션에 사용자 정보가 있으면 > 수정 가능
		if (pdto != null) {
			// [수정 처리] 세션에 저장되어있는 pw = 현재 비밀번호 입력란에 입력한 pw
			if (pdto.getGuserPw().equals(guserCurPw)) {
				// 새 비밀번호 > 현재 세션에 새로 저장
				pdto.setGuserPw(guserNewPwCheck);

				flag = memberService.PersonPwModify(pdto);

				//System.out.println("[TEST-비밀번호 변경(개인)] 수정 여부: " + flag);
				//System.out.println("[TEST-비밀번호 변경(개인)] 비밀번호가 변경된 세션 정보: " + pdto);
			}
		}	
		
		// 비밀번호 수정 성공
		if (flag) {
			// 세션 초기화
			session.invalidate();

			// 로그아웃 된 상태의 메인페이지로 이동 (2차 수정 예정 --- 1번 참조)
			url = "redirect:/";
		
		// 비밀번호 수정 미성공 
		} else {
			
			/*-------------------------- [2차 처리 예정] -------------------------
				1) 비밀번호 수정 성공 > 팝업 > 로그인 화면 or 메인 화면 선택
				2) 비밀번호들 일치 안 할 경우 > 로그아웃 시키면서 메인 페이지로 이동 X > 예외처리
				3) [MyPageInfoModify.jsp] 
				   > 현재 비밀번호, 새 비밀번호 = 새 비밀번호 확인 > 예외처리
				4) html > required 태그 미적용되는 이유 알아보기
	 	 	 -----------------------------------------------------------------*/
			
			// 마이페이지 관리 폼으로 이동 (reload)
			url = "redirect:/mypage/MyPageManagement";
		}
		
		return url;
	}
	
	 
	// 01-03. [개인회원] 마이페이지 - 회원 탈퇴
	@RequestMapping(value = "/PersonQuit", method = RequestMethod.POST)
	public String PersonQuit(@RequestParam("guserPw") String guserPw, HttpSession session) {
		String url = null;
		boolean flag = false;

		// 로그인 된 세션 정보 가져와서 > pdto에 저장
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		
		//System.out.println("[TEST-회원탈퇴] 저장된 세션 정보 읽기: " + pdto);
		
		// DB에 있는 비밀번호 == 사용자가 입력한 비밀번호 > 개인회원 > 삭제 가능
		if(pdto.getGuserPw().equals(guserPw)) {
			// 삭제 여부 판단
			// 매개변수로 pdto를 넘기는 이유 > 회원가입시, 비밀번호 중복처리 안 함 > 다른 사용자끼리 같은 비밀번호 발생 할 수 있음 > 아이디, 비밀번호 동시에 확인 후 > 삭제 처리
			flag = memberService.PersonQuit(pdto);

			//System.out.println("[TEST-회원탈퇴] 삭제된 세션 정보 읽기: " + pdto);
			
			// 삭제 성공 시 > 세션 초기화 및 홈으로 이동
			if (flag) {
				// 세션 초기화
				session.invalidate();

				// 삭제 후, 메인페이지로 이동 (reload)
				url = "redirect:/";
			}	
			
		// DB에 있는 비밀번호 != 사용자가 입력한 비밀번호	
		} else {
			
			/*-------------------------- [2차 처리 예정] -------------------------
				1) 마이페이지 관리 폼 reload 처리가 아닌 > 회원탈퇴 페이지 > 입력 내용 Reset
				2) MyPageInfoModify.jsp > 입력폼 입력 및 체크 유효성 소스코드 작성
				3) html > required 태그 미적용되는 이유 알아보기
			 -----------------------------------------------------------------*/
			
			// 마이페이지 관리 폼으로 이동 (reload)
			url = "redirect:/mypage/MyPageManagement";
		}		

		return url;
	}
	
	
	
	// 02. [개인회원] 마이페이지 - 내가 개설한 모임
	@RequestMapping(value = "/MyPageCreateMeeting", method = RequestMethod.GET)
	public String MyPageCreateMeeting(
			HttpSession session,
			Model model
			) {

		String url = "default";	

		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		
		List<GatheringDTO> mlist = null;
		
		if(pdto!=null){ // 로그인 체크
			
			model.addAttribute("pdto", pdto);
			
			String guserId = pdto.getGuserId();
			mlist = gatherService.getmakeList(guserId); // 내가 만든 모임
			
			url="mypage/MyPageCreateMeeting";
		}
		
		if(mlist!=null){
			model.addAttribute("mlist", mlist);
		}
		
		return url; 
	}

	// 03. [개인회원] 마이페이지 - 내가 참여중인 모임
	@RequestMapping(value = "/MyPageParticipation", method = RequestMethod.GET)
	public String MyPageParticipation(
		HttpSession session,
		Model model
		) {

		String url = "default";	
	
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		
		List<GatheringDTO> plist = null;
		
		if(pdto!=null){ // 로그인 체크
			
			model.addAttribute("pdto", pdto);
			
			String guserId = pdto.getGuserId();
			plist = gatherService.getpartiList(guserId); // 참여중인 모임
			
			url="mypage/MyPageParticipation";
		}
		
		if(plist!=null){
			model.addAttribute("plist", plist);
		}
		
		return url; 
	}

	// 04. [개인회원] 마이페이지 - 내가 찜한 모임
	@RequestMapping(value = "/MyPageGood", method = RequestMethod.GET)
	public String MyPageGood(
			Model model,
			HttpSession session
			) {
		String url = "default";

		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		
		List<GatheringDTO> attendList = null;
		
		model.addAttribute("pdto", pdto);
			
		String guserId = pdto.getGuserId();
		attendList = gatherService.getAttendList(guserId); // 참여중인 모임
		System.out.println("내가 찜한 모임 : "+attendList);
		
		url="mypage/MyPageGood";
		
		if(attendList!=null){
			model.addAttribute("attendList", attendList);
		}
		
		return url;
	}

	// 04-1. [개인회원] 마이페이지 - 내가 찜한 모임 삭제
	@RequestMapping(value="/attendDelete")
	public String attendDelete(
			@RequestParam("writer") String gatherAddonsWriter,
			@RequestParam("no") int gatherNo,
			@RequestParam("code") String gatherAddonsCode,
			HttpSession session
			){
		
			String url="default";
			
			
			PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
			
			System.out.println("내가 찜한 모임 삭제 : "+pdto);
			
			if(pdto!=null){
				GatherAddonsDTO gadto = new GatherAddonsDTO();
				gadto.setGatherNo(gatherNo);
				gadto.setGatherAddonsWriter(gatherAddonsWriter);
				gadto.setGatherAddonsCode(gatherAddonsCode);
				gadto.setGuserId(pdto.getGuserId());
				
				System.out.println("내가 찜한 모임 삭제 : "+gadto);
				
				boolean flag = memberService.deleteAttend(gadto);
				
				System.out.println("내가 찜한 모임 삭제 : "+flag);
				
				if(flag){
					url="redirect:/mypage/MyPageGood";	
				}
			}
			
			
			
			return url;
		}
	
	// 05. [개인회원] 마이페이지 - 내가 올린 자료
	@RequestMapping(value = "/MyPageUploadFile", method = RequestMethod.GET)
	public String MyPageUploadFile() {
		String url = "mypage/MyPageUploadFile";
			
		return url;
	}
	
}