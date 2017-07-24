package com.bitschool.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

// [메인] - 메인페이지 이동
@Controller
public class MainController {
	
	//------------------------------------ 메 인 페 이 지  ------------------------------------//

	// 00. 메인 폼 (Connection URL)
	@RequestMapping(value = "/", method = { RequestMethod.POST, RequestMethod.GET })
	public String DamoyoMain() {
		String url = "DamoyoMain";

		return url;
	}
	
}