package com.jhta.project.service.chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.chat.ChatMembersMapperHjy;
import com.jhta.project.vo.Chat_membersVo_kjy;

@Service
public class ChatMembersServiceHjy {
	@Autowired ChatMembersMapperHjy mapper;
	public Chat_membersVo_kjy find(String cmid) {
		return mapper.find(cmid);
	};
}
