package com.kgggh.bugny.controller.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class BoardController {
	
	@RequestMapping("/boardPage")
	public String boardPage() {
		return "board/board";
	}
	
	
}
