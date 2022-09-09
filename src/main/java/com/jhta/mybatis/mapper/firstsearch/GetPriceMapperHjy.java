package com.jhta.mybatis.mapper.firstsearch;

import java.util.HashMap;
import java.util.List;

import com.jhta.project.vo.AccommodationsVolhjcjy;

public interface GetPriceMapperHjy {
	List<AccommodationsVolhjcjy> getprice(HashMap<String, Object> map);
	String daylist(HashMap<String, Object> map);
}
