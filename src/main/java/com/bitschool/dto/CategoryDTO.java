package com.bitschool.dto;

// 카테고리 DTO
public class CategoryDTO {
	
	private int categoryNo;			/* 시퀀스 */
	
	private String guserId;			/* 유저 아이디(외래키로 사용) */
	private int gatherNo;			/* 모임 번호(외래키로 사용)*/
	
	private String catTopOne;		/* 카테고리 대1*/
	private String catMidOne;		/* 카테고리 중1*/
	private String catBotOne;		/* 카테고리 소1*/
	
	private String catTopTwo;		/* 카테고리 대2*/
	private String catMidTwo;		/* 카테고리 중2*/
	private String catBotTwo;		/* 카테고리 소2*/
	
	private String catTopThr;		/* 카테고리 대3*/
	private String catMidThr;		/* 카테고리 중3*/
	private String catBotThr;		/* 카테고리 소3*/
	
	
	// Getter, Setter
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getGuserId() {
		return guserId;
	}
	public void setGuserId(String guserId) {
		this.guserId = guserId;
	}
	public int getGatherNo() {
		return gatherNo;
	}
	public void setGatherNo(int gatherNo) {
		this.gatherNo = gatherNo;
	}
	public String getCatTopOne() {
		return catTopOne;
	}
	public void setCatTopOne(String catTopOne) {
		this.catTopOne = catTopOne;
	}
	public String getCatMidOne() {
		return catMidOne;
	}
	public void setCatMidOne(String catMidOne) {
		this.catMidOne = catMidOne;
	}
	public String getCatBotOne() {
		return catBotOne;
	}
	public void setCatBotOne(String catBotOne) {
		this.catBotOne = catBotOne;
	}
	public String getCatTopTwo() {
		return catTopTwo;
	}
	public void setCatTopTwo(String catTopTwo) {
		this.catTopTwo = catTopTwo;
	}
	public String getCatMidTwo() {
		return catMidTwo;
	}
	public void setCatMidTwo(String catMidTwo) {
		this.catMidTwo = catMidTwo;
	}
	public String getCatBotTwo() {
		return catBotTwo;
	}
	public void setCatBotTwo(String catBotTwo) {
		this.catBotTwo = catBotTwo;
	}
	public String getCatTopThr() {
		return catTopThr;
	}
	public void setCatTopThr(String catTopThr) {
		this.catTopThr = catTopThr;
	}
	public String getCatMidThr() {
		return catMidThr;
	}
	public void setCatMidThr(String catMidThr) {
		this.catMidThr = catMidThr;
	}
	public String getCatBotThr() {
		return catBotThr;
	}
	public void setCatBotThr(String catBotThr) {
		this.catBotThr = catBotThr;
	}
	
	
	// toString > 테스트용 
	@Override
	public String toString() {
		return "CategoryDTO [categoryNo=" + categoryNo + ", guserId=" + guserId + ", gatherNo=" + gatherNo
				+ ", catTopOne=" + catTopOne + ", catMidOne=" + catMidOne + ", catBotOne=" + catBotOne + ", catTopTwo="
				+ catTopTwo + ", catMidTwo=" + catMidTwo + ", catBotTwo=" + catBotTwo + ", catTopThr=" + catTopThr
				+ ", catMidThr=" + catMidThr + ", catBotThr=" + catBotThr + "]";
	}

	/*@Override
	public String toString() {
		return "CategoryDTO [categoryNo=" + categoryNo + ", guserId=" + guserId + ", catTopOne=" + catTopOne
				+ ", catMidOne=" + catMidOne + ", catBotOne=" + catBotOne + ", catTopTwo=" + catTopTwo + ", catMidTwo="
				+ catMidTwo + ", catBotTwo=" + catBotTwo + ", catTopThr=" + catTopThr + ", catMidThr=" + catMidThr
				+ ", catBotThr=" + catBotThr + "]";
	}*/
	
}