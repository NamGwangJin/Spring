package com.himedia.springboot;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardDAO {
	ArrayList<BoardDTO> listSize();
	
	ArrayList<BoardDTO> getList(int start, int pSize);
	
	BoardDTO view(int seqno);
	
	void hitUp(int seqno);
	
	void delPost(int seqno);
	
	void insPost(String title, String content, String writer, String created, String updated);
	
	void udPost(int seqno, String title, String content, String updated);
	
	int getTotal();
	
	int signup(String id, String pw);
	
	MemberDTO userSelect(String id, String pw);
}
