package com.bitschool.service;

import java.util.List;

import com.bitschool.dto.PlaceDTO;

public interface IPlaceService {
	
	// 모임 공간 등록
	public boolean PlaceRegist(PlaceDTO pl_dto);

	// 모임 전체 조회
	public List<PlaceDTO> getPlaceListAll();

	// 선택한 모임 상세 조회
	public PlaceDTO getplaceDetail(int placeNo);
	
}