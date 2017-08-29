package com.bitschool.dto;

public class VisitorWeekDTO {
	private String visitorDay;
	private int dayCount;
	
	public String getVisitorDay() {
		return visitorDay;
	}
	public void setVisitorDay(String visitorDay) {
		this.visitorDay = visitorDay;
	}
	public int getDayCount() {
		return dayCount;
	}
	public void setDayCount(int dayCount) {
		this.dayCount = dayCount;
	}
	
	@Override
	public String toString() {
		return "VisitorDTO [visitorDay=" + visitorDay + ", dayCount=" + dayCount + "]";
	}
	
	
}
