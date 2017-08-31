package com.bitschool.dto;

public class BPageVO {
	private int start;
	private int end;
	private String boardName;
	private int blogId;
	private String blogName;
	
	public String getBlogName() {
		return blogName;
	}
	public void setBlogName(String blogName) {
		this.blogName = blogName;
	}
	public int getBlogId() {
		return blogId;
	}
	public void setBlogId(int blogId) {
		this.blogId = blogId;
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	public BPageVO(){}
	public BPageVO(int start,int end){
		this.start = start;
		this.end = end;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	
	@Override
	public String toString() {
		return "BPageVO [start=" + start + ", end=" + end + ", boardName=" + boardName + ", blogId=" + blogId
				+ ", blogName=" + blogName + "]";
	}
	
	
}
