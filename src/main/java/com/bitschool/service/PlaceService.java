package com.bitschool.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitschool.dao.IPlaceDAO;
import com.bitschool.dto.CompanyDTO;
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


	// 모임 클릭 > 상세정보
	@Override
	public PlaceDTO getPlaceDetail(int placeNo) {
		PlaceDTO pl_dto = null;
		
		try {
			pl_dto = PlaceDAO.selectPlaceDetail(placeNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return pl_dto;
	}


	// 모임 클릭 > 작성자 정보
	@Override
	public CompanyDTO getPalaceCompanyInfo(int placeNo) {
		CompanyDTO cdto = null;
		
		try {
			cdto = PlaceDAO.selectPalaceCompanyInfo(placeNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cdto;
	}

	
	// 메인페이지에 모임 장소 최근날짜로 6개 가져오기
	@Override
	public List<PlaceDTO> getPlaceRecentInfo() {
		List<PlaceDTO> placeList = null;
		
		try {
			placeList = PlaceDAO.selectPlaceRecentInfo();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return placeList;
	}


	// [광고주 > 마이페이지] 내가 개설한 모임장소
	@Override
	public List<PlaceDTO> getPlaceMakeList(String comId) {
		List<PlaceDTO> placeList = null;
		
		try {
			placeList = PlaceDAO.selectPlaceMakeList(comId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return placeList;
	}
	
}