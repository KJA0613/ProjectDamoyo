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
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitschool.dto.AlarmDTO;
import com.bitschool.dto.CompanyDTO;
import com.bitschool.dto.GatherPeopleDTO;
import com.bitschool.dto.GatherRankDTO;
import com.bitschool.dto.GatheringDTO;
import com.bitschool.dto.PersonDTO;
import com.bitschool.dto.PlaceDTO;
import com.bitschool.dto.PlaceRankDTO;
import com.bitschool.dto.VisitorTimeDTO;
import com.bitschool.dto.VisitorWeekDTO;
import com.bitschool.service.IAdminService;
import com.bitschool.service.IGatheringService;
import com.bitschool.service.IPlaceService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	//----------------------------------------------- 설 정 -----------------------------------------------//
	@Inject
	private IAdminService adminService;
	
	@Inject
	private IGatheringService gService;
	
	@Inject
	private IPlaceService placeService;
	
	// 01. 관리자대쉬보드(메인)페이지
	@RequestMapping(value = "/dashbord", method = RequestMethod.GET )
	public String dashbord(Model model){
			
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
				
				List<GatherRankDTO> categoryRank = new ArrayList<GatherRankDTO>();;
				List<GatherRankDTO> areaRank = new ArrayList<GatherRankDTO>();
				List<GatherRankDTO> typeRank = new ArrayList<GatherRankDTO>();
								
				for(int i=0; i<gatherRank.size(); i++){
					String code = gatherRank.get(i).getTypeCode();
					if(code.equals("category")){
						categoryRank.add(gatherRank.get(i));
					}else if(code.equals("area")){
						areaRank.add(gatherRank.get(i));
					}else if(code.equals("type")){
						typeRank.add(gatherRank.get(i));
					}
				}
				
				model.addAttribute("categoryRank", categoryRank);
				model.addAttribute("areaRank", areaRank);
				model.addAttribute("typeRank", typeRank);
			}
			

			// 요일별 접속자
			List<VisitorWeekDTO> week = adminService.visitWeek();
			
			if(week!=null){
				
				HashMap<String, Integer> weekMap = new HashMap<String, Integer>();
				
				for(int i=0; i<week.size(); i++){
					VisitorWeekDTO visitor = week.get(i);
					weekMap.put(visitor.getVisitorDay(), visitor.getDayCount());
				}
				
				model.addAttribute("week",weekMap);
			}
						
			// 시간별 접속자
			List<VisitorTimeDTO> time= adminService.visitTime();			
			
			if(time!=null){
				
				HashMap<String, Integer> timeMap = new HashMap<String, Integer>();
				
				for(int i=0; i<time.size(); i++){
					VisitorTimeDTO visitor = time.get(i);
					timeMap.put(visitor.getVisitorTime(), visitor.getTimeCount());
				}
				System.out.println(time);
				model.addAttribute("time",timeMap);
			}
			
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
		
		// 장소관리
		@RequestMapping(value = "/place", method = {RequestMethod.POST,RequestMethod.GET})
		public String place(
				Model model
				){
			String url = "/admin/place";
			
			// 전체 조회글 가져오기
			
			List<PlaceDTO> placeList = placeService.adminPlaceAll();
			System.out.println(placeList.size());
			if(placeList!=null){
				model.addAttribute("placeList", placeList);
			}
			
			// 카테고리 많은순
			List<PlaceRankDTO> palceCategory = placeService.adminCategory();
			System.out.println(palceCategory.size());
			if(palceCategory!=null){
				model.addAttribute("palceCategory", palceCategory);
			}
			
			// 지역별 많은순
			List<PlaceRankDTO> placeAddr = placeService.adminAddr();
			System.out.println(placeAddr.size());
			if(placeAddr!=null){
				model.addAttribute("placeAddr", placeAddr);
			}
			
			return url;
		}
		
		
		// 카테고리 관리
		@RequestMapping(value = "/category", method = {RequestMethod.POST,RequestMethod.GET})
		public String category(){
			String url = "";
			url = "/admin/category";
			
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
			
			boolean alarmFlag=false;
			if(flag){
				alarmFlag = alarmInput(gatherNo, "yes");
			}
			
			if(alarmFlag) {
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
			
			
			boolean alarmFlag=false;
			if(flag){
				alarmFlag = alarmInput(gatherNo, "yes");
			}
			

			System.out.println(alarmFlag);
			
			if(alarmFlag) {
				map.put("result", "yes");
			}
			
			return map;
		}
		
		public boolean alarmInput(int gatherNo, String code){
			
			List<GatherPeopleDTO> gpList = adminService.getGatherNoPeople(gatherNo);
			
			boolean alarmFlag = false;
			if(gpList!=null){
				List<AlarmDTO> alarmList = new ArrayList<AlarmDTO>();
				
				for(int i=0; i<gpList.size(); i++){
					AlarmDTO alarm = new AlarmDTO();
					alarm.setAlarmGatherNo(gatherNo);
					alarm.setAlarmGrade(2);
					alarm.setAlarmId("관리자");
					alarm.setAlarmReciveId(gpList.get(i).getGuserId());
					if(code.equals("yes")){
						alarm.setAlarmIndex("모임이 승인되었습니다.");
					}else{
						alarm.setAlarmIndex("모임이 거절되었습니다.");						
					}
					alarmList.add(alarm);
				}
				alarmFlag = adminService.setRecognition(alarmList);
			}
			
			return alarmFlag;
		}
	
	}
