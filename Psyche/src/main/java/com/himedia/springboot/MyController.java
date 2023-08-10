package com.himedia.springboot;

import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MyController {
	
	@GetMapping("/")
	public String home(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("userid");
		if(userid==null || userid.equals("")) {
			System.out.println("/home if문 들어옴");
			model.addAttribute("name","");
		} else {
			System.out.println("/home else문 들어옴");
			model.addAttribute("name",(String) session.getAttribute("username"));
		}
		return "home";
	}
	
	@GetMapping("/login")
	public String login(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("userid");
		if ( userid == null || userid.equals("") ) {
			return "login";
		}
		else {
			return "redirect:/";
		}
	}
	
	@PostMapping("/doLogin")
	public String doLogin(HttpServletRequest req, Model model) {
		String loginid = req.getParameter("logid");
		String pwd = req.getParameter("pwd");
		if(loginid.equals("blackpink") && pwd.equals("apink")) {
			HttpSession session = req.getSession();
			session.setAttribute("userid", loginid);
			session.setAttribute("username", "남광진");
			System.out.println("/dologin if문 들어옴");
			return "redirect:/";
		}
		System.out.println("/dologin 들어옴");
		return "redirect:/login";
	}
	
	@GetMapping("/logout")
	public String doLogout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		return "redirect:/";
	}
	@GetMapping("/ano")
	public String doAnother() {
		return "signon";
	}
	
	@PostMapping("/signon")
	@ResponseBody
	public String signon(HttpServletRequest hrs) {
		String id = hrs.getParameter("userid");
		String pw = hrs.getParameter("pw");
		if( id.equals("aaa") && pw.equals("123") ) {
			return "남광진";
		}
		return "누구세요";
	}
	
	@GetMapping("/test01")
	public String doTest01() {
		return "test01";
	}
	
	@PostMapping("/plus")
	public String doPlus(HttpServletRequest req) {
		HttpSession session = req.getSession();
		float num1 = Float.parseFloat(req.getParameter("num1"));
		float num2 = Float.parseFloat(req.getParameter("num2"));
		session.setAttribute("result1",num1);
		session.setAttribute("result2",num2);
		return "result01";
	}
	
	@GetMapping("/study")
	public String study() {
		return "study01";
	}
	@PostMapping("/result")
	@ResponseBody
	public int result(HttpServletRequest hrs) {
		String n1 = hrs.getParameter("num1");
		String n2 = hrs.getParameter("num2");
		String n3 = n1 + n2;
		return (Integer.parseInt(n1) * Integer.parseInt(n2)) + Integer.parseInt(n3);
	}
	
	@GetMapping("/view")
	public String doView() {
		return "view";
	}
	@PostMapping("/list")
	@ResponseBody
	public String doList() {
		ArrayList<String> alMenu = new ArrayList<String>();
		ArrayList<Integer> alPrice = new ArrayList<Integer>();
		alMenu.add("Latte"); alMenu.add("mocca"); alMenu.add("팥죽");
		alPrice.add(3000); alPrice.add(3500); alPrice.add(7000);
		
		JSONArray ja = new JSONArray();
		for(int i=0; i<alMenu.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("menu", alMenu.get(i));
			jo.put("price", alPrice.get(i));
			ja.add(jo);
		}
		return ja.toJSONString();
	}
}
