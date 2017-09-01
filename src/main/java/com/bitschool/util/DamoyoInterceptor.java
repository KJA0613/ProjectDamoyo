package com.bitschool.util;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.bitschool.controller.SessionController;
import com.bitschool.dto.PersonDTO;


public class DamoyoInterceptor implements HandlerInterceptor{

	@Inject
	private SessionController sessionController;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {		
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		String visitorCheck = (String) session.getAttribute("visitorCheck");
		
		if(visitorCheck==null){
			session.setAttribute("visitorCheck", "-1");
			
			
			sessionController.makeSession(request);
			/*System.out.println("세션 생성됨, 새션값 : " + session.getAttribute("visitorCheck"));
			System.out.println(request.getRequestedSessionId());*/
		}
		
		// 알람기능 가라로 하기
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		
		if(pdto!=null){
			
			boolean flag = sessionController.checkAlarm(pdto.getGuserId());
						
			if(flag){
				session.setAttribute("alarm", flag);
			}else{
				session.setAttribute("alarm", flag);
			}
		}
		
	}
	
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
		
	}

}
