package com.bitschool.dao;


import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bitschool.dto.BGalleryDTO;

@Repository
public class BGalleryDAO {
	private static final String namespace = "com.bitschool.basic.GalleryMapper";
	
	@Inject
	private SqlSession session;
	
	public boolean insertImage(BGalleryDTO gallery) {
		boolean flag = false;
		int aCnt = session.insert(namespace+".insertImg", gallery);
		if(aCnt > 0) {
			flag = true;
		}
		return flag;
	}

	public List<BGalleryDTO> selectImgAll(int blogId) {
		List<BGalleryDTO> list = session.selectList(namespace+".selectImgList", blogId);
		return list;
	}

	public boolean deletePhoto(int imageNo) {
		boolean flag = false;
		int aCnt = session.delete(namespace+".deleteImg", imageNo);
		if(aCnt > 0) {
			flag = true;
		}
		return flag;
	}

	public BGalleryDTO selectPhoto(int imageNo) {
		BGalleryDTO dto = session.selectOne(namespace+".selectOnePhoto", imageNo);
		return dto;
	}

	public boolean update(BGalleryDTO gallery) {
		boolean flag = false;
		int aCnt = session.update(namespace+".updateImg", gallery);
		if(aCnt > 0) {
			flag = true;
		}
		return flag;
	}
}
