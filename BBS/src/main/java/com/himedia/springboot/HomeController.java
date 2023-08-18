package com.himedia.springboot;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class HomeController {
	@Autowired
	private BoardDAO bdao;
	
	@GetMapping("/")
	public String home(HttpServletRequest req, Model model) {
		ArrayList<BoardDTO> bList = bdao.getList();
		model.addAttribute("bList",bList);
		return "home";
	}
	@GetMapping("/view")
	public String view(HttpServletRequest req, Model model) {
		int seqno = Integer.parseInt(req.getParameter("seqno"));
		bdao.hitUp(seqno);
		BoardDTO bdto = bdao.view(seqno);
		model.addAttribute("bPost",bdto);
		return "view";
	}
}