package com.himedia.springboot;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MenuDAO {
	ArrayList<MenuDTO> select();
	int insert(String name, int price);
	
	ArrayList<OutgoDTO> salesSelect();
	int salesInsert(String mobile, int total, String date);
	
	int delete(int num);
	
	int update(int num, String name, int price);
	
	int signup(String id, String pw);
	int userSelect(String id, String pw);
}
