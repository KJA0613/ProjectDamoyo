package com.bitschool.dto;

public class BScheduleFormatDTO {
	private int id;
	private String title;
	private String start;
	private String end;
	transient private String detailedContents;
	
	public String getDetailedContents() {
		return detailedContents;
	}
	public void setDetailedContents(String detailedContents) {
		this.detailedContents = detailedContents;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	
	@Override
	public String toString() {
		return "ScheduleFormatDTO [title=" + title + ", start=" + start + ", end=" + end + "]";
	}
}
