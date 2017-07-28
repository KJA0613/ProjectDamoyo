package com.bitschool.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bitschool.dto.BPostNoInfoDTO;
import com.bitschool.dto.BReplyDTO;

@Repository
public class BReplyDAO {
	private static final String namespace = "com.bitschool.basic.ReplyMapper";
	@Inject
	private SqlSession session; 

	public boolean insertReply(BReplyDTO reply) {
		boolean flag = false;
		BPostNoInfoDTO infoDTO = new BPostNoInfoDTO();
		int postNo = reply.getPostNo();
		infoDTO.setPostNo(postNo);
		infoDTO.setBoardName(reply.getBoardName());
		int aCnt = session.update(namespace+".updateReplyCount", infoDTO);
		if(aCnt > 0) {
			aCnt = session.insert(namespace+".insertReply", reply);
			if(aCnt > 0) {
				flag = true;
			}
		}
		return flag;
	}

	public List<BReplyDTO> selectReply(BPostNoInfoDTO infoDTO) {
		List<BReplyDTO> list = null;
		list = session.selectList(namespace+".selectReply", infoDTO);
		return list;
	}

}
