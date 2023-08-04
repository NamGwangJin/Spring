package com.himedia.springboot;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AreaController {
	
	@GetMapping("/first")
	public String doFirst() {
		return "area/first";
	}
	
	@GetMapping("/second")
	public String dosecond() {
		return "area/second";
	}
	
	@GetMapping("/third")
	public String dothird() {
		return "area/third";
	}
	
	@GetMapping("/fourth")
	public String dofourth() {
		return "area/fourth";
	}
	
	@GetMapping("/testone")
	public String showHome() {
		return "test1"; // JSP 파일 이름(확장명 제외)
	}
	
	@GetMapping("/testtwo")
	public String showSecond() {
		return "sub/test2";
	}
	
	@GetMapping("/showtable")
	public String showTable() {
		return "showtable";
	}
	
	@GetMapping("/gettable")
	public String getTable() {
		return "gettable";
	}
	
	@GetMapping("/getfour")
	public String getfour() {
		return "getfour";
	}
	
	@GetMapping("/showfour")
	public String showfour() {
		return "showfour";
	}
}
