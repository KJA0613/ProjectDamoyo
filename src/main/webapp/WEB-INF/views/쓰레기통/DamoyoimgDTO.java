package com.bitschool.dto;

public class DamoyoimgDTO {
	int damoyoimgNo;
	int postNo;
	String damoyoimgName;
	String damoyoimgCode;
	String guserId;
	
	public int getDamoyoimgNo() {
		return damoyoimgNo;
	}
	public void setDamoyoimgNo(int damoyoimgNo) {
		this.damoyoimgNo = damoyoimgNo;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public String getDamoyoimgName() {
		return damoyoimgName;
	}
	public void setDamoyoimgName(String damoyoimgName) {
		this.damoyoimgName = damoyoimgName;
	}
	public String getDamoyoimgCode() {
		return damoyoimgCode;
	}
	public void setDamoyoimgCode(String damoyoimgCode) {
		this.damoyoimgCode = damoyoimgCode;
	}
	public String getGuserId() {
		return guserId;
	}
	public void setGuserId(String guserId) {
		this.guserId = guserId;
	}
	
	@Override
	public String toString() {
		return "DamoyoimgDTO [damoyoimgNo=" + damoyoimgNo + ", postNo=" + postNo + ", damoyoimgName=" + damoyoimgName
				+ ", damoyoimgCode=" + damoyoimgCode + ", guserId=" + guserId + "]";
	}
	
	
}
