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
	
	@GetMapping("/ajaxlist")
	public String ajaxList() {
		return "ajaxlist";
	}
	@PostMapping("/emplist")
	@ResponseBody
	public String empList() {
		ArrayList<EmpDTO> alEmp = empdao.getEmpList();
		JSONArray ja = new JSONArray();
		for(int i=0; i<alEmp.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("id", alEmp.get(i).employee_id);
			jo.put("name", alEmp.get(i).emp_name);
			jo.put("sal", alEmp.get(i).salary);
			jo.put("manid", alEmp.get(i).manager_id);
			jo.put("depid", alEmp.get(i).department_id);
			ja.add(jo);
		}
		return ja.toJSONString();
	}
	@PostMapping("/deplist")
	@ResponseBody
	public String depList() {
		ArrayList<DepDTO> alDep = empdao.getDepList();
		JSONArray ja = new JSONArray();
		for(int i=0; i<alDep.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("depid", alDep.get(i).department_id);
			jo.put("depName", alDep.get(i).department_name);
			jo.put("manid", alDep.get(i).manager_id);
			jo.put("manName", alDep.get(i).emp_name);
			ja.add(jo);
		}
		return ja.toJSONString();
	}
}