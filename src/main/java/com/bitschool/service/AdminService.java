package com.bitschool.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitschool.dao.IAdminDAO;
import com.bitschool.dto.CompanyDTO;
import com.bitschool.dto.PersonDTO;

@Service
public class AdminService implements IAdminService {
	
	@Inject
	private IAdminDAO dao;
	
	//-----------------------------------------------------------------------------------------------
	//관리자페이지 회원정보보기 (개인)
		@Override
		public List<PersonDTO> getPerson() {
			
			 List<PersonDTO>pdto = dao.getPerson();
			
			return pdto;
		}

	//관리자페이지 회원정보보기 (기업)
		@Override
		public List<CompanyDTO> getCompany() {
			
			List<CompanyDTO>cdto = dao.getCompany();
			
			return cdto;
		}

		
}
