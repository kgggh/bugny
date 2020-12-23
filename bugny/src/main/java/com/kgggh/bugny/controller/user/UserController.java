package com.kgggh.bugny.controller.user;



import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
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
	public String register(UserDTO user,Model model)throws Exception{
		int cnt = userService.register(user);
		if(cnt == -1) {
			System.out.println(">>>>>>>>>result"+cnt);
			logger.info("회원가입 실패");
			model.addAttribute("msg","회원가입 실패");
			model.addAttribute("url","/register");
			
		}else {
			model.addAttribute("msg","회원가입 성공");
			model.addAttribute("url","/loginPage");
			logger.info("회원가입 성공");
		}
		return "redirect";
	}
	
	// 아이디 중복 검사
	@RequestMapping(value = "/idChk")
	@ResponseBody 
	public int idChk(@RequestParam ("id") String id) throws Exception{
		logger.info("아이디 중복체크 진입");
		System.out.println("id >>>>>"+ id);
		int cnt = userService.idCheck(id);
				if(cnt == -1) {
					System.out.println("중복아이디 존재");
				}else {
					System.out.println("아이디 사용 가능");
				}
		return cnt;
	}
	
	@RequestMapping("/loginPage")
	public String loginPage() {
		logger.info("로그인 페이지 진입");
		System.out.println("회원가입 페이지 진입");
		return "user/login";
		
	}
	
	
	@RequestMapping("/login")
	public String login(UserDTO user,HttpSession session,HttpServletResponse response)throws Exception {
		UserDTO login = userService.login(user);
		if(login == null) {
			logger.info("로그인 실패");
			return"user/login";
		}else {
			userService.logTime(user.getId());
			session.setAttribute("user", login);
		}
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
        out.println("<script>alert('성공적으로 로그인 되었습니다.');</script>");
        out.flush();
		return "home";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session)throws Exception {
		session.invalidate();
		System.out.println("로그아웃");
		return "redirect:/home";
	}
	
	@RequestMapping("/myPage")
	public String myPage()throws Exception {
		return "user/myPage";
	}
	
	
	@RequestMapping("/userUpdatePage")
	public String userUpdatePage()throws Exception {
		logger.info("회원정보수정페이지 진입");
		return "user/user_Update.jsp";
	}
	@RequestMapping("/userUpdate")
	public String userUpdate(UserDTO user, Model model) throws Exception {
		 userService.userUpdate(user);
		 model.addAttribute("msg","수정 완료");
		 model.addAttribute("url","/home");
		
		return "redirect";
	}
	
	

}
