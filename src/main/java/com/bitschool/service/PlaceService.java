package com.bitschool.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitschool.dao.IPlaceDAO;
import com.bitschool.dto.PlaceDTO;

@Service
public class PlaceService implements IPlaceService {
	
	//----------------------------------------------- 설 정 -----------------------------------------------//

	// [주입] DAO 인터페이스
	@Inject
	private IPlaceDAO PlaceDAO;	

	
	//----------------------------------------------- 모임공간 -----------------------------------------------//
		
	// 모임 공간 등록
	@Override
	public boolean PlaceRegist(PlaceDTO pl_dto) {
		boolean flag = false;
		System.out.println("service");
		try {
			flag = PlaceDAO.insertPlaceRegist(pl_dto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return flag;
	}

	
	// 모임 전체 조회
	@Override
	public List<PlaceDTO> getPlaceListAll() {
		List<PlaceDTO> placeList = null;

		try {
			placeList = PlaceDAO.selectPlaceListAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return placeList;
	}


	// 선택한 모임 상세 조회
	@Override
	public PlaceDTO getplaceDetail(int placeNo) {
		PlaceDTO pl_dto = null;
		
		try {
			pl_dto = PlaceDAO.selectPlaceDetail(placeNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return pl_dto;
	}
	
}