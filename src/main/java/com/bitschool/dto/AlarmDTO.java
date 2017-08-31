package com.bitschool.dto;

public class AlarmDTO {
	
	private int alarmNo; // 시퀀스
	private String alarmIndex; // 내용
	private String alarmDate; // 알람날짜 , sysdate
	private String alarmId;	// 아이디
	private String alarmRead; // 읽었는지?
	private int alarmGatherNo;//글번호
	private int alarmGrade; //1은 게시글 2는 블로그 
	
	public int getAlarmNo() {
		return alarmNo;
	}
	public void setAlarmNo(int alarmNo) {
		this.alarmNo = alarmNo;
	}
	public String getAlarmIndex() {
		return alarmIndex;
	}
	public void setAlarmIndex(String alarmIndex) {
		this.alarmIndex = alarmIndex;
	}
	public String getAlarmDate() {
		return alarmDate;
	}
	public void setAlarmDate(String alarmDate) {
		this.alarmDate = alarmDate;
	}
	public String getAlarmId() {
		return alarmId;
	}
	public void setAlarmId(String alarmId) {
		this.alarmId = alarmId;
	}
	public String getAlarmRead() {
		return alarmRead;
	}
	public void setAlarmRead(String alarmRead) {
		this.alarmRead = alarmRead;
	}
	
	public int getAlarmGatherNo() {
		return alarmGatherNo;
	}
	public void setAlarmGatherNo(int gatherNo) {
		this.alarmGatherNo = gatherNo;
	}
	
	public int getAlarmGrade() {
		return alarmGrade;
	}
	public void setAlarmGrade(int alarmGrade) {
		this.alarmGrade = alarmGrade;
	}
	
	
	@Override
	public String toString() {
		return "AlarmDTO [alarmNo=" + alarmNo + ", alarmIndex=" + alarmIndex + ", alarmDate=" + alarmDate + ", alarmId="
				+ alarmId + ", alarmRead=" + alarmRead + ", alarmGatherNo=" + alarmGatherNo + ", alarmGrade="
				+ alarmGrade + "]";
	}
	
	
	
	
	
	
	
	
	
}
