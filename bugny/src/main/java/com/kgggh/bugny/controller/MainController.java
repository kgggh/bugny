package com.kgggh.bugny.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	@GetMapping(value = "/")
	public String bugny() {
		return "home";
	}
	@GetMapping(value = "/home")
	public String home() {
		return "home";
	}
	
}
