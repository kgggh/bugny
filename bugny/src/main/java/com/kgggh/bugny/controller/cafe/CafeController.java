package com.kgggh.bugny.controller.cafe;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class CafeController {
	private static final Logger log = LoggerFactory.getLogger(CafeController.class);
	
	@RequestMapping("/recomCafe")
	public String recomCafe() {
		log.info("카페 추천 진입");
		return "cafe/cafe_list";
	}
	
	
}
