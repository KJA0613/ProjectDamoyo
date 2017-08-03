package com.bitschool.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitschool.dao.ICompanyDAO;


@Service

public class CompanyService implements ICompanyService{
	
	//----------------------------------------------- 설 정 -----------------------------------------------//

		// [주입] DAO 인터페이스
				
		@Inject
		private ICompanyDAO companyDAO;
		
}
