package com.jhta.mybatis.mapper.hotelmanage;

import java.util.ArrayList;
import java.util.List;

import com.jhta.project.vo.PeriodVo;

public interface Period_tempMapperHjy {
	public int seq();
	public List<PeriodVo> find(int aid);
	public int insert(PeriodVo vo);
	public int delete(int aid);
}
