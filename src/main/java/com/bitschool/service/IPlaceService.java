package com.bitschool.service;

import java.util.List;

import com.bitschool.dto.CompanyDTO;
import com.bitschool.dto.PlaceDTO;

public interface IPlaceService {
	
	// 모임 공간 등록
	public boolean PlaceRegist(PlaceDTO pl_dto);

	// 모임 전체 조회
	public List<PlaceDTO> getPlaceListAll();

	// 모임 클릭 > 상세정보
	public PlaceDTO getPlaceDetail(int placeNo);

	// 모임 클릭 > 작성자 정보
	public CompanyDTO getPalaceCompanyInfo(int placeNo);
	
}