package com.bitschool.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitschool.dto.CompanyDTO;
import com.bitschool.dto.PersonDTO;
import com.bitschool.service.IAdminService;

@Controller
public class AdminController {
	//----------------------------------------------- 설 정 -----------------------------------------------//
	@Inject
	private IAdminService adminService;
		
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
		
	/*	// 03. 카테고리 관리
		@RequestMapping(value = "/category",method = {RequestMethod.POST,RequestMethod.GET})
		public String category(){
			String url = null;
			url = "admin/category";
			return url;
		}*/
	
	}
