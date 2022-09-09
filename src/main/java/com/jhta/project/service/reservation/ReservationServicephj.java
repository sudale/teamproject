package com.jhta.project.service.reservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.reservation.ReservationMapper;
import com.jhta.project.vo.ReservationVo2;

@Service
public class ReservationServicephj {
	@Autowired private ReservationMapper mapper;
	
	public void setMapper(ReservationMapper mapper) {
		this.mapper=mapper;
	}
	public int insertRes(ReservationVo2 vo) {
		return mapper.insertRes(vo);
	}
	public ReservationVo2 selectRes(String mid) {
		return mapper.selectRes(mid);
	}
}
