package com.bitschool.dto;


public class GatheringDTO {

	private int gatherNo;
	private String gatherSubject;
	private String gatherCategory;
	
	//@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "hh:mm", timezone = "Asia/Seoul")

	private String gatherWrite;
	private String gatherSdate;
	private String gatherEdate;
	
	private String gatherDay;
	private String gatherArea;
	private int gatherParti;
	private String gatherContent;
	private String gatherImg;
	private String guserId;
	
	private String gatherState;
	
	public int getGatherNo() {
		return gatherNo;
	}

	public void setGatherNo(int gatherNo) {
		this.gatherNo = gatherNo;
	}

	public String getGatherSubject() {
		return gatherSubject;
	}

	public void setGatherSubject(String gatherSubject) {
		this.gatherSubject = gatherSubject;
	}

	public String getGatherCategory() {
		return gatherCategory;
	}

	public void setGatherCategory(String gatherCategory) {
		this.gatherCategory = gatherCategory;
	}

	
	
	public String getGatherWrite() {
		return gatherWrite;
	}

	public void setGatherWrite(String gatherWrite) {
		this.gatherWrite = gatherWrite;
	}

	public String getGatherSdate() {
		return gatherSdate;
	}

	public void setGatherSdate(String gatherSdate) {
		this.gatherSdate = gatherSdate;
	}

	public String getGatherEdate() {
		return gatherEdate;
	}

	public void setGatherEdate(String gatherEdate) {
		this.gatherEdate = gatherEdate;
	}

	

	public String getGatherDay() {
		return gatherDay;
	}

	public void setGatherDay(String gatherDay) {
		this.gatherDay = gatherDay;
	}

	public String getGatherArea() {
		return gatherArea;
	}

	public void setGatherArea(String gatherArea) {
		this.gatherArea = gatherArea;
	}

	public int getGatherParti() {
		return gatherParti;
	}

	public void setGatherParti(int gatherParti) {
		this.gatherParti = gatherParti;
	}

	public String getGatherContent() {
		return gatherContent;
	}

	public void setGatherContent(String gatherContent) {
		this.gatherContent = gatherContent;
	}

	public String getGatherImg() {
		return gatherImg;
	}

	public void setGatherImg(String gatherImg) {
		this.gatherImg = gatherImg;
	}

	public String getGuserId() {
		return guserId;
	}

	public void setGuserId(String guserId) {
		this.guserId = guserId;
	}

	public String getDate(String sdate, int code){
				
		if(code==1){
			sdate = sdate.substring(0,16);	
		}else if(code==2){
			sdate = sdate.substring(0,10);
		}else if(code==3){
			sdate = sdate.substring(12,16);
		}
		
		return sdate;
	}
	
	public String getGatherState() {
		return gatherState;
	}

	public void setGatherState(String gatherState) {
		this.gatherState = gatherState;
	}

	@Override
	public String toString() {
		return "GatheringDTO [gatherNo=" + gatherNo + ", gatherSubject=" + gatherSubject + ", gatherCategory="
				+ gatherCategory + ", gatherWrite=" + gatherWrite + ", gatherSdate=" + gatherSdate + ", gatherEdate="
				+ gatherEdate + ", gatherDay=" + gatherDay + ", gatherArea=" + gatherArea + ", gatherParti="
				+ gatherParti + ", gatherContent=" + gatherContent + ", gatherImg=" + gatherImg + ", guserId=" + guserId
				+ ", gatherState=" + gatherState + "]";
	}
	
	


}
