package com.himedia.springboot;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyController {
	
	@Autowired
	private EmpDAO empdao;
	
	@GetMapping()
	public String root() {
		return "home";
	}
	
	@GetMapping("/emplist") 
	public String empList(Model model) {
		ArrayList<EmpDTO> alEmp =  empdao.getEmpList();
		model.addAttribute("list",alEmp);
		return "list";
	}
	
	@GetMapping("/deplist")
	public String depList(Model model) {
		ArrayList<DepDTO> alDep =  empdao.getDepList();
		model.addAttribute("list",alDep);
		return "dlist";
	}
}