package com.bitschool.dto;

public class VisitorTimeDTO {
	private String visitorTime;
	private int timeCount;
	
	public String getVisitorTime() {
		return visitorTime;
	}
	public void setVisitorTime(String visitorTime) {
		this.visitorTime = visitorTime;
	}
	public int getTimeCount() {
		return timeCount;
	}
	public void setTimeCount(int timeCount) {
		this.timeCount = timeCount;
	}
	
	@Override
	public String toString() {
		return "VisitorTimeDTO [visitorTime=" + visitorTime + ", timeCount=" + timeCount + "]";
	}
	
	

}
