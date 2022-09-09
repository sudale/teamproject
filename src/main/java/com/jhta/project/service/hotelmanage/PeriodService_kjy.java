package com.jhta.project.service.hotelmanage;

import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.hotelmanage.PeriodMapperkjy;

@Service
public class PeriodService_kjy {
	@Autowired private PeriodMapperkjy mapper;
	public String list(HashMap<String, Object> map) {
		return mapper.list(map);
	}
}
