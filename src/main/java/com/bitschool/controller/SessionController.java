package com.bitschool.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import com.bitschool.service.SessionService;

@Controller
public class SessionController {
	
	@Inject
	private SessionService sessionService;
	
	public HttpSession makeSession(HttpServletRequest request){
		
		HttpSession session = request.getSession();
		
		
		
		int result = sessionService.setVisitor();
		System.out.println("result : "+result);
		
		/*if(result>0){
		 	int todayCount = 0;
			int totalCount = 0;
			
			todayCount = sessionService.getToday();
			totalCount = sessionService.getTotal();
			
			System.out.println(todayCount+" / "+totalCount);
			
			if(todayCount>0&&totalCount>0){
				
				session.setAttribute("todayCount", todayCount);
				session.setAttribute("totalCount", totalCount);
			}
		}*/
	
		
		return session;
	}

	public boolean checkAlarm(String loginId) {

		boolean flag  = sessionService.checkAlarm(loginId);
		
		return flag;
	}
	
	
}
