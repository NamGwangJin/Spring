package com.himedia.springboot;

public class member {
	String userid;
	String passcode1;
	String passcode2;
	String name;
	String mobile;
	String birthday;
	String gender;
	String interest[];
	String region[];
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasscode1() {
		return passcode1;
	}
	public void setPasscode1(String passcode1) {
		this.passcode1 = passcode1;
	}
	public String getPasscode2() {
		return passcode2;
	}
	public void setPasscode2(String passcode2) {
		this.passcode2 = passcode2;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String[] getInterest() {
		return interest;
	}
	public void setInterest(String[] interest) {
		this.interest = interest;
	}
	public String[] getRegion() {
		return region;
	}
	public void setRegion(String[] region) {
		this.region = region;
	}
	
	
}
