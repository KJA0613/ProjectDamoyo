package com.bitschool.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitschool.dto.CompanyDTO;
import com.bitschool.dto.GatheringDTO;
import com.bitschool.dto.PersonDTO;
import com.bitschool.service.IAdminService;
import com.bitschool.service.IGatheringService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	//----------------------------------------------- 설 정 -----------------------------------------------//
	@Inject
	private IAdminService adminService;
	
	@Inject
	private IGatheringService gService;
		
		// 01. 관리자대쉬보드(메인)페이지
		@RequestMapping(value = "/dashbord", method = RequestMethod.GET )
		public String dashbord(){
			
			String url = "admin/dashboard";	
			
			
			return url;
		}
		
		// 02. 관리자회원관리페이지
		@RequestMapping(value = "/PeopleTable",method = {RequestMethod.POST,RequestMethod.GET})
		public String PeopleTable(Model model, @RequestParam(value="guserNo", defaultValue="-1")int guserNo,
				                         @RequestParam(value="comNo",defaultValue="-2")int comNo){
		
		String url = null;
		List<PersonDTO> pdto = null;
		List<CompanyDTO> cdto = null;
		
		pdto = adminService.getPerson();
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
					
					model.addAttribute("guserDetail", guser);
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
				
				//System.out.println(gdto.get(i));
				
				if(recog.equals("Wait")){
					waitdto.add(gdto.get(i));
				}else if(recog.equals("yet")){
					yetdto.add(gdto.get(i));
				}else if(recog.equals("Yes")){
					yesdto.add(gdto.get(i));					
				}else if(recog.equals("No")){
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
		
		@RequestMapping(value = "/gatherYes", method = {RequestMethod.POST,RequestMethod.GET})
		public @ResponseBody HashMap<String, String> gatherYes(@RequestParam(value="no", defaultValue="") int gatherNo){
			boolean flag = false;
			GatheringDTO dto = gService.getGathering(gatherNo);
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("result", "no");
			flag = gService.updateRecogYes(gatherNo);
			if(dto.getGatherBlog().equals("Yes")) {
				flag = gService.assignBlogId(gatherNo);
			} else {
				// 블로그 생성 필요 없음
			}
			if(flag) {
				map.put("result", "yes");
			}
			
			return map;
		}
		
		@RequestMapping(value = "/gatherNo", method = {RequestMethod.POST,RequestMethod.GET})
		public @ResponseBody HashMap<String, String> gatherNo(@RequestParam(value="no", defaultValue="") int gatherNo){
			boolean flag = false;
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("result", "no");
			flag = gService.updateRecogNo(gatherNo);
			if(flag) {
				map.put("result", "yes");
			}
			
			return map;
		}
		
	
	}
