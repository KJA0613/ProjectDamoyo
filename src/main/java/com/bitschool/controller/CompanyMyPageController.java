package com.bitschool.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitschool.service.ICompanyService;

@RequestMapping("comMypage")
@Controller
public class CompanyMyPageController {

	//----------------------------------------------- 설 정 -----------------------------------------------//
	
		// [로깅]
		private static final Logger logger = LoggerFactory.getLogger(CompanyMyPageController.class);
		// [주입] 서비스 인터페이스
		@Inject
		private ICompanyService companyService;
		
		
		
		
		
}
