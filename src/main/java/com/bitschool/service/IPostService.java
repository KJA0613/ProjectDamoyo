package com.bitschool.service;

import java.util.List;

import com.bitschool.dto.PostDTO;
import com.bitschool.dto.SearchVO;

public interface IPostService {

	public boolean registPost(PostDTO post);
	public List<PostDTO> getListAll(SearchVO svo, String boardName);
	public boolean increasCount(PostDTO pdto);
	public boolean remove(PostDTO post);
	public boolean modify(PostDTO post);
	public PostDTO readPost(PostDTO pdto);
}
