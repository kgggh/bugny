package com.kgggh.bugny.controller.user;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kgggh.bugny.dto.UserDTO;
import com.kgggh.bugny.service.user.UserService;
import com.kgggh.bugny.util.AES256Util;


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
	public String register(UserDTO user,Model model)throws Exception{
		logger.info("회원가입 성공");
		String encryptPw = AES256Util.encrypt(user.getPassword()); //aes256 암호화
		user.setPassword(encryptPw);
		userService.register(user);
		model.addAttribute("msg","회원가입 성공");
		model.addAttribute("url","/loginPage");
	
		return "redirect";
	}
	
	// 아이디 중복 검사
	@RequestMapping(value = "/user/idCheck", method = RequestMethod.GET)
	@ResponseBody 
	public int idCheck(@RequestParam ("id") String id) throws Exception{
		return userService.idCheck(id);
	}
	
	@RequestMapping("/loginPage")
	public String loginPage() {
		logger.info("로그인 페이지 진입");
		System.out.println("회원가입 페이지 진입");
		return "user/login";
		
	}
	
	
	@RequestMapping("/login")
	public String login(UserDTO user,Model model,HttpSession session)throws Exception {
		String encryptPw = AES256Util.encrypt(user.getPassword()); //aes256 암호화
		user.setPassword(encryptPw);
		UserDTO login = userService.login(user);
		if (login == null) {
			model.addAttribute("msg","아이디 비밀번호를 확인해주세요.");
			model.addAttribute("url","/loginPage");
			return "redirect";
		}else {
			userService.logTime(login.getId());
			session.setAttribute("user", login);
		}
		return "home";
	}
	
	@RequestMapping("/userSearch")
	public String userSearch(HttpSession session)throws Exception {
		logger.info("id/pw찾기");
		return "user/user_search";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session)throws Exception {
		session.invalidate();
		System.out.println("로그아웃");
		return "redirect:/home";
	}
	
	@RequestMapping("/myPage")
	public String myPage(UserDTO user)throws Exception {
		return "user/user_myPage";
	}
	
	
	@RequestMapping("/userUpdatePage")
	public String userUpdatePage()throws Exception {
		logger.info("회원정보수정페이지 진입");
		return "user/userUpdate";
	}
	
	@RequestMapping("/userUpdate")
	public String userUpdate(UserDTO user, Model model) throws Exception {
		logger.info("회원정보수정");
		String encryptPw = AES256Util.encrypt(user.getPassword()); //aes256 암호화
		user.setPassword(encryptPw);
		userService.userUpdate(user);
		model.addAttribute("msg","수정 완료");
		model.addAttribute("url","/home");
		
		return "redirect";
	}
	
	

}
