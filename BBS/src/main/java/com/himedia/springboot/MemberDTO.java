package com.himedia.springboot;

import lombok.Data;

@Data
public class MemberDTO {
	String userid;
	String selficon;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getSelficon() {
		return selficon;
	}
	public void setSelficon(String selficon) {
		this.selficon = selficon;
	}
	
	
}
