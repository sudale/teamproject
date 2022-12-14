package com.jhta.project.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.board.CommentsMapperHjy;
import com.jhta.project.vo.CommentsVo;

@Service
public class CommentsServiceHjy {
	@Autowired CommentsMapperHjy mapper;
	public List<CommentsVo> list(int bid){
		return mapper.list(bid);
	};
	public int insert(CommentsVo vo) {
		return mapper.insert(vo);
	};
	public int insertPlus(CommentsVo vo) {
		return mapper.insertPlus(vo);
	};
	public int update(HashMap<String, Object> map) {
		return mapper.update(map);
	};
	public CommentsVo find(int cid) {
		return mapper.find(cid);
	}
	public int upcateCcontent(HashMap<String, Object> map) {
		return mapper.upcateCcontent(map);
	};
	public int deleteComment(int cid) {
		return mapper.deleteComment(cid);
	};
	public int seq() {
		return mapper.seq();
	};
	public Integer commcnt(int bid) {
		return mapper.commcnt(bid);
	};
}
