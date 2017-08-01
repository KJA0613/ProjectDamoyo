package com.bitschool.dao;

import java.sql.SQLException;

import com.bitschool.dto.PlaceDTO;

public interface IPlaceDAO {
	
	// 모임공간 등록
	public boolean insertPlaceRegist(PlaceDTO pl_dto) throws SQLException;

	
}
