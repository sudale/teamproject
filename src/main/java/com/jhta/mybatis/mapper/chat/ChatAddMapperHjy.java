package com.jhta.mybatis.mapper.chat;

import java.util.HashMap;
import java.util.List;

import com.jhta.project.vo.ChatAddVo;

public interface ChatAddMapperHjy {
	public int friendReqInsert(ChatAddVo vo);
	public List<ChatAddVo> chatAddList(String cmid);
	public int isexist(ChatAddVo vo);
	public int delete(HashMap<String, Object> del);
}
