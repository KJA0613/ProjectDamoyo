package com.bitschool.dto;

import java.sql.Timestamp;

// 장소 등록
public class PlaceDTO {
	
	private int placeNo;						/* 장소 번호 */
	private String placeImage; 					/* 장소 이미지 */
	private String placeType; 					/* 장소 유형 */
	private String placeName;					/* 장소 이름 */
	private String placeIntro;					/* 장소 소개 */
	private String placeAddr1;					/* 주소1, 우편번호 */
	private String placeAddr2;					/* 주소2, 도로명  */
	private String placeAddr3;					/* 주소2, 지번  */
	private String placeAddr4;					/* 주소3, 상세주소 (null 가능)  */
	private String placeTel;					/* 장소 전화번호 */
	private String placeURL;					/* 장소 홈페이지 주소*/
	private int placePerCnt;					/* 수용 인원 */
	private String placeUseTime;				/* 이용가능 시간 */
	private String placeNotUseDay;				/* 정기휴무 */
	private String placeCost;					/* 비용 : 시간단위/일단위/월단위/무료 > 널가능, 비워났을 때, 돈 입력 안해놨을 때, 사실 애매함*/	
	private String placeCostChoice;				/* 비용: 시간단위/일단위/월단위/무료 > 체크박스 선택*/
	private String placeParking;				/* 주차 유무  */
	private String placeContent;				/* 상세 설명 */
	private Timestamp placeCreateDate;			/* 장소 개설일 */
	private String comId;						/* 광고주 아이디 */
	
	
	public int getPlaceNo() {
		return placeNo;
	}
	public void setPlaceNo(int placeNo) {
		this.placeNo = placeNo;
	}
	public String getPlaceImage() {
		return placeImage;
	}
	public void setPlaceImage(String placeImage) {
		this.placeImage = placeImage;
	}
	public String getPlaceType() {
		return placeType;
	}
	public void setPlaceType(String placeType) {
		this.placeType = placeType;
	}
	public String getPlaceName() {
		return placeName;
	}
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
	public String getPlaceIntro() {
		return placeIntro;
	}
	public void setPlaceIntro(String placeIntro) {
		this.placeIntro = placeIntro;
	}
	public String getPlaceAddr1() {
		return placeAddr1;
	}
	public void setPlaceAddr1(String placeAddr1) {
		this.placeAddr1 = placeAddr1;
	}
	public String getPlaceAddr2() {
		return placeAddr2;
	}
	public void setPlaceAddr2(String placeAddr2) {
		this.placeAddr2 = placeAddr2;
	}
	public String getPlaceAddr3() {
		return placeAddr3;
	}
	public void setPlaceAddr3(String placeAddr3) {
		this.placeAddr3 = placeAddr3;
	}
	public String getPlaceAddr4() {
		return placeAddr4;
	}
	public void setPlaceAddr4(String placeAddr4) {
		this.placeAddr4 = placeAddr4;
	}
	public String getPlaceTel() {
		return placeTel;
	}
	public void setPlaceTel(String placeTel) {
		this.placeTel = placeTel;
	}
	public String getPlaceURL() {
		return placeURL;
	}
	public void setPlaceURL(String placeURL) {
		this.placeURL = placeURL;
	}
	public int getPlacePerCnt() {
		return placePerCnt;
	}
	public void setPlacePerCnt(int placePerCnt) {
		this.placePerCnt = placePerCnt;
	}
	public String getPlaceUseTime() {
		return placeUseTime;
	}
	public void setPlaceUseTime(String placeUseTime) {
		this.placeUseTime = placeUseTime;
	}
	public String getPlaceNotUseDay() {
		return placeNotUseDay;
	}
	public void setPlaceNotUseDay(String placeNotUseDay) {
		this.placeNotUseDay = placeNotUseDay;
	}
	public String getPlaceCost() {
		return placeCost;
	}
	public void setPlaceCost(String placeCost) {
		this.placeCost = placeCost;
	}
	public String getPlaceCostChoice() {
		return placeCostChoice;
	}
	public void setPlaceCostChoice(String placeCostChoice) {
		this.placeCostChoice = placeCostChoice;
	}
	public String getPlaceParking() {
		return placeParking;
	}
	public void setPlaceParking(String placeParking) {
		this.placeParking = placeParking;
	}
	public String getPlaceContent() {
		return placeContent;
	}
	public void setPlaceContent(String placeContent) {
		this.placeContent = placeContent;
	}
	public Timestamp getPlaceCreateDate() {
		return placeCreateDate;
	}
	public void setPlaceCreateDate(Timestamp placeCreateDate) {
		this.placeCreateDate = placeCreateDate;
	}
	public String getComId() {
		return comId;
	}
	public void setComId(String comId) {
		this.comId = comId;
	}
	
	
	
	@Override
	public String toString() {
		return "PlaceDTO [placeNo=" + placeNo + ", placeImage=" + placeImage + ", placeType=" + placeType
				+ ", placeName=" + placeName + ", placeIntro=" + placeIntro + ", placeAddr1=" + placeAddr1
				+ ", placeAddr2=" + placeAddr2 + ", placeAddr3=" + placeAddr3 + ", placeAddr4=" + placeAddr4
				+ ", placeTel=" + placeTel + ", placeURL=" + placeURL + ", placePerCnt=" + placePerCnt
				+ ", placeUseTime=" + placeUseTime + ", placeNotUseDay=" + placeNotUseDay + ", placeCost=" + placeCost
				+ ", placeCostChoice=" + placeCostChoice + ", placeParking=" + placeParking + ", placeContent="
				+ placeContent + ", placeCreateDate=" + placeCreateDate + ", comId=" + comId + "]";
	}
	
}