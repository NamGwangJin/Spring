package com.himedia.springboot;

import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MyController {
	@Autowired
	private MenuDAO mdao;
	
	@GetMapping("/")
	public String home(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		if(id==null || id.equals("")) {
			model.addAttribute("id","");
		} else {
			model.addAttribute("id",id);
		}
		return "cafe";
	}
	
	@PostMapping("/getList")
	@ResponseBody
	public String getList() {
		ArrayList<MenuDTO> alMenu = mdao.select();
		JSONArray ja = new JSONArray();
		for(int i=0; i<alMenu.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("num", alMenu.get(i).getSeq());
			jo.put("name", alMenu.get(i).getName());
			jo.put("price", alMenu.get(i).getPrice());
			ja.add(jo);
		}
		return ja.toJSONString();
	}
	
	@PostMapping("/insert")
	@ResponseBody
	public String insert(HttpServletRequest req) {
		String name = req.getParameter("name");
		int price = Integer.parseInt(req.getParameter("price"));
		int cnt = mdao.insert(name, price);
		System.out.println("inserted count [ " + cnt + " ] ");
		
		return String.valueOf(cnt);
	}
	@PostMapping("/delete")
	@ResponseBody
	public String delete(HttpServletRequest req) {
		int num = Integer.parseInt(req.getParameter("num"));
		int cnt = mdao.delete(num);
		
		return String.valueOf(cnt);
	}
	@PostMapping("/update")
	@ResponseBody
	public String update(HttpServletRequest req) {
		int num = Integer.parseInt(req.getParameter("num"));
		String name = req.getParameter("name");
		int price = Integer.parseInt(req.getParameter("price"));
		int cnt = mdao.update(num, name, price);
		
		return String.valueOf(cnt);
	}
	
	@PostMapping("/getSales")
	@ResponseBody
	public String getSales() {
		ArrayList<OutgoDTO> alSales = mdao.salesSelect();
		JSONArray ja = new JSONArray();
		for(int i=0; i<alSales.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("mobile", alSales.get(i).getMobile());
			jo.put("total", alSales.get(i).getTotal());
			jo.put("created", alSales.get(i).getCreated());
			ja.add(jo);
		}
		return ja.toJSONString();
	}
	
	@PostMapping("/insertSales")
	@ResponseBody
	public String insertSales(HttpServletRequest req) {
		String mobile = req.getParameter("mobile");
		if (mobile.equals("")) {
			mobile = "비회원";
		}
		int total = Integer.parseInt(req.getParameter("total"));
		String created = req.getParameter("created");
		int cnt = mdao.salesInsert(mobile, total, created);
		System.out.println("inserted count [ " + cnt + " ] ");
		
		return String.valueOf(cnt);
	}
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	@GetMapping("/signup")
	public String signup() {
		return "signup";
	}
	
	@PostMapping("/signUpOk")
	@ResponseBody
	public String signUpOk(HttpServletRequest req) {
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		int cnt = mdao.signup(id, pw);
		System.out.println("inserted count [ " + cnt + " ] ");
		return String.valueOf(cnt);
	}
	
	@PostMapping("/loginOk")
	public String loginOk(HttpServletRequest req) {
		String id = req.getParameter("logid");
		String pw = req.getParameter("pwd");
		int cnt = mdao.userSelect(id, pw);
		System.out.println("selected count [ " + cnt + " ] ");
		if (cnt == 1) {
			HttpSession session = req.getSession();
			session.setAttribute("id",id);
		} else {
			HttpSession session = req.getSession();
			session.setAttribute("id","");
			return "redirect:/login";
		}
		return "redirect:/";
	}
	
	@GetMapping("/logout")
	public String doLogout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		return "redirect:/";
	}
}
