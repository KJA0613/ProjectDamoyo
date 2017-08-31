package com.bitschool.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitschool.dao.BGalleryDAO;
import com.bitschool.dto.BGalleryDTO;

@Service
public class BGalleryService {
	@Inject
	private BGalleryDAO dao;

	public boolean uploadImage(BGalleryDTO gallery) {
		boolean flag = false;
		flag = dao.insertImage(gallery);
		return flag;
	}

	public List<BGalleryDTO> getImageList(int blogId) {
		List<BGalleryDTO> list = null;
		list = dao.selectImgAll(blogId);
		for(BGalleryDTO dto : list) {
			dto.setUploadImg("\\resources\\image\\"+dto.getUploadImg());
		}
		return list;
	}

	public boolean removePhoto(int imageNo) {
		boolean flag = false;
		flag = dao.deletePhoto(imageNo);
		return flag;
	}

	public BGalleryDTO getPhoto(int imageNo) {
		BGalleryDTO dto = dao.selectPhoto(imageNo);
		dto.setUploadImg("\\resources\\image\\"+dto.getUploadImg());
		return dto;
	}

	public boolean modifyImage(BGalleryDTO gallery) {
		boolean flag = false;
		flag = dao.update(gallery);
		return flag;
	}

}
