package com.bitschool.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitschool.dao.IReplyDAO;
import com.bitschool.dto.PostDTO;
import com.bitschool.dto.ReplyDTO;

@Service
public class ReplyService implements IReplyService{
	
	@Inject
	private IReplyDAO dao;

	@Override
	public boolean insertReply(ReplyDTO reply) {
		boolean flag = false;
		flag = dao.insertReply(reply);
		return flag;
	}

	@Override
	public List<ReplyDTO> getReplyListAll(PostDTO pdto) {
		List<ReplyDTO> list = null;
		list = dao.selectReply(pdto);
		return list;
	}
}
