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
	private String boardName;
	private int blogId;
	private String filePath;
	
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public int getBlogId() {
		return blogId;
	}
	public void setBlogId(int blogId) {
		this.blogId = blogId;
	}
	public int getReplyCounts() {
		return replyCounts;
	}
	public void setReplyCounts(int replyCounts) {
		this.replyCounts = replyCounts;
	}
	
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
		return "BPostDTO [postTitle=" + postTitle + ", postContents=" + postContents + ", userId=" + userId
				+ ", filePath=" + filePath + "]";
	}
	
}
