package com.kgggh.bugny.controller.chat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ChatController {
	
	@RequestMapping(value = "/liveChat")
	public String liveChat() {
		return "chat/chat";
	}
	
	
}
