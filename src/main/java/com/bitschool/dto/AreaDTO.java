package com.bitschool.dto;

// 희망지역(3군데) DTO
public class AreaDTO {
	
	private int areaNo;				/* 시퀀스 */
	private String guserId;			/* 유저 아이디(외래키로 사용) */
	
	private String bigarea1;			/* 희망지역1 > 시*/
	private String area;			/* 희망지역1 > 구, 군 등 */
	
	private String bigarea2;		/* 희망지역2 > 시*/
	private String areaP;			/* 희망지역2 > 구, 군 등 */
	
	private String bigarea3;		/* 희망지역3 > 시*/
	private String areaPP;			/* 희망지역3 > 구, 군 등 */
	
	
	// Getter, Setter
	public int getAreaNo() {
		return areaNo;
	}
	public void setAreaNo(int areaNo) {
		this.areaNo = areaNo;
	}
	public String getGuserId() {
		return guserId;
	}
	public void setGuserId(String guserId) {
		this.guserId = guserId;
	}
	public String getBigarea1() {
		return bigarea1;
	}
	public void setBigarea1(String bigarea1) {
		this.bigarea1 = bigarea1;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getBigarea2() {
		return bigarea2;
	}
	public void setBigarea2(String bigarea2) {
		this.bigarea2 = bigarea2;
	}
	public String getAreaP() {
		return areaP;
	}
	public void setAreaP(String areaP) {
		this.areaP = areaP;
	}
	public String getBigarea3() {
		return bigarea3;
	}
	public void setBigarea3(String bigarea3) {
		this.bigarea3 = bigarea3;
	}
	public String getAreaPP() {
		return areaPP;
	}
	public void setAreaPP(String areaPP) {
		this.areaPP = areaPP;
	}


	// toString > 테스트용
	@Override
	public String toString() {
		return "AreaDTO [areaNo=" + areaNo + ", guserId=" + guserId + ", bigarea1=" + bigarea1 + ", area=" + area
				+ ", bigarea2=" + bigarea2 + ", areaP=" + areaP + ", bigarea3=" + bigarea3 + ", areaPP=" + areaPP + "]";
	}	
	
}