package com.bitschool.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitschool.dao.ICompanyDAO;
import com.bitschool.dao.IMemberDAO;
import com.bitschool.dto.AlarmDTO;
import com.bitschool.dto.AreaDTO;
import com.bitschool.dto.CategoryDTO;
import com.bitschool.dto.CompanyDTO;
import com.bitschool.dto.GatherAddonsDTO;
import com.bitschool.dto.PersonDTO;

// [개인&기업회원] 로직처리
@Service
public class MemberService implements IMemberService {
	
	//----------------------------------------------- 설 정 -----------------------------------------------//

	// [주입] DAO 인터페이스
	@Inject
	private IMemberDAO personDAO;	
	
	@Inject
	private ICompanyDAO companyDAO;
	
	@Inject
	private IMemberDAO memberDAO;
	//----------------------------------------------- 로 그 인 -----------------------------------------------//

	// [개인회원] 로그인
	@Override
	public PersonDTO PersonLogin(String guserId, String guserPw) {
		PersonDTO pdto = null;

		try {
			// [1차 확인] DB > 개인회원 "아이디" 유무 확인
			pdto = personDAO.selectPersonLogin(guserId);

			// [2차-1 확인] 1차 확인 시(DB에 아이디 있음), 해당 아이디와 "관련된 정보들 있으면" > 개인회원
			// [2차-2 확인] DB에 있는 비밀번호 == 사용자가 입력한 비밀번호 > 개인회원
			if (pdto != null && pdto.getGuserPw().equals(guserPw)) {
				return pdto;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		// System.out.println("[TEST-로그인(개인)] DB 데이터 확인: " + pdto);

		return null;
	}
	
	
	// [기업회원] 로그인
	@Override
	public CompanyDTO CompanyLogin(String comId, String comPw) {
		CompanyDTO cdto = null;

		try {
			// [1차 확인] DB > 기업회원 "아이디" 유무 확인
			cdto = companyDAO.selectCompanyLogin(comId);

			// [2차-1 확인] 1차 확인 시(DB에 아이디 있음), 해당 아이디와 "관련된 정보들 있으면" > 개인회원
			// [2차-2 확인] DB에 있는 비밀번호 == 사용자가 입력한 비밀번호 > 개인회원
			if (cdto != null && cdto.getComPw().equals(comPw)) {
				return cdto;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		// System.out.println("[TEST-로그인(개인)] DB 데이터 확인: " + pdto);

		return null;
	}
	

	// [기업회원] 아이디
	@Override
	public PersonDTO getfindID(String guserEmail, String guserName) {
		PersonDTO pdto = null;
		
		try {			
			pdto = personDAO.findId(guserEmail);
			
			if(pdto!=null && pdto.getGuserName().equals(guserName)){
				return pdto;
			}		
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		return pdto;
	}


	// [기업회원] 비밀번호
	@Override
	public PersonDTO getfindPW(String guserEmail, String guserId) {
		PersonDTO pdto = null;
		
		try {
			pdto = personDAO.findPW(guserId);
			if(pdto!=null && pdto.getGuserEmail().equals(guserEmail)){
				return pdto;
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return pdto;
	}
	
	
	
	
	// ---------------------------------------- [개인회원] 회 원 가 입 ----------------------------------------//
	
	// [개인회원] 회원가입 - 코드값, 1단계 > 입력한 내용 삽입
	@Override
	public boolean PersonDataRegist(PersonDTO pdto) {
		boolean flag = false;

		// 입력한 내용 DB에 삽입
		try {
			flag = personDAO.insertPersonData(pdto);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return flag;
	}
	

	// [개인회원] 회원가입 - 2단계 > 희망지역 3군데 삽입
	@Override
	public boolean PersonAreaRegist(AreaDTO adto) {
		boolean flag = false;

		// 선택한 희망지역 DB에 삽입
		try {
			flag = personDAO.insertPersonArea(adto);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return flag;
	}

	
	// [개인회원] 회원가입 - 2단계 > 희망 카테고리 3개 삽입
	@Override
	public boolean PersonCategoryRegist(CategoryDTO cadto) {
		boolean flag = false;

		// 선택한 희망 카테고리 DB에 삽입
		try {
			flag = personDAO.insertPersonCategory(cadto);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return flag;
	}

	
	// [개인회원] 회원가입 - 데이터 유효성 검사 > 아이디 중복 체크	
	@Override
	public String checkDuplicatePersonId(String guserId) {
		String result = null;
		
		try {
			// 받아온 아이디값 DB에 있는지 조회
			result = personDAO.selectDuplicatePersonId(guserId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	
	// ---------------------------------------- [개인회원] 마 이 페 이 지 ----------------------------------------//
	
	// [개인회원] 마이페이지 - 1단계 > 개인정보 수정
	@Override
	public boolean PersonFirstModifyCheck(PersonDTO pdto) {
		boolean flag = false;
		
		try {
			// 새로 입력한 내용으로 업데이트
			flag = personDAO.updatePersonFirst(pdto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return flag;
	}
	
	
	// [개인회원] 마이페이지 - 2단계 > 희망지역 전체조회 
	@Override
	public AreaDTO PersonHopeAreaAll(String guserId) {
		AreaDTO adto = null;
		
		try {
			// 로그인한 사용자의 희망지역 전체 조회
			adto = personDAO.selectPersonHopeArea(guserId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return adto;
	}
	
	
	// [개인회원] 마이페이지 - 2단계 > 희망카테고리 전체조회
	@Override
	public CategoryDTO PersonHopeCategoryAll(String guserId) {
		CategoryDTO cdto = null;
		
		try {
			// 로그인한 사용자의 희망카테고리 전체 조회
			cdto = personDAO.selectPersonHopeCategory(guserId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cdto;
	}
	
	
	// [개인회원] 마이페이지 - 2단계 > 희망지역 수정
	@Override
	public boolean PersonHopeAreaModify(AreaDTO adto) {
		boolean flag = false;
		
		try {
			flag = personDAO.updatePersonHopeArea(adto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return flag;
	}
	
	
	// [개인회원] 마이페이지 - 2단계 > 희망카테고리 수정
	@Override
	public boolean PersonHopeCategoryModify(CategoryDTO cadto) {
		boolean flag = false;
		
		try {
			flag = personDAO.updatePersonHopeCategory(cadto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return flag;
	}

	// [개인회원] 마이페이지 - 비밀번호 변경
	@Override
	public boolean PersonPwModify(PersonDTO pdto) {
		boolean flag = false;

		// DB에 저장된 비밀번호 변경
		try {
			flag = personDAO.updatePersonPw(pdto);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return flag;
	}

	
	// [개인회원] 마이페이지 - 회원 탈퇴 > 정보 삭제
	@Override
	public boolean PersonQuit(PersonDTO pdto) {
		boolean flag = false;

		// DB에서 비밀번호 확인
		try {
			flag = personDAO.deletePerson(pdto);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return flag;
	}
	
	
	// [개인회원] 마이페이지 - 관심모임 삭제
	@Override
	public boolean deleteAttend(GatherAddonsDTO gadto) {
		boolean flag = personDAO.deleteAttend(gadto);

		return flag;
	}
		
		
		
	// ---------------------------------------- [기업회원] 회 원 가 입 ----------------------------------------//	
		
	// [기업회원] 회원가입 - 1단계 + 2단계> 입력한 내용 삽입
	@Override
	public boolean CompanyRegist(CompanyDTO cdto) {
		boolean flag = false;

		try {
			flag = companyDAO.companyRegist(cdto);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return flag;
	}

	// [기업회원] 아이디 찾기
	@Override
	public CompanyDTO getfindComID(String comEmail, String comName) {
		CompanyDTO cdto = null;

		try {
			cdto = companyDAO.findComId(comEmail);

			if (cdto != null && cdto.getComName().equals(comName)) {
				return cdto;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return cdto;
	}

	
	// [기업회원] 비번 찾기
	@Override
	public CompanyDTO comfindPW(String comEmail, String comId) {

		CompanyDTO cdto = null;

		try {
			cdto = companyDAO.comfindPW(comId);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		if (cdto != null && cdto.getComId().equals(comId)) {
			return cdto;
		}

		return cdto;
	}

	
	// [기업회원] 회원정보 수정
	@Override
	public boolean updateComInfo(CompanyDTO cdto) {

		boolean flag = false;

		try {
			flag = companyDAO.updatecomInfo(cdto);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return flag;
	}

	
	// [기업회원] 비밀번호수정
	@Override
	public boolean CompanyPwModify(CompanyDTO cdto) {
		boolean flag = false;

		try {
			flag = companyDAO.CompanyPwModify(cdto);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return flag;
	}

	
	// [기업회원] 회원탈퇴
	@Override
	public boolean CompanyQuit(CompanyDTO cdto) {

		boolean flag = false;

		try {
			flag = companyDAO.CompanyQuit(cdto);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return flag;
	}


	// [기업회원] 데이터 유효성 검사 > 아이디 중복 체크	
	@Override
	public String checkDuplicateCompanyId(String comId) {
		String result = null;
		
		try {
			result = companyDAO.selectDuplicateCompanyId(comId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
				
		return result;
	}

	//게시글모임에 참여하기 누르면 알람으로 인써트 됨
	@Override
	public boolean getInsert(AlarmDTO alarm) {
		boolean flag = false;
		
		flag = memberDAO.getAlarmInsert(alarm);
		
		
		return flag;
	}


	@Override
	public List<AlarmDTO> getAlarm(String loginId) {
		
		List<AlarmDTO> getAlarm = memberDAO.getAlarm(loginId);
		
		return getAlarm;
	}


	@Override
	public boolean readCheck(int alarmNo) {

		boolean flag = memberDAO.readCheck(alarmNo);
		
		return flag;
	}

}