package com.jhta.project.service.firstsearch;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.firstsearch.SortByPriceMapperlhjcjy;
import com.jhta.project.vo.AccommodationsVo2lhjcjy;



@Service
public class SortByPriceServicelhycjy {
	@Autowired private SortByPriceMapperlhjcjy mapper;
	public List<AccommodationsVo2lhjcjy> sortbyall(HashMap<String, Object> map){
		return mapper.sortbyall(map);
	}
	public List<AccommodationsVo2lhjcjy> sortPrice_low(HashMap<String, Object> map){
		return mapper.sortPrice_low(map);
	}
	public List<AccommodationsVo2lhjcjy> sortPrice_high(HashMap<String, Object> map){
		return mapper.sortPrice_high(map);
	}
	public List<AccommodationsVo2lhjcjy> rangeSlider_price(HashMap<String, Object> map) {
		return mapper.rangeSlider_price(map);
	}

}
 