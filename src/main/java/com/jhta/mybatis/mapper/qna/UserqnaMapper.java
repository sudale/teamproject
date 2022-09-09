package com.jhta.mybatis.mapper.qna;

import java.util.HashMap;
import java.util.List;

import com.jhta.project.vo.UserqnaVo3;

public interface UserqnaMapper {
	UserqnaVo3 detail(HashMap<String,String> map);
	List<UserqnaVo3> detail2(String mid);
	int delete(UserqnaVo3 vo);
	int update(HashMap<String, String> map);
	List<UserqnaVo3> checkId(String mid);
	List<UserqnaVo3> list(HashMap<String, Object> map);
	int count(HashMap<String, Object> map);
	UserqnaVo3 prev(int num);
	UserqnaVo3 next(int num);
}
