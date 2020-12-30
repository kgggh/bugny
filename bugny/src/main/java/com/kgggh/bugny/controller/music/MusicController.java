package com.kgggh.bugny.controller.music;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class MusicController {
	private static final Logger log = LoggerFactory.getLogger(MusicController.class);
	
	@RequestMapping("/musicNewest")
	public String musicNewest() {
		log.info("최신음악 진입");
		return "music/music_newest";
	}
	@RequestMapping("/musicTop100")
	public String musicTop100() {
		log.info("뮤직 top100 진입");
		return "music/music_Top";
	}
	@RequestMapping("/musicWriteP")
	public String musicWritePage() {
		log.info("노래 등록 페이지");
		return "music/music_write";
	}
	@RequestMapping("/musicReq")
	public String musicRequest() {
		log.info("노래 요청 페이지");
		return "music/music_request";
	}
	
	
	
}
