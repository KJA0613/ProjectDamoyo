package com.bitschool.dto;

public class RecommGatherDTO {

	private int recommgatherNo;
	private String recommgatherName;
	private String recommgatherCode;
	private String recommgatherDate;
	private String guserId;

	public String getRecommgatherName() {
		return recommgatherName;
	}

	public void setRecommgatherName(String recommgatherName) {
		this.recommgatherName = recommgatherName;
	}

	public String getRecommgatherCode() {
		return recommgatherCode;
	}

	public void setRecommgatherCode(String recommgatherCode) {
		this.recommgatherCode = recommgatherCode;
	}

	public String getGuserId() {
		return guserId;
	}

	public void setGuserId(String guserId) {
		this.guserId = guserId;
	}

	public String getRecommgatherDate() {
		return recommgatherDate;
	}

	public void setRecommgatherDate(String recommgatherDate) {
		this.recommgatherDate = recommgatherDate;
	}


	@Override
	public String toString() {
		return "RecommGatherDTO [recommgatherName=" + recommgatherName + ", recommgatherCode=" + recommgatherCode
				+ ", guserId=" + guserId + "]";
	}

	public int getRecommgatherNo() {
		return recommgatherNo;
	}

	public void setRecommgatherNo(int recommgatherNo) {
		this.recommgatherNo = recommgatherNo;
	}
	

}
