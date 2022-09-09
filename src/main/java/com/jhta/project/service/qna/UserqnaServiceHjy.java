package com.jhta.project.service.qna;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.hjy.UserqnaMapperHjy;
import com.jhta.project.vo.UserqnaVo2;

@Service
public class UserqnaServiceHjy {
	@Autowired UserqnaMapperHjy mapper;
	public List<UserqnaVo2> qnalist(HashMap<String, Object> map) {
		return mapper.qnalist(map);
	};
	public int qnacount(HashMap<String, Object> map) {
		return mapper.qnacount(map);
	};
	public UserqnaVo2 qnaDetail(int qid){
		return mapper.qnaDetail(qid);
	};
	public UserqnaVo2 prev(int qid) {
		return mapper.prev(qid);
	};
	public UserqnaVo2 next(int qid) {
		return mapper.next(qid);
	};
	public String qnaAns(int qid) {
		return mapper.qnaAns(qid);
	};
	public int qnawrite(UserqnaVo2 vo) {
		return mapper.qnawrite(vo);
	};
	public int getQref() {
		return mapper.getQref();
	};
}
