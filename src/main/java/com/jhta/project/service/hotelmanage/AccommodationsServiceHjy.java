package com.jhta.project.service.hotelmanage;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.hotelmanage.AccommodationsMapperHjy;
import com.jhta.project.vo.AccommodationsVo;


@Service
public class AccommodationsServiceHjy {
	@Autowired AccommodationsMapperHjy mapper;
	
	//시퀀스정의
	public int seq() {
		return mapper.seq();
	}
	//숙소정보
	public int insert(AccommodationsVo vo) {
		return mapper.insert(vo); //vo로 값을 담아준다.
	}
}
