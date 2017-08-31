package com.bitschool.dao;

import java.sql.SQLException;
import java.util.List;

import com.bitschool.dto.AlarmDTO;
import com.bitschool.dto.AreaDTO;
import com.bitschool.dto.CategoryDTO;
import com.bitschool.dto.GatherAddonsDTO;
import com.bitschool.dto.PersonDTO;

public interface IMemberDAO {

	//---------------------------------------------- 로 그 인 ----------------------------------------------//
	// [개인회원] 로그인
	public PersonDTO selectPersonLogin(String guserId) throws SQLException;	
	
	public PersonDTO findId(String guserEmail) throws SQLException;
	
	public PersonDTO findPW(String guserId)throws SQLException;	
	
	
	// ---------------------------------------- [개인회원] 회 원 가 입 ----------------------------------------//
	// [개인회원] 회원가입 - 코드값, 1단계 > 입력한 내용 삽입 
	public boolean insertPersonData(PersonDTO pdto) throws SQLException;

	// [개인회원] 회원가입 - 2단계 > 희망지역 3군데 삽입
	public boolean insertPersonArea(AreaDTO adto) throws SQLException;

	// [개인회원] 회원가입 - 2단계 > 희망 카테고리 3개 삽입
	public boolean insertPersonCategory(CategoryDTO cadto) throws SQLException;	
	
	// [개인회원] 회원가입 - 데이터 유효성 검사 > 아이디 중복 체크
	public String selectDuplicatePersonId(String guserId) throws SQLException;
	
	
	// --------------------------------------- [개인회원] 마 이 페 이 지  ---------------------------------------//
	// [개인회원] 마이페이지 - 1단계 > 개인정보 수정
	public boolean updatePersonFirst(PersonDTO pdto) throws SQLException;	
	
	// [개인회원] 마이페이지 - 2단계 > 희망지역 전체조회 
	public AreaDTO selectPersonHopeArea(String guserId) throws SQLException;

	// [개인회원] 마이페이지 - 2단계 > 희망카테고리 전체조회
	public CategoryDTO selectPersonHopeCategory(String guserId) throws SQLException;
	
	// [개인회원] 마이페이지 - 2단계 > 희망지역 수정
	public boolean updatePersonHopeArea(AreaDTO adto) throws SQLException;
	
	// [개인회원] 마이페이지 - 2단계 > 희망카테고리 수정
	public boolean updatePersonHopeCategory(CategoryDTO cadto) throws SQLException;
	
	// [개인회원] 마이페이지 - 비밀번호 변경
	public boolean updatePersonPw(PersonDTO pdto) throws SQLException;
	
	// [개인회원] 마이페이지 - 회원 탈퇴 > 정보 삭제
	public boolean deletePerson(PersonDTO pdto) throws SQLException;

	// [개인회원] 마이페이지 - 관심모임 삭제
	public boolean deleteAttend(GatherAddonsDTO gadto);

	public boolean getAlarmInsert(AlarmDTO alarm);

	public List<AlarmDTO> getAlarm();

	public boolean readCheck(int alarmNo);

}