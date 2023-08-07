package com.himedia.springboot;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmpDAO {
	ArrayList<EmpDTO> getEmpList();
	
	ArrayList<DepDTO> getDepList();
	
	IdDTO view(int id);
	
	ArrayList<SalaryDTO> salary(int min,int max);
}