package com.bitschool.dao;

import java.sql.SQLException;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bitschool.dto.AreaDTO;
import com.bitschool.dto.CategoryDTO;
import com.bitschool.dto.PersonDTO;

@Repository
public class MemberDAO implements IMemberDAO {
	
	//----------------------------------------------- 설 정 -----------------------------------------------//
	
	// [맵핑]
	private static final String namespace = "com.bitschool.basic.MemberMapper";
		
	// [주입] Sqlsession > Mybatis 실행 객체
	@Inject
	private SqlSession session;
	
	
	//----------------------------------------------- 로 그 인 -----------------------------------------------//
	
	// [개인회원] 로그인 
	@Override
	public PersonDTO selectPersonLogin(String guserId) throws SQLException {		
		PersonDTO pdto = null;
		
		// DB에 사용자가 입력한 "아이디" 있을 경우 = PersonDTO에 "아이디에 관련된 정보들(DTO)" 저장
		// DB에 사용자가 입력한 "아이디" 없을 경우 = PersonDTO에 "null" 저장
		pdto = session.selectOne(namespace+".selectPersonLogin", guserId);
		
		return pdto;
	}
	
	//[개인회원] 로그인 아이디 찾기
		@Override
		public PersonDTO findId(String guserEmail) throws SQLException {
			
			PersonDTO pdto = null;
			
			pdto = (PersonDTO) session.selectOne(namespace+".findID", guserEmail);
			
			return pdto;
		}

		//[개인회원] 로그인 비번 찾기
		@Override
		public PersonDTO findPW(String guserId) throws SQLException {

			PersonDTO pdto = null;
			
			pdto = (PersonDTO)session.selectOne(namespace+".findPW",guserId);
			
			return pdto;
		}
	
	
	
	// ----------------------------------------- [개인회원] 회 원 가 입 -----------------------------------------//
	
	// [개인회원] 회원가입 - 코드값, 1단계 > 입력한 내용 삽입 
	@Override
	public boolean insertPersonData(PersonDTO pdto) {
		boolean flag = false;
		
		// 코드값 + 회원가입 1단계 입력한 애용 > 회원 정보 등록
		int aCnt = session.insert(namespace+".insertPersonData", pdto);
		
		if(aCnt > 0) {
			flag = true;
		}
		
		return flag;
	}


	// [개인회원] 회원가입 - 2단계 > 희망지역 3군데 삽입
	@Override
	public boolean insertPersonArea(AreaDTO adto) throws SQLException {
		boolean flag = false;
		
		// 희망지역 3군데 DB에 등록
		int aCnt = session.insert(namespace+".insertPersonArea", adto);
		
		if(aCnt > 0) {
			flag = true;
		}
		
		return flag;
	}


	// [개인회원] 회원가입 - 2단계 > 희망 카테고리 3개 삽입
	@Override
	public boolean insertPersonCategory(CategoryDTO cdto) throws SQLException {
		boolean flag = false;
		
		// 희망 카테고리 3개 DB에 등록
		int aCnt = session.insert(namespace+".insertPersonCategory", cdto);
		
		if(aCnt > 0) {
			flag = true;
		}
		
		return flag;
	}
	
	
	// [개인회원] 회원가입 - 데이터 유효성 검사 > 아이디 중복 체크
	@Override
	public String selectDuplicatePersonId(String guserId) throws SQLException {
		String result = null;
		
		// 받아온 아이디값 DB에 있는지 조회
		result = session.selectOne(namespace+".selectDuplicatePersonId", guserId);
		
		return result;
	}
	
	
	// ---------------------------------------- [개인회원] 마 이 페 이 지 ----------------------------------------//

	// [개인회원] 마이페이지 - 1단계 > 개인정보 수정
	@Override
	public boolean updatePersonFirst(PersonDTO pdto) {
		boolean flag = false;
		
		// 희망 카테고리 3개 DB에 등록
		int aCnt = session.update(namespace+".updatePersonInfo", pdto);
				
		if(aCnt > 0) {
			flag = true;
		}
				
		return flag;
	}
	
	
	// [개인회원] 마이페이지 - 2단계 > 희망지역 전체조회 
	@Override
	public AreaDTO selectPersonHopeArea(String guserId) {
		AreaDTO adto = null;
		
		// 로그인한 사용자의 희망지역 전체 조회
		adto = session.selectOne(namespace+".selectPersonHopeArea", guserId);
		
		return adto;
	}
	
	
	// [개인회원] 마이페이지 - 2단계 > 희망카테고리 전체조회
	@Override
	public CategoryDTO selectPersonHopeCategory(String guserId) {
		CategoryDTO cdto = null;
		
		// 로그인한 사용자의 희망지역 전체 조회
		cdto = session.selectOne(namespace+".selectPersonHopeCategory", guserId);
		
		return cdto;
	}
	
	
	// [개인회원] 마이페이지 - 비밀번호 변경
	@Override
	public boolean updatePersonPw(PersonDTO pdto) {
		boolean flag = false;
		
		// DB에 저장된 비밀번호 변경
		int aCnt = session.update(namespace+".updatePersonPw", pdto);
		
		if(aCnt > 0) {
			flag = true;
		}
		
		return flag;
	}	
	
	
	// [개인회원] 마이페이지 - 회원 탈퇴 > 정보 삭제
	@Override
	public boolean deletePerson(PersonDTO pdto) throws SQLException {
		boolean flag = false;
		
		// 아이디, 비밀번호 확인 > 회원 삭제
		int aCnt = session.delete(namespace+".deletePerson", pdto);
		
		if(aCnt > 0) {
			flag = true;
		}
		
		return flag;
	}

}