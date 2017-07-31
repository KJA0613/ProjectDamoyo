package com.bitschool.dto;

import java.io.Serializable;
import java.sql.Timestamp;


//[기업 DTO] 회원가입하면 생기는 기업 테이블
public class CompanyDTO implements Serializable{
	
	 private int comNo;                        /* 시퀀스  */
	 private String comId;					   /* 기업아이디  */
	 private String comPw; 					   /* 기업 비번  */
	 private String comName; 				   /* 기업명  */
	 private String comPhone; 				   /* 기업연락처  */
	 private String comEmail; 				   /* 기업이메일  */
	 private String comManager; 			   /* 기업담당자명  */
	 private int comSaNo; 					   /* 기업사업자번호 */
	 private int comZoneCode; 				   /* 기업우편번호  */
	 private String comRoadAddress;            /* 기업신주소(길) */ 
	 private String comJibunAddress; 		   /* 기업구주소(지번) */
	 private String comDetailAddress;          /* 기업상세주소 */
	 private String comCeoName; 			   /* 기업대표명 */
	 private Timestamp comDate; 			   /* 기업가입일 */
	 private String comCode;                   /* 기업 구분 코드 > 개인회원: A, 광고주(기업): B */
	 
	 
		public int getComNo() {
			return comNo;
		}
	
		public void setComNo(int comNo) {
			this.comNo = comNo;
		}
	
		public String getComId() {
			return comId;
		}
	
		public void setComId(String comId) {
			this.comId = comId;
		}
	
		public String getComPw() {
			return comPw;
		}
	
		public void setComPw(String comPw) {
			this.comPw = comPw;
		}
	
		public String getComName() {
			return comName;
		}
	
		public void setComName(String comName) {
			this.comName = comName;
		}
	
		public String getComPhone() {
			return comPhone;
		}
	
		public void setComPhone(String comPhone) {
			this.comPhone = comPhone;
		}
	
		public String getComEmail() {
			return comEmail;
		}
	
		public void setComEmail(String comEmail) {
			this.comEmail = comEmail;
		}
	
		public String getComManager() {
			return comManager;
		}
	
		public void setComManager(String comManager) {
			this.comManager = comManager;
		}
	
		public int getComSaNo() {
			return comSaNo;
		}
	
		public void setComSaNo(int comSaNo) {
			this.comSaNo = comSaNo;
		}
	
		public int getComZoneCode() {
			return comZoneCode;
		}
	
		public void setComZoneCode(int comZoneCode) {
			this.comZoneCode = comZoneCode;
		}
	
		public String getComRoadAddress() {
			return comRoadAddress;
		}
	
		public void setComRoadAddress(String comRoadAddress) {
			this.comRoadAddress = comRoadAddress;
		}
	
		public String getComJibunAddress() {
			return comJibunAddress;
		}
	
		public void setComJibunAddress(String comJibunAddress) {
			this.comJibunAddress = comJibunAddress;
		}
	
		public String getComCeoName() {
			return comCeoName;
		}
	
		public void setComCeoName(String comCeoName) {
			this.comCeoName = comCeoName;
		}
	
		public Timestamp getComDate() {
			return comDate;
		}
	
		public void setComDate(Timestamp comDate) {
			this.comDate = comDate;
		}
	
		public String getComCode() {
			return comCode;
		}
	
		public void setComCode(String comCode) {
			this.comCode = comCode;
		}
		
		
	
		public String getComDetailAddress() {
			return comDetailAddress;
		}

		public void setComDetailAddress(String comDetailAddress) {
			this.comDetailAddress = comDetailAddress;
		}

		@Override
		public String toString() {
			return "CompanyDTO [comNo=" + comNo + ", comId=" + comId + ", comPw=" + comPw + ", comName=" + comName
					+ ", comPhone=" + comPhone + ", comEmail=" + comEmail + ", comManager=" + comManager + ", comSaNo="
					+ comSaNo + ", comZoneCode=" + comZoneCode + ", comRoadAddress=" + comRoadAddress
					+ ", comJibunAddress=" + comJibunAddress + ", comDetailAddress=" + comDetailAddress
					+ ", comCeoName=" + comCeoName + ", comDate=" + comDate + ", comCode=" + comCode + "]";
		}

		
		
	 	 
	 
}
