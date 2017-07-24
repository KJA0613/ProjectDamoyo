package com.bitschool.dto;

public class BScheduleDTO {
	private int sid;
	private String markedContents;
	private String startDate;
	private String endDate;
	private String detailedContents;
	
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getMarkedContents() {
		return markedContents;
	}
	public void setMarkedContents(String markedContents) {
		this.markedContents = markedContents;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getDetailedContents() {
		return detailedContents;
	}
	public void setDetailedContents(String detailedContents) {
		this.detailedContents = detailedContents;
	}
	
	@Override
	public String toString() {
		return "ScheduleDTO [markedContents=" + markedContents + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", detailedContents=" + detailedContents + "]";
	}
	
	
}
