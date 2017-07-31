package com.bitschool.dao;

import com.bitschool.dto.CompanyDTO;


public interface ICompanyDAO {
	
	// --------------------------------------- [기업회원] 회원가입  ---------------------------------------//
	
	// [기업회원] 회원가입 - 1단계  + 2단계> 입력한 내용 삽입
	public boolean companyRegist(CompanyDTO cdto);

}
