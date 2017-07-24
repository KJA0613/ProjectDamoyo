package com.bitschool.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bitschool.dto.PostDTO;
import com.bitschool.dto.SearchVO;

@Repository
public class PostDAO implements IPostDAO {
	private static final String namespace = "com.bitschool.PostMapper";
	@Inject
	private SqlSession session;
	
	@Override
	public List<PostDTO> selectRange(SearchVO svo, String boardName) {
		List<PostDTO> list = null;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("search", svo);
		map.put("boardName", boardName);
		list = session.selectList(namespace+".selectRange",map);
		return list;
	}
	
	@Override
	public boolean insertPost(PostDTO post) {
		boolean flag = false;
		int aCnt = session.insert(namespace+".insert", post);
		if(aCnt > 0) {
			flag = true;
		}
		return flag;
	}

	@Override
	public boolean updateCnt(PostDTO post) { // 조회수 +1 메서드
		boolean flag = false;
		int aCnt = session.update(namespace+".updateCnt", post);
		if(aCnt > 0) {
			flag = true;
		}
		return flag;
	}


	@Override
	public boolean remove(PostDTO post) {
		boolean flag = false;
		int cnt = session.delete(namespace+".deleteOne", post);
		if(cnt > 0) {
			flag = true;
		}
		return flag;
	}
	
	@Override
	public boolean update(PostDTO post) {
		boolean flag = false;
		int cnt = session.update(namespace+".updateContents", post);
		if(cnt > 0) {
			flag = true;
		}
		return flag;
	}

	@Override
	public PostDTO selectPost(PostDTO pdto) {
		PostDTO post = null;
		post = session.selectOne(namespace+".selectOne", pdto);
		return post;
	}
}
