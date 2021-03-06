package com.bitschool.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bitschool.dto.BPageVO;
import com.bitschool.dto.BPostDTO;
import com.bitschool.dto.BPostNoInfoDTO;
import com.bitschool.dto.BSearchVO;

@Repository
public class BPostDAO {
	private static final String namespace = "com.bitschool.basic.PostMapper";
	@Inject
	private SqlSession session;

	public List<BPostDTO> selectRange(BPageVO page) {
		List<BPostDTO> list = null;
		list = session.selectList(namespace+".selectRange", page);
		return list;
	}
	
	public boolean insertPost(BPostDTO post) {
		boolean flag = false;
		int aCnt = session.insert(namespace+".insert", post);
		if(aCnt > 0) {
			flag = true;
		}
		return flag;
	}

	public boolean updateCnt(BPostNoInfoDTO infoDTO) {
		boolean flag = false;
		int aCnt = session.update(namespace+".updateCnt", infoDTO);
		if(aCnt > 0) {
			flag = true;
		}
		return flag;
	}

	public BPostDTO selectPost(BPostNoInfoDTO infoDTO) {
		BPostDTO post = null;
		post = session.selectOne(namespace+".selectOne", infoDTO);
		return post;
	}

	public boolean remove(BPostNoInfoDTO infoDTO) {
		boolean flag = false;
		int cnt = session.delete(namespace+".deleteOne", infoDTO);
		if(cnt > 0) {
			flag = true;
		}
		return flag;
	}
	
	public boolean update(BPostDTO post) {
		boolean flag = false;
		int cnt = session.update(namespace+".updateContents", post);
		if(cnt > 0) {
			flag = true;
		}
		return flag;
	}

	public List<BPostDTO> selectSearchRange(BSearchVO page) {
		List<BPostDTO> list = null;
		list = session.selectList(namespace+".selectSearch", page);
		return list;
	}

	public boolean insertFile(BPostDTO fileDTO) {
		boolean flag = false;
		int aCnt = session.insert(namespace+".insertFile", fileDTO);
		if(aCnt > 0) {
			flag = true;
		}
		return flag;
	}
}
