package com.jhta.project.service.firstsearch;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.firstsearch.GetPriceMapperlhjcjy;
import com.jhta.mybatis.mapper.firstsearch.GetPriceMapperlhjcjyhjy;
import com.jhta.project.vo.AccommodationsVolhjcjy;


@Service
public class GetPriceServicelhjcjyhjy {
	@Autowired private GetPriceMapperlhjcjyhjy mapper;
	
	public List<AccommodationsVolhjcjy> getprice(HashMap<String, Object> map){
		return mapper.getprice(map);
	}
}
