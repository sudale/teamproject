package com.jhta.mybatis.mapper.chat;

import java.util.List;

import com.jhta.project.vo.ChatBuddyVo;

public interface ChatBuddyMapperHjy {
	public int buddyInsert(ChatBuddyVo vo);
	public List<ChatBuddyVo> chatBuddyList(String cmid);
}
