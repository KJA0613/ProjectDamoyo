package com.bitschool.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitschool.dao.BTempDAO;
import com.bitschool.dto.BTempDTO;

@Service
public class BTempService {
	
	@Inject
	private BTempDAO dao;

	public List<BTempDTO> listAll() {
		List<BTempDTO> list = dao.selectAll();
		return list;
	}

}
