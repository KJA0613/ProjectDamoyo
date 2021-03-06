package com.bitschool.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitschool.dao.BReplyDAO;
import com.bitschool.dto.BPostNoInfoDTO;
import com.bitschool.dto.BReplyDTO;

@Service
public class BReplyService {
	
	@Inject
	private BReplyDAO dao;

	public boolean insertReply(BReplyDTO reply) {
		boolean flag = false;
		flag = dao.insertReply(reply);
		return flag;
	}

	public List<BReplyDTO> getReplyListAll(BPostNoInfoDTO infoDTO) {
		List<BReplyDTO> list = null;
		list = dao.selectReply(infoDTO);
		return list;
	}

	public boolean removeReply(BReplyDTO reply) {
		boolean flag = false;
		flag = dao.deleteReply(reply);
		return flag;
	}
}
