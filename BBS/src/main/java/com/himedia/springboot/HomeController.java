package com.himedia.springboot;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class HomeController {
	Date date = new Date();
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String now = formatter.format(date);
	
	@Autowired
	private BoardDAO bdao;
	
	@GetMapping("/")
	public String home(HttpServletRequest req, Model model) {
		int start, pSize, pNo, lastNo = 1;
		String page = req.getParameter("pageno");
		if(page==null || page.equals("")) {
			pNo = 1;
		} else {
			pNo = Integer.parseInt(page);
		}
		start = ( pNo - 1 ) * 10;
		pSize = 10;
		
		ArrayList<BoardDTO> list = bdao.listSize();
		ArrayList<BoardDTO> bList = bdao.getList(start, pSize);
		if( list.size() / pSize <= 1 ) {
			lastNo = 1;
		} else {
			lastNo = (int) Math.ceil((double) list.size() / pSize );
		}
		
		String firstLast = String.valueOf(pNo) + " / " + String.valueOf(lastNo);
		model.addAttribute("pageCount", firstLast);
		
		int cnt = bdao.getTotal();
		int pagecount = (int) Math.ceil((double) cnt/10 );
		String pagestr = "";
		for(int i=1; i<=pagecount; i++) {
			if (i==pNo) {
				pagestr += "<a style='font-size:30px;'>" + i + "</a>&nbsp;";
			} else {
				pagestr += "<a style='font-weight:bold;' href='/?pageno="+i+"'>"+i+"</a>&nbsp;";
			}
		}
		model.addAttribute("pagestr",pagestr);
		
		if(start==0) {
			model.addAttribute("prev","");
			model.addAttribute("next","<a href='/?pageno=" + (pNo+1) +"'>다음 페이지</a>");
			model.addAttribute("bList", bList);
			return "home";
		} else if(bList.size()<=10 && pNo == lastNo) {
			model.addAttribute("prev","<a href='/?pageno=" + (pNo-1) +"'>이전 페이지</a>");
			model.addAttribute("next","");
			model.addAttribute("bList", bList);
			return "home";
		} else {
			model.addAttribute("prev","<a href='/?pageno=" + (pNo-1) +"'>이전 페이지</a>");
			model.addAttribute("next","<a href='/?pageno=" + (pNo+1) +"'>다음 페이지</a>");
			model.addAttribute("bList", bList);
			return "home";
		}
	}
	
	@GetMapping("/view")
	public String view(HttpServletRequest req, Model model) {
		int seqno = Integer.parseInt(req.getParameter("seqno"));
		bdao.hitUp(seqno);
		BoardDTO bdto = bdao.view(seqno);
		model.addAttribute("bPost",bdto);
		return "view";
	}
	
	@GetMapping("/delete")
	public String delete(HttpServletRequest req) {
		int seqno = Integer.parseInt(req.getParameter("seqno"));
		bdao.delPost(seqno);
		return "redirect:/";
	}
	
	@GetMapping("/write")
	public String write(HttpServletRequest req, Model model) {
		return "write";
	}
	@PostMapping("/insert")
	public String insert(HttpServletRequest req) {
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		bdao.insPost(title, content, "writer", now, now);
		return "redirect:/";
	}
	
	@GetMapping("/update")
	public String update(HttpServletRequest req, Model model) {
		int seqno = Integer.parseInt(req.getParameter("seqno"));
		BoardDTO bdto = bdao.view(seqno);
		model.addAttribute("bPost",bdto);
		return "update";
	}
	@PostMapping("/modify")
	public String modfiy(HttpServletRequest req) {
		int seqno = Integer.parseInt(req.getParameter("seqno"));
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		bdao.udPost(seqno, title, content, now);
		return "redirect:/";
	}
}