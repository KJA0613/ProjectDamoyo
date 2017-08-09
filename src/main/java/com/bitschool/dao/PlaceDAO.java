package com.bitschool.dao;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bitschool.dto.CompanyDTO;
import com.bitschool.dto.PlaceDTO;

@Repository
public class PlaceDAO implements IPlaceDAO {
	
	//----------------------------------------------- 설 정 -----------------------------------------------//
	
	// [맵핑]
	private static final String namespace = "com.bitschool.basic.PlaceMapper";
		
	// [주입] Sqlsession > Mybatis 실행 객체
	@Inject
	private SqlSession session;
	
	
	//----------------------------------------------- 모임공간 -----------------------------------------------//	
	
	// [광고주] 모임 공간 등록
	@Override
	public boolean insertPlaceRegist(PlaceDTO pl_dto) {
		boolean flag = false;
			
		int aCnt = session.insert(namespace+".insertPlaceRegist", pl_dto);
		
		if(aCnt > 0) {
			flag = true;			
		}
		
		return flag;
	}


	// [광고주] 모임 전체 조회
	@Override
	public List<PlaceDTO> selectPlaceListAll() {
		List<PlaceDTO> placeList = null;

		placeList = session.selectList(namespace+".selectPlaceListAll");
		
		return placeList;
	}


	// 모임 클릭 > 상세정보
	@Override
	public PlaceDTO selectPlaceDetail(int placeNo) throws SQLException {
		PlaceDTO pl_dto = null;

		pl_dto = session.selectOne(namespace+".selectPlaceDetail", placeNo);
		
		return pl_dto;
	}


	// 모임 클릭 > 작성자 정보 
	@Override
	public CompanyDTO selectPalaceCompanyInfo(int placeNo) throws SQLException {
		CompanyDTO cdto = null;
		
		cdto = session.selectOne(namespace+".selectPalaceCompanyInfo", placeNo);
		
		return cdto;
	}

	
	// 메인페이지에 모임 장소 최근날짜로 6개 가져오기  
	@Override
	public List<PlaceDTO> selectPlaceRecentInfo() throws SQLException {
		List<PlaceDTO> placeList = null;
		
		placeList = session.selectList(namespace+".selectPlaceRecentInfo");
		
		return placeList;
	}


	// [광고주 > 마이페이지] 내가 개설한 모임장소 
	@Override
	public List<PlaceDTO> selectPlaceMakeList(String comId) throws SQLException {
		List<PlaceDTO> placeList = null;
		
		placeList = session.selectList(namespace+".selectPlaceMakeList", comId);
		
		return placeList;
	}


	// [광고주 > 마이페이지 & 상세페이지] 선택한 모임 삭제
	@Override
	public boolean deletePlaceDelete(int placeNo) throws SQLException {
		boolean flag = false;
		
		int aCnt = session.delete(namespace+".deletePlaceDelete", placeNo);
		
		if(aCnt > 0) {
			flag = true;
		}
		
		return flag;
	}


	// 선택한 모임 상세내용 수정 
	@Override
	public boolean updatePlaceModify(PlaceDTO pl_dto) throws SQLException {
		boolean flag = false;

		int aCnt = session.update(namespace+".updatePlaceModify", pl_dto);

		if(aCnt > 0) {
			flag = true;
		}
		
		return flag;
	}


	@Override
	public List<PlaceDTO> searchMap(String keyWord) {

		List<PlaceDTO> mapList = null;
		
		mapList = session.selectList(namespace+".searchMap", keyWord);
		
		System.out.println(mapList);
		
		return mapList;
	}

	
}