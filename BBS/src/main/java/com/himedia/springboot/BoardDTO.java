package com.himedia.springboot;

import lombok.Data;

@Data
public class BoardDTO {
	int seqno;
	String title;
	String content;
	String writer;
	int hit;
	String created;
	String updated;
}
