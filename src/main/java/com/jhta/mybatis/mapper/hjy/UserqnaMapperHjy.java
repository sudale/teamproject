package com.jhta.mybatis.mapper.hjy;

import java.util.HashMap;
import java.util.List;

import com.jhta.project.vo.UserqnaVo2;

public interface UserqnaMapperHjy {
	public List<UserqnaVo2> qnalist(HashMap<String, Object> map);
	public int qnacount(HashMap<String, Object> map);
	public UserqnaVo2 qnaDetail(int qid);
	public UserqnaVo2 prev(int qid);
	public UserqnaVo2 next(int qid);
	public String qnaAns(int qid);
	public int qnawrite(UserqnaVo2 vo);
	public int getQref();
}
