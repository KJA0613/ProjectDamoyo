package com.bitschool.dto;

import java.sql.Timestamp;

public class BReplyDTO {
	private int replyNo;
	private String replyContents;
	private Timestamp replyDate;
	private int postNo;
	private String replyUserId;
	
	public String getReplyUserId() {
		return replyUserId;
	}
	public void setReplyUserId(String replyUserId) {
		this.replyUserId = replyUserId;
	}
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int repleyNo) {
		this.replyNo = repleyNo;
	}
	public String getReplyContents() {
		return replyContents;
	}
	public void setReplyContents(String replyContents) {
		this.replyContents = replyContents;
	}
	public Timestamp getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(Timestamp replyDate) {
		this.replyDate = replyDate;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	
	@Override
	public String toString() {
		return "ReplyDTO [replyNo=" + replyNo + ", replyContents=" + replyContents + ", replyDate=" + replyDate
				+ ", postNo=" + postNo + ", replyUserId=" + replyUserId + "]";
	}
}



