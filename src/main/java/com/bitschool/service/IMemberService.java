package com.bitschool.service;

import com.bitschool.dto.AreaDTO;
import com.bitschool.dto.CategoryDTO;
import com.bitschool.dto.CompanyDTO;
import com.bitschool.dto.GatherAddonsDTO;
import com.bitschool.dto.PersonDTO;

public interface IMemberService {

	//---------------------------------------------- 로 그 인 ----------------------------------------------//
	// [개인회원] 로그인
	public PersonDTO PersonLogin(String guserId, String guserPw);
	
	public PersonDTO getfindID(String guserEmail, String guserName);

	public PersonDTO getfindPW(String guserEmail, String guserId);
	
	// [기업회원] 로그인	
	public CompanyDTO CompanyLogin(String comId,String comPw);
	
	
	
	// ---------------------------------------- [개인회원] 회 원 가 입 ----------------------------------------//
	// [개인회원] 회원가입 - 1단계  + 코드값 > 입력한 내용 삽입
	public boolean PersonDataRegist(PersonDTO pdto);

	// [개인회원] 회원가입 - 2단계 > 희망지역 3군데 삽입
	public boolean PersonAreaRegist(AreaDTO adto);

	// [개인회원] 회원가입 - 2단계 > 희망 카테고리 3개 삽입
	public boolean PersonCategoryRegist(CategoryDTO cdto);	
	
	// [개인회원] 회원가입 - 데이터 유효성 검사 > 아이디 중복 체크
	public String checkDuplicatePersonId(String guserId);

	
	// --------------------------------------- [개인회원] 마 이 페 이 지  ---------------------------------------//
	// [개인회원] 마이페이지 - 1단계 > 개인정보 수정
	public boolean PersonFirstModifyCheck(PersonDTO pdto);
	
	// [개인회원] 마이페이지 - 2단계 > 희망지역 전체조회
	public AreaDTO PersonHopeAreaAll(String guserId);

	// [개인회원] 마이페이지 - 2단계 > 희망카테고리 전체조회
	public CategoryDTO PersonHopeCategoryAll(String guserId);
	
	// [개인회원] 마이페이지 - 비밀번호 변경
	public boolean PersonPwModify(PersonDTO pdto);

	// [개인회원] 마이페이지 - 회원 탈퇴 > 정보 삭제
	public boolean PersonQuit(PersonDTO pdto);
	
	// [개인회원] 마이페이지 - 관심모임 삭제
	public boolean deleteAttend(GatherAddonsDTO gadto);


	// --------------------------------------- [기업회원] 회원가입  ---------------------------------------//
	
	// [기업회원] 회원가입 - 1단계  + 2단계> 입력한 내용 삽입
	public boolean CompanyRegist(CompanyDTO cdto);
	
	//기업회원 비번찾기
	public CompanyDTO comfindPW(String comEmail, String comId);
	
	//기업회원 아이디 찾기	
    public CompanyDTO getfindComID(String comEmail,String comName);




	
}