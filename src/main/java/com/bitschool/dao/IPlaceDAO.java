package com.bitschool.dao;

import java.sql.SQLException;
import java.util.List;

import com.bitschool.dto.CompanyDTO;
import com.bitschool.dto.PlaceDTO;

public interface IPlaceDAO {
	
	// 모임 공간 등록
	public boolean insertPlaceRegist(PlaceDTO pl_dto) throws SQLException;

	// 모임 전체 조회
	public List<PlaceDTO> selectPlaceListAll() throws SQLException;

	// 모임 클릭 > 상세정보
	public PlaceDTO selectPlaceDetail(int placeNo) throws SQLException;

	// 모임 클릭 > 작성자 정보 
	public CompanyDTO selectPalaceCompanyInfo(int placeNo) throws SQLException;

	// 메인페이지에 모임 장소 최근날짜로 6개 가져오기 
	public List<PlaceDTO> selectPlaceRecentInfo() throws SQLException;
	
	// [광고주 > 마이페이지] 내가 개설한 모임장소 
	public List<PlaceDTO> selectPlaceMakeList(String comId) throws SQLException;

	// [광고주 > 마이페이지 & 상세페이지] 선택한 모임 삭제
	public boolean deletePlaceDelete(int placeNo) throws SQLException;

	// 선택한 모임 상세내용 수정 
	public boolean updatePlaceDetail(int placeNo) throws SQLException;

	
}