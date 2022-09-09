package com.jhta.project.service.reservation;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.reservation.ReservationMapperkjy;
import com.jhta.project.vo.AccommodationsVo_kjy;
import com.jhta.project.vo.PayMentVo_kjy;
import com.jhta.project.vo.ReservationVo_kjy;

@Service
public class ReservationService_kjy {
	@Autowired private ReservationMapperkjy mapper;
	public List<ReservationVo_kjy> pastlist(HashMap<String, Object> map){
		return mapper.pastlist(map);
	}
	public List<ReservationVo_kjy> currentlist(String mid){
		return mapper.currentlist(mid);
	}
	public int pastcount(String mid) {
		return mapper.pastcount(mid);
	}
	public int rcancel(int rid) {
		return mapper.rcancel(rid);
	}
	public int refund(int pid) {
		return mapper.refund(pid);
	}
	public PayMentVo_kjy payment(int pid) {
		return mapper.payment(pid);
	}
}
