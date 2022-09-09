package com.jhta.mybatis.mapper.payment;

import java.util.HashMap;
import java.util.List;

import com.jhta.project.vo.PaymentVo2;

public interface Admin_PaymentMapperlhj {
	public int count(HashMap<String, Object> map);
	public List<PaymentVo2> paymentlist();
}