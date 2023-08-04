package com.himedia.springboot;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MyController {
	
	@GetMapping("/")
	public String Home() {
		return "home";
	}
	
	@PostMapping("/signup")
	public String doSignUp(member member, Model model) {
		System.out.println("command object test");
		model.addAttribute("member",member);
		return "member/showmember";
	}
//	public String login(HttpServletRequest hsr, Model model) {
//		model.addAttribute("loginId",hsr.getParameter("id"));
//		model.addAttribute("loginPw",hsr.getParameter("pw"));
//		model.addAttribute("realName",hsr.getParameter("name"));
//		model.addAttribute("birthday",hsr.getParameter("bd"));
//		model.addAttribute("gender",hsr.getParameter("gender"));
//		model.addAttribute("mobile",hsr.getParameter("mobile"));
//		
//		String items[] = hsr.getParameterValues("interest");
//		String sItem = String.join(", ", items);
//		model.addAttribute("interest",sItem);
//		
//		String regions[] = hsr.getParameterValues("region");
//		String sRegion = String.join(", ", regions);
//		model.addAttribute("region",sRegion);
//		
//		return "member/member";
//	}
	
	@GetMapping("/bemember/{userid}/{passcode}/{name}/{mobile}/{birthday}/{gender}")
	public String beMember(@PathVariable String userid,
						   @PathVariable String passcode,
						   @PathVariable String name,
						   @PathVariable String mobile,
						   @PathVariable String birthday,
						   @PathVariable String gender, Model model) {
		model.addAttribute("user_id",userid);
		model.addAttribute("passcode",passcode);
		model.addAttribute("name",name);
		model.addAttribute("mobile",mobile);
		model.addAttribute("birthday",birthday);
		model.addAttribute("gender",gender);
		return "member/showmemberREST";
	}
	
	@GetMapping("/signup")
	public String login2() {
		return "member/login";
	}
	
	@GetMapping("/register")
	public String signup() {
		return "member/signup";
	}
	@GetMapping("/regREST")
	public String signup1() {
		return "member/signupREST";
	}
	
	@GetMapping("/bemember")
	public String bemember1() {
		return "member/showmemberREST";
	}
}
