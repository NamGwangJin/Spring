package com.himedia.springboot;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MenuDAO {
	int insert(String mName, int mPrice);
	
	ArrayList<MenuDTO> select();
	
	void delete(int num);
}
