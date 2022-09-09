package com.jhta.project.service.hotelmanage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.phj.AccommodationsMapper_phj;
import com.jhta.project.vo.AccommodationsVo3;


@Service
public class AccommodationsService_phj {
	@Autowired private AccommodationsMapper_phj mapper;
	public AccommodationsVo3 select(int aid) {
		return mapper.select(aid);
	}
}
