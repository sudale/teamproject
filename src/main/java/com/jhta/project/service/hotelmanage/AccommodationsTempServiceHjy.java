package com.jhta.project.service.hotelmanage;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.hotelmanage.AccommodationsMapperHjy;
import com.jhta.mybatis.mapper.hotelmanage.Accommodations_tempMapperHjy;
import com.jhta.project.vo.AccommodationsVo;


@Service
public class AccommodationsTempServiceHjy {
	@Autowired Accommodations_tempMapperHjy mapper;
	//필요한 의존 객체의 “타입"에 해당하는 빈을 찾아 주입한다
	public int seq() {
		return mapper.seq();
	}
	public AccommodationsVo find(int aid) {
		return mapper.find(aid);
	};
	public int insert(AccommodationsVo vo) {
		return mapper.insert(vo);
	}
	public int delete(int aid) {
		return mapper.delete(aid);
	};
}
