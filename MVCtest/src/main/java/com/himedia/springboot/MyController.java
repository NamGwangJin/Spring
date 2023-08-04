package com.himedia.springboot;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class MyController {
	
	@GetMapping("/")
	public String root() {
		return "home";
	}
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
//	@PostMapping("/doLogin")
//	public String doLogin(HttpServletRequest hsr, Model model) {
//		String userid = hsr.getParameter("userid");
//		String passcode = hsr.getParameter("passcode");
//		model.addAttribute("login",userid);
//		model.addAttribute("pwd",passcode);
//		return "doLogin";
//	}
	
//	@PostMapping("/doLogin")
//	public String doLogin(@RequestParam("userid") String userid,
//						   @RequestParam("passcode") String passcode,
//						   Model model) {
//		model.addAttribute("login",userid);
//		model.addAttribute("pwd",passcode);
//		return "doLogin";
//	}
	
//	@PostMapping("/doLogin")
//	public String doLogin1(userinfo userinfo, Model model) {
//		model.addAttribute("userInfo",userinfo);
//		return "doLogin";
//	}
	
	@GetMapping("/doLogin/{userid}/{passcode}")
	public String doLogin2(@PathVariable String userid,@PathVariable String passcode, Model model) {
		model.addAttribute("userid",userid);
		model.addAttribute("passcode",passcode);
		return "doLogin";
	}
}
