package com.bitschool.service;

import java.util.List;

import com.bitschool.dto.PostDTO;
import com.bitschool.dto.ReplyDTO;

public interface IReplyService {
	
	public boolean insertReply(ReplyDTO reply);
	public List<ReplyDTO> getReplyListAll(PostDTO pdto);
	
}
