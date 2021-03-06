package com.bitschool.service;

import java.util.List;

import com.bitschool.dto.CompanyDTO;
import com.bitschool.dto.PlaceDTO;
import com.bitschool.dto.PlaceRankDTO;

public interface IPlaceService {
	
	// 모임 공간 등록
	public boolean PlaceRegist(PlaceDTO pl_dto);

	// 모임 전체 조회
	public List<PlaceDTO> getPlaceListAll();

	// 모임 클릭 > 상세정보
	public PlaceDTO getPlaceDetail(int placeNo);

	// 모임 클릭 > 작성자 정보
	public CompanyDTO getPalaceCompanyInfo(int placeNo);

	// 메인페이지에 모임 장소 최근날짜로 6개 가져오기
	public List<PlaceDTO> getPlaceRecentInfo();

	// [마이페이지] 내가 개설한 모임장소
	public List<PlaceDTO> getPlaceMakeList(String comId);

	// [마이페이지 & 상세페이지] 선택한 모임 삭제
	public boolean PlaceDeleteAll(int placeNo);

	// 선택한 모임 상세내용 수정
	public boolean PlaceModifyProcess(PlaceDTO pl_dto);

	public List<PlaceDTO> searchMap(String keyWord);

	public List<PlaceDTO> adminPlaceAll();

	public List<PlaceRankDTO> adminCategory();

	public List<PlaceRankDTO> adminAddr();
	
}