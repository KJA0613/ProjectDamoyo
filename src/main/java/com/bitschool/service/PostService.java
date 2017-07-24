package com.bitschool.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitschool.dao.IPostDAO;
import com.bitschool.dto.PostDTO;
import com.bitschool.dto.SearchVO;

@Service
public class PostService implements IPostService{
	
	@Inject
	private IPostDAO dao;
	
	@Override
	public boolean registPost(PostDTO post) {
		boolean flag = false;
		flag = dao.insertPost(post);
		return flag;
	}

	@Override
	public List<PostDTO> getListAll(SearchVO svo, String boardName) {
		List<PostDTO> list = null;
		list = dao.selectRange(svo, boardName);
		return list;
	}

	@Override
	public boolean increasCount(PostDTO post) { // 조회수 +1
		boolean flag = false;
		flag = dao.updateCnt(post);
		return flag;
	}

	@Override
	public boolean remove(PostDTO post) {
		boolean flag = false;
		flag = dao.remove(post);
		return flag;
	}

	@Override
	public boolean modify(PostDTO post) {
		boolean flag = false;
		flag = dao.update(post);
		return flag;
	}

	@Override
	public PostDTO readPost(PostDTO pdto) {
		PostDTO post = null;
		post = dao.selectPost(pdto);
		return post;
	}

}
