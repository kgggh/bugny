package com.kgggh.bugny.controller.music;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class MusicController {
	private static final Logger log = LoggerFactory.getLogger(MusicController.class);
	
	@RequestMapping("/musicPage")
	public String musicPage() {
		log.info("음악 메뉴 진입");
		return "music/music";
	}
	
	
	
}
