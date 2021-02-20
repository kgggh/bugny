package com.kgggh.bugny.controller.chat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChatController {
	
	@GetMapping(value = "/liveChat")
	public String liveChat() {
		return "chat/chat";
	}
	
	
}
