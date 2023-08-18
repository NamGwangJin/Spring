package com.himedia.springboot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {
	@Autowired
	private BoardDAO bdao;
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	@PostMapping("/loginOk")
	public String loginOk(HttpServletRequest req) {
		String id = req.getParameter("logid");
		String pw = req.getParameter("pwd");
		MemberDTO mdto = bdao.userSelect(id, pw);
		if (mdto != null) {
			HttpSession session = req.getSession();
			session.setAttribute("id", id);
			if (mdto.getSelficon() == null) {
				session.setAttribute("selficon", "default.jpg");
			} else {
				session.setAttribute("selficon", mdto.getSelficon());
			}
			return "redirect:/";
		} else {
			HttpSession session = req.getSession();
			session.setAttribute("id", "");
			return "redirect:/login";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/signup")
	public String signup() {
		return "signup";
	}
	@PostMapping("signUpOk")
	@ResponseBody
	public String signUpOk(HttpServletRequest req) {
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		int cnt = bdao.signup(id, pw);
		return String.valueOf(cnt);
	}
}
