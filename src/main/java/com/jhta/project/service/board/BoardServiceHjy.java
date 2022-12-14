package com.jhta.project.service.board;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.board.BoardMapperHjy;
import com.jhta.project.vo.BoardVo;
import com.jhta.project.vo.BoardVo_phj;

@Service
public class BoardServiceHjy {
	@Autowired BoardMapperHjy mapper;
	public int count(HashMap<String, Object> map) {;
		return mapper.count(map);
	};
	public List<BoardVo> list(HashMap<String, Object> map){
		return mapper.list(map);
	};
	public BoardVo_phj detail(int bid) {
		return mapper.detail(bid);
	};
	public BoardVo prevDetail(int bid){
		return mapper.prev(bid);
	}
	public BoardVo nextDetail(int bid){
		return mapper.next(bid);
	}
}
