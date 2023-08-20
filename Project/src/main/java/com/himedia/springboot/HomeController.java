package com.himedia.springboot;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	
	@GetMapping("/") // 초기 화면
	public String home() {
		return "home";
	}
	
	@GetMapping("/login") // 로그인 화면
	public String login() {
		return "login";
	}
	@GetMapping("/loginToHome") // 로그인 화면에서 홈으로 버튼 클릭
	public String loginToHome(HttpServletRequest hsr) {
		HttpSession session = hsr.getSession();
		session.invalidate();
		return "redirect:/";
	}
}
