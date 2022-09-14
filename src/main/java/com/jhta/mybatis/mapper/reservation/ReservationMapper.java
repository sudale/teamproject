package com.jhta.mybatis.mapper.reservation;

import com.jhta.project.vo.ReservationVo2;

public interface ReservationMapper {
	int insertRes(ReservationVo2 vo);
	ReservationVo2 selectRes(String mid);
}

