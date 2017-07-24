package com.bitschool.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bitschool.dto.PostDTO;
import com.bitschool.dto.ReplyDTO;

@Repository
public class ReplyDAO implements IReplyDAO {
	private static final String namespace = "com.bitschool.ReplyMapper";
	@Inject
	private SqlSession session; 

	@Override
	public boolean insertReply(ReplyDTO reply) {
		boolean flag = false;
		int aCnt = session.update(namespace+".updateReplyCount", reply); // 댓글의 no를 정해주는 메서드
		if(aCnt > 0) {
			aCnt = session.insert(namespace+".insertReply", reply); // 댓글 삽입하는 메서드
			if(aCnt > 0) {
				flag = true;
			}
		}
		return flag;
	}

	@Override
	public List<ReplyDTO> selectReply(PostDTO pdto) {
		List<ReplyDTO> list = null;
		list = session.selectList(namespace+".selectReply", pdto);
		return list;
	}

}
