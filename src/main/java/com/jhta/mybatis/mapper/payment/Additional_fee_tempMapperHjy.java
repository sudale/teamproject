package com.jhta.mybatis.mapper.payment;


import com.jhta.project.vo.Additional_feeVo;

public interface Additional_fee_tempMapperHjy {
	public int seq();
	public Additional_feeVo find(int aid);
	public int insert(Additional_feeVo vo);
	public int delete(int aid);
}
