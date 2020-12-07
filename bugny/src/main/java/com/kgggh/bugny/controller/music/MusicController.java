package com.kgggh.bugny.controller.music;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class MusicController {
	
	@RequestMapping("/musicPage")
	public String musicPage() {
		return "music/music";
	}
	
	
	
}
