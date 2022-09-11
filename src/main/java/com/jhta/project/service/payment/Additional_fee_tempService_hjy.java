package com.jhta.project.service.payment;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.payment.Additional_fee_tempMapperHjy;
import com.jhta.project.vo.Additional_feeVo;
@Service
public class Additional_fee_tempService_hjy {
	@Autowired Additional_fee_tempMapperHjy mapper;
	public int seq() {
		return mapper.seq();
	}
	public Additional_feeVo find(int riid) {
		return mapper.find(riid);
	};
	public int insert(Additional_feeVo vo) {
		return mapper.insert(vo);
	};
	public int delete(int aid) {
		return mapper.delete(aid);
	};
}
