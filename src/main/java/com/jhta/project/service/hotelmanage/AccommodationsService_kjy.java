package com.jhta.project.service.hotelmanage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.hotelmanage.AccommodationsMapperkjy;
import com.jhta.project.vo.AccommodationsVo_kjy;

@Service
public class AccommodationsService_kjy {
	@Autowired private AccommodationsMapperkjy mapper;
	public AccommodationsVo_kjy aidlist(int aid1) {
		return mapper.aidlist(aid1);
	}
}
