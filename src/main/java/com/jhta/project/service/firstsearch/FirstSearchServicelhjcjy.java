package com.jhta.project.service.firstsearch;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.firstsearch.AutoCompleteMapperlhjcjy;
import com.jhta.mybatis.mapper.firstsearch.FirstSearchMapperlhjcjy;
import com.jhta.project.vo.AccommodationsVo2lhjcjy;
import com.jhta.project.vo.RangeSlider_GetMinMaxVolhjcjy;




@Service
public class FirstSearchServicelhjcjy {
@Autowired private FirstSearchMapperlhjcjy mapper;
@Autowired private AutoCompleteMapperlhjcjy mapper1;

	public List<String> findhotel(String aname){
		return mapper1.findhotel(aname);
	}
	
	public List<AccommodationsVo2lhjcjy> searchDefault(HashMap<String, Object> map){
		return mapper.searchDefault(map);
	}
	public RangeSlider_GetMinMaxVolhjcjy rangeSlider_getMinMax(HashMap<String, Object> map) {
		return mapper.rangeSlider_getMinMax(map);
	}
}
