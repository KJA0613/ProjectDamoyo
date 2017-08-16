package com.bitschool.service;

import java.util.List;

import com.bitschool.dto.CompanyDTO;
import com.bitschool.dto.PersonDTO;

public interface IAdminService {

	public List<PersonDTO> getPerson();

	public List<CompanyDTO> getCompany();

	
}
