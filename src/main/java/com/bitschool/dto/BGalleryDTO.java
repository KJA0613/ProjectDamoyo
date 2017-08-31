package com.bitschool.dto;

import java.sql.Timestamp;

public class BGalleryDTO {
	private int imageNo;
	private String imageTitle;
	private String userId;
	private Timestamp imageDate;
	private String uploadImg;
	private String imageContents;
	private int blogId;
	
	public int getBlogId() {
		return blogId;
	}
	public void setBlogId(int blogId) {
		this.blogId = blogId;
	}
	public String getImageContents() {
		return imageContents;
	}
	public void setImageContents(String imageContents) {
		this.imageContents = imageContents;
	}
	public int getImageNo() {
		return imageNo;
	}
	public void setImageNo(int imageNo) {
		this.imageNo = imageNo;
	}
	public String getImageTitle() {
		return imageTitle;
	}
	public void setImageTitle(String imageTitle) {
		this.imageTitle = imageTitle;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Timestamp getImageDate() {
		return imageDate;
	}
	public void setImageDate(Timestamp imageDate) {
		this.imageDate = imageDate;
	}
	public String getUploadImg() {
		return uploadImg;
	}
	public void setUploadImg(String uploadImg) {
		this.uploadImg = uploadImg;
	}
	
	@Override
	public String toString() {
		return "GalleryDTO [imageNo=" + imageNo + ", imageTitle=" + imageTitle + ", userId=" + userId + ", imageDate="
				+ imageDate + ", uploadImg=" + uploadImg + "]";
	}
	
}
