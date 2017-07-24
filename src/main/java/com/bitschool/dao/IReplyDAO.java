package com.bitschool.dao;

import java.util.List;

import com.bitschool.dto.PostDTO;
import com.bitschool.dto.ReplyDTO;

public interface IReplyDAO {
	
	public boolean insertReply(ReplyDTO reply);
	public List<ReplyDTO> selectReply(PostDTO pdto);
}
