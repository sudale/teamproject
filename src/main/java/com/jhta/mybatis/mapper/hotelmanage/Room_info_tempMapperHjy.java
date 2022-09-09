package com.jhta.mybatis.mapper.hotelmanage;

import java.util.ArrayList;
import java.util.List;

import com.jhta.project.vo.Room_InfoVo;

public interface Room_info_tempMapperHjy {
	public int seq();
	public List<Room_InfoVo> find(int aid);
	public int insert(Room_InfoVo vo);
	public int delete(int aid);
}
