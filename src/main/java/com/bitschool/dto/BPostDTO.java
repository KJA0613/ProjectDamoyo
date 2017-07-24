package com.bitschool.dto;

import java.sql.Timestamp;

public class BPostDTO {
	private int postNo;
	private String postTitle;
	private String postContents;
	private String userId;
	private Timestamp postDate;
	private int postCount;
	private int postRecommend;
	private int replyCounts;
	
	public int getReplyCounts() {
		return replyCounts;
	}
	public void setReplyCounts(int replyCounts) {
		this.replyCounts = replyCounts;
	}
	private String boardName;
	
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public String getPostContents() {
		return postContents;
	}
	public void setPostContents(String postContents) {
		this.postContents = postContents;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Timestamp getPostDate() {
		return postDate;
	}
	public void setPostDate(Timestamp postDate) {
		this.postDate = postDate;
	}
	public int getPostCount() {
		return postCount;
	}
	public void setPostCount(int postCount) {
		this.postCount = postCount;
	}
	public int getPostRecommend() {
		return postRecommend;
	}
	public void setPostRecommend(int postRecommend) {
		this.postRecommend = postRecommend;
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	
	@Override
	public String toString() {
		return "PostDTO [postTitle=" + postTitle + ", postContents=" + postContents + ", userId=" + userId + "]";
	}
	
	
}
