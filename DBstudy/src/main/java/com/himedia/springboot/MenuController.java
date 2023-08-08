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

@Controller
public class MenuController {
	
	@Autowired
	private MenuDAO mdao;
	
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
	
	@GetMapping("/addmenu")
	public String display() {
		return "addmenu";
	}
	@PostMapping("/insert")
	public String doInsert(HttpServletRequest req, Model model) {
		String name= req.getParameter("name");
		int price = Integer.parseInt(req.getParameter("price"));
		int cnt = mdao.insert(name, price);
		System.out.println("inserted count [ " + cnt + " ] ");
		
		ArrayList<MenuDTO> alMenu = mdao.select();
		model.addAttribute("menuList", alMenu);
		return "addmenu";
	}
	
	@GetMapping("/addmenu2")
	public String display2() {
		return "addmenu2";
	}
	@PostMapping("/insert2")
	@ResponseBody
	public String doInsert2(HttpServletRequest req) {
		String name =	 req.getParameter("name");
		int price = Integer.parseInt(req.getParameter("price"));
		int cnt = mdao.insert(name, price);
		System.out.println("inserted count [ " + cnt + " ] ");
		
		return ""+cnt;
	}
	
	@PostMapping("/delete")
	public String doDelete(HttpServletRequest req) {
		int num = Integer.parseInt(req.getParameter("num"));
		mdao.delete(num);

		return "redirect:addmenu2";
	}
}
