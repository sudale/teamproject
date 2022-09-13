package com.jhta.project.service.hotelmanage;


import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.hotelmanage.PeriodMapperHjy;
import com.jhta.mybatis.mapper.hotelmanage.PeriodMapperlhjcjy;
import com.jhta.project.vo.PeriodVo;

@Service
public class PeriodService_hjy {
	@Autowired PeriodMapperHjy mapper;
	public int seq() { //시퀀스
		return mapper.seq();
	}
	public int insert(PeriodVo vo) {
		return mapper.insert(vo);
	};
}
