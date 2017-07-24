package com.bitschool.dto;

import java.io.Serializable;
import java.sql.Timestamp;

// [회원 DTO] 회원가입하면 생기는 유저 테이블
public class PersonDTO implements Serializable{

	private int guserNo; 					/* 시퀀스 */
	private String guserId;					/* 유저 아이디 */
	private String guserPw;					/* 유저 비밀번호 */
	private String guserName;				/* 유저 이름 */
	private String guserGender;				/* 유저 성별 */
	private String guserPhone;			    /* 유저 연락처 */
	private String guserEmail;  	 		/* 유저 이메일  */
	private Timestamp guserDate;			/* 유저 가입날짜 */
	private char guserCode; 				/* 유저 구분 코드 > 개인회원: A, 광고주(기업): B, 관리자: Z */		
	
	
	// Getter, Setter
	public int getGuserNo() {
		return guserNo;
	}
	public void setGuserNo(int guserNo) {
		this.guserNo = guserNo;
	}
	public String getGuserId() {
		return guserId;
	}
	public void setGuserId(String guserId) {
		this.guserId = guserId;
	}
	public String getGuserPw() {
		return guserPw;
	}
	public void setGuserPw(String guserPw) {
		this.guserPw = guserPw;
	}
	public String getGuserName() {
		return guserName;
	}
	public void setGuserName(String guserName) {
		this.guserName = guserName;
	}
	public String getGuserGender() {
		return guserGender;
	}
	public void setGuserGender(String guserGender) {
		this.guserGender = guserGender;
	}
	public String getGuserPhone() {
		return guserPhone;
	}
	public void setGuserPhone(String guserPhone) {
		this.guserPhone = guserPhone;
	}
	public String getGuserEmail() {
		return guserEmail;
	}
	public void setGuserEmail(String guserEmail) {
		this.guserEmail = guserEmail;
	}
	public Timestamp getGuserDate() {
		return guserDate;
	}
	public void setGuserDate(Timestamp guserDate) {
		this.guserDate = guserDate;
	}	
	public char getGuserCode() {
		return guserCode;
	}
	public void setGuserCode(char guserCode) {
		this.guserCode = guserCode;
	}
	
	// toString > 테스트용
	@Override
	public String toString() {
		return "DamoyoPersonDTO [guserNo=" + guserNo + ", guserId=" + guserId + ", guserPw=" + guserPw + ", guserName="
				+ guserName + ", guserGender=" + guserGender + ", guserPhone=" + guserPhone + ", guserEmail="
				+ guserEmail + ", guserDate=" + guserDate + ", guserCode=" + guserCode + "]";
	}
	
}