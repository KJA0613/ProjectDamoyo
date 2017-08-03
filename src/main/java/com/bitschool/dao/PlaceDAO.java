package com.bitschool.dao;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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
			
		System.out.println("dao: " + pl_dto);
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


	// 선택한 모임 상세 조회
	@Override
	public PlaceDTO selectPlaceDetail(int placeNo) throws SQLException {
		PlaceDTO pl_dto = null;
		
		pl_dto = session.selectOne(namespace+".selectPlaceDetail", placeNo);
		
		return pl_dto;
	}

	
}