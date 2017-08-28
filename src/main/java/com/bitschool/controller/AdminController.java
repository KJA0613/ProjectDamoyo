package com.bitschool.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitschool.dto.CompanyDTO;
import com.bitschool.dto.GatherRankDTO;
import com.bitschool.dto.GatheringDTO;
import com.bitschool.dto.PersonDTO;
import com.bitschool.service.IAdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	//----------------------------------------------- 설 정 -----------------------------------------------//
	@Inject
	private IAdminService adminService;
	
		
<<<<<<< HEAD
	// 01. 관리자대쉬보드(메인)페이지
	@RequestMapping(value = "/dashbord", method = RequestMethod.GET )
	public String dashbord(
				Model model
			){
=======
		// 01. 관리자대쉬보드(메인)페이지
		@RequestMapping(value = "/dashboard", method = RequestMethod.GET )
		public String dashbord(){
>>>>>>> bd86fcdb6f88922ebd6fec808a8c75668e734176
			
			String url = "admin/dashboard";	
			
			// 총 카테고리, 총 장소, 모임요청수, 신고글(이건 하드코딩) 
			HashMap<String, Integer> gpCnt = adminService.gatherplaceCnt();
			if(gpCnt!=null){
				System.out.println(gpCnt);
				model.addAttribute("gpCnt", gpCnt);
			}
			
			// 모임 카테고리별, 지역별 많은순		
			List<GatherRankDTO> gatherRank = adminService.gatherRank();
			if(gatherRank!=null){
				System.out.println(gatherRank);
				model.addAttribute("gatherRank()", gatherRank);
			}
			
			// 접속자, 모집글, 광고글 수
			
			// 월별 접속자, 모집글, 광고글 수
			
			// 시간별 접속자, 모집글, 광고글 수
						
			
			
			return url;
		}
		
		// 02. 관리자회원관리페이지
<<<<<<< HEAD
	@RequestMapping(value = "/PeopleTable",method = {RequestMethod.POST,RequestMethod.GET})
	public String PeopleTable(Model model, @RequestParam(value="guserNo", defaultValue="-1")int guserNo,
				                         @RequestParam(value="comNo",defaultValue="-2")int comNo){
		String url = null;
		List<PersonDTO> pdto = null;
		List<CompanyDTO> cdto = null;
		
		pdto = adminService.getPerson();
		cdto = adminService.getCompany();
		
		if(pdto!=null && cdto!=null){
=======
		@RequestMapping(value = "/PeopleTable",method = {RequestMethod.POST,RequestMethod.GET})
		public String PeopleTable(
				Model model, 
				@RequestParam(value="guserNo", defaultValue="-1") int guserNo,
				@RequestParam(value="comNo",defaultValue="-2") int comNo){
		
			String url = null;
			List<PersonDTO> pdto = null;
			List<CompanyDTO> cdto = null;
>>>>>>> bd86fcdb6f88922ebd6fec808a8c75668e734176
			
			pdto = adminService.getPerson(); // 클릭한 회원정보 가저옴
			cdto = adminService.getCompany();
			
			
			if(pdto!=null && cdto!=null){
				
				model.addAttribute("pdtoGuserList", pdto);
				model.addAttribute("cdtoCompanyList",cdto);
				
				url = "admin/PeopleTable";
				
			}
			
			if(guserNo>0&&comNo==-2){
				PersonDTO guser = null;
				
				
				for(int i=0; i<pdto.size(); i++){
					
					if(pdto.get(i).getGuserNo() == guserNo){
						
						guser = new PersonDTO();
						guser = pdto.get(i);
						
						
						List<GatheringDTO> gather = null;
						System.out.println(guser.getGuserId());
						gather= adminService.getGatherInfo(guser.getGuserId());
						System.out.println(gather);
						
						model.addAttribute("guserDetail", guser);
						model.addAttribute("gather", gather);
						
					}
					
				}
								
			}
			
			else if(comNo>0&&guserNo==-1){
				CompanyDTO company = null;
				
				for(int i=0;i<cdto.size();i++){
					
					if(cdto.get(i).getComNo()==comNo){
						company = new CompanyDTO();
						company = cdto.get(i);
						
						model.addAttribute("companyDetail",company);
					}
				}
			}
			return url;
			
			}
		
		
		// 밑에는 테이블 이용하는 url 
		
		// ( yet/모집중, wait/승인대기중, yes/승인됨, no/승인 거절 )
		// 모임 관리 
		@RequestMapping(value = "/gathering", method = {RequestMethod.POST,RequestMethod.GET})
		public String gathering(Model model){
			String url = "";			
			
			// 조건이 gather
			List<GatheringDTO> gdto = adminService.getGatherList();
			
			List<GatheringDTO> waitdto = new ArrayList<GatheringDTO>();
			List<GatheringDTO> yetdto = new ArrayList<GatheringDTO>();
			List<GatheringDTO> yesdto = new ArrayList<GatheringDTO>();
			List<GatheringDTO> nodto = new ArrayList<GatheringDTO>();
			
			for(int i=0; i<gdto.size(); i++){
				
				String recog = gdto.get(i).getGatherRecognition();
				
				System.out.println(gdto.get(i));
				
				if(recog.equals("Wait")){ // 승인 대기
					waitdto.add(gdto.get(i));
				}else if(recog.equals("yet")){ // 모집중
					yetdto.add(gdto.get(i));
				}else if(recog.equals("Yes")){ // 승인됨 ==
					yesdto.add(gdto.get(i));					
				}else if(recog.equals("No")){ //  
					nodto.add(gdto.get(i));					
				}
			}
			
			if(waitdto!=null){
				model.addAttribute("waitdto",waitdto);
			}if(yetdto!=null){
				model.addAttribute("yetdto",yetdto);
			}if(yesdto!=null){
				model.addAttribute("yesdto",yesdto);
			}if(nodto!=null){
				model.addAttribute("nodto",nodto);
			}
			
			url = "/admin/gathering";
			
			return url;
		}
		
		// 카테고리 관리
		@RequestMapping(value = "/category", method = {RequestMethod.POST,RequestMethod.GET})
		public String category(){
			String url = "";
			url = "/admin/category";
			
			
			
			return url;
		}
		
		@RequestMapping(value = "/map", method = {RequestMethod.POST,RequestMethod.GET})
		public String map(){
			String url = "/admin/map";
			
			return url;
		}
		
		@RequestMapping(value = "/upgrade", method = {RequestMethod.POST,RequestMethod.GET})
		public String upgrade(){
			String url = "/admin/upgrade";
			
			return url;
		}
		
		@RequestMapping(value = "/notifications", method = {RequestMethod.POST,RequestMethod.GET})
		public String notifications(){
			String url = "/admin/notifications";
			
			return url;
		}
		
		@RequestMapping(value = "/user", method = {RequestMethod.POST,RequestMethod.GET})
		public String user(){
			String url = "/admin/user";
			
			return url;
		}
	
	}
