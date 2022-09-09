package com.jhta.mybatis.mapper.admin;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.jhta.project.vo.ReservationVo;
import com.jhta.project.vo.RsvPaymentVo;

public interface Admin_CancelRefundMapperCjy {
	public List<RsvPaymentVo> list();
	public int update(HashMap<String, Object> map);
}
