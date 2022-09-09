package com.jhta.mybatis.mapper.hjy;

import com.jhta.project.vo.AccommodationsVo;

public interface Accommodations_tempMapperHjy {
	public int seq();
	public AccommodationsVo find(int aid);
	public int insert(AccommodationsVo vo);
	public int delete(int aid);
}
