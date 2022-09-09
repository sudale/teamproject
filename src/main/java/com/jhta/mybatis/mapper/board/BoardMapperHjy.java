package com.jhta.mybatis.mapper.board;

import java.util.HashMap;
import java.util.List;

import com.jhta.project.vo.BoardVo;
import com.jhta.project.vo.BoardVo_phj;

public interface BoardMapperHjy {
	public int count(HashMap<String, Object> map);
	public List<BoardVo> list(HashMap<String, Object> map);
	public BoardVo_phj detail(int bid);
	public BoardVo prev(int bid);
	public BoardVo next(int bid);
}
