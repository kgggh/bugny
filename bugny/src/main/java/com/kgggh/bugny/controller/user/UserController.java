package com.kgggh.bugny.controller.user;



import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kgggh.bugny.dto.UserDTO;
import com.kgggh.bugny.service.UserService;


@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/registerPage",method = RequestMethod.GET)
	public String registerPage() {
		logger.info("회원가입 페이지 진입");
		return "user/register";
	}
	
	@RequestMapping(value = "/register")
	public String register(UserDTO user)throws Exception {
		
		userService.register(user);
		logger.info("회원가입 성공");
		System.out.println("회원가입 성공?");
		return "redirect:/";
	}
	
	@RequestMapping("/loginPage")
	public String loginPage() {
		logger.info("로그인 페이지 진입");
		System.out.println("회원가입 페이지 진입");
		return "user/login";
		
	}
	
	
	@RequestMapping("/login")
	public String login(UserDTO user,HttpSession session)throws Exception {
		
		UserDTO login = userService.login(user);
		
		if(login == null) {
			logger.info("로그인 실패");
			System.out.println("로그인 실패");
			return "user/login";
			
		}else {
			logger.info("로그인 성공");
			System.out.println("로그인 성공");
			userService.loginDate(user.getId());
			session.setAttribute("user", login);
		}
		
		return "redirect:/";
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session)throws Exception {
		session.invalidate();
		System.out.println("로그아웃 성공");
		return "redirect:/";
	}
	
	// 아이디 중복 검사
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	public String userIdCheckt(String id) throws Exception{
		logger.info("memberIdChk() 진입");
		int result = userService.idCheck(id);
		logger.info("결과값 = " + result);
		
		return "";
	}
}
