package com.bitschool.dto;

public class BPostNoInfoDTO {
	int postNo;
	String boardName;
	int blogId;
	
	public int getBlogId() {
		return blogId;
	}
	public void setBlogId(int blogId) {
		this.blogId = blogId;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	
	@Override
	public String toString() {
		return "BPostNoInfoDTO [postNo=" + postNo + ", boardName=" + boardName + ", blogId=" + blogId + "]";
	}
}
