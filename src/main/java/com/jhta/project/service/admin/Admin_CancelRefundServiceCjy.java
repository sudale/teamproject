package com.jhta.project.service.admin;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.admin.Admin_CancelRefundMapperCjy;
import com.jhta.project.vo.ReservationVo;
import com.jhta.project.vo.RsvPaymentVo;

@Service
public class Admin_CancelRefundServiceCjy {
	@Autowired Admin_CancelRefundMapperCjy mapper;
	public List<RsvPaymentVo> list(){
		return mapper.list();
	}
	public int update(HashMap<String, Object> map) {
		return mapper.update(map);
	}
}
