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

	// 메인페이지에 모임 장소 최신날짜로 6개 가져오기 
	public List<PlaceDTO> selectPlaceRecentInfo() throws SQLException;

	
}