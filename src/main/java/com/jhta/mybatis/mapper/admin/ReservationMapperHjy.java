package com.jhta.mybatis.mapper.admin;

import java.util.HashMap;
import java.util.List;

import com.jhta.project.vo.ReservationRateVo;
import com.jhta.project.vo.ReservationVo;

public interface ReservationMapperHjy {
	public List<ReservationRateVo> hotelReserRate(String time);
	public List<ReservationRateVo> roomReserRate(String time);
}
