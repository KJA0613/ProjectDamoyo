package com.bitschool.dao;

import java.util.List;

import com.bitschool.dto.PostDTO;
import com.bitschool.dto.SearchVO;

public interface IPostDAO {

	public List<PostDTO> selectRange(SearchVO svo, String boardName);
	public boolean insertPost(PostDTO post);
	public boolean updateCnt(PostDTO post);
	public boolean remove(PostDTO post);
	public boolean update(PostDTO post);
	public PostDTO selectPost(PostDTO pdto);
	
}
