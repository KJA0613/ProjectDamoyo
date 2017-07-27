package com.bitschool.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitschool.dao.BPostDAO;
import com.bitschool.dto.BGalleryDTO;
import com.bitschool.dto.BNoticeDTO;
import com.bitschool.dto.BPageVO;
import com.bitschool.dto.BPostDTO;
import com.bitschool.dto.BSearchVO;

@Service
public class BPostService {
	
	@Inject
	private BPostDAO dao;
	
	public boolean registPost(BPostDTO post) {
		boolean flag = false;
		flag = dao.insertPost(post);
		return flag;
	}

	public List<BPostDTO> getListAll(BPageVO page) {
		List<BPostDTO> list = null;
		list = dao.selectRange(page);
		return list;
	}

	public boolean increasCount(int postNo) {
		boolean flag = false;
		flag = dao.updateCnt(postNo);
		return flag;
	}

	public BPostDTO readPost(int postNo) {
		BPostDTO post = null;
		post = dao.selectPost(postNo);
		return post;
	}

	public boolean remove(int postNo) {
		boolean flag = false;
		flag = dao.remove(postNo);
		return flag;
	}

	public boolean modify(BPostDTO post) {
		boolean flag = false;
		flag = dao.update(post);
		return flag;
	}

	public List<BPostDTO> listSearchBookAll(BSearchVO page) {
		List<BPostDTO> list = null;
		list = dao.selectSearchRange(page);
		return list;
	}
}
