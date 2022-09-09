package com.jhta.project.service.payment;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.payment.Admin_PaymentMapperlhj;
import com.jhta.project.vo.PaymentVo2;


@Service
public class PaymentServicelhj {
	@Autowired private Admin_PaymentMapperlhj mapper;
	
	public int count(HashMap<String, Object> map) {
		return mapper.count(map);
	}
	public List<PaymentVo2> paymentlist(){
		return mapper.paymentlist();
	}
}