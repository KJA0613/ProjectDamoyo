package com.bitschool.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitschool.dao.SessionDAO;

@Service
public class SessionService {
	
	@Inject
	private SessionDAO sessionDao;

	public int setVisitor() {
		
		int result = sessionDao.setVisitor();
		
		return result;
	}

	public int getToday() {

		int result = sessionDao.getToday();
		
		return result;
	}

	public int getTotal() {

		int result = sessionDao.getTotal();
		
		return result;
	}
	
	
	
}
