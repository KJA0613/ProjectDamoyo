package com.bitschool.service;

import com.bitschool.dto.PlaceDTO;

public interface IPlaceService {
	
	// 모임공간 등록
	public boolean PlaceRegist(PlaceDTO pl_dto);
	
}
