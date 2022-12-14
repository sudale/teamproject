package com.jhta.project.service.firstsearch;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.firstsearch.AutoCompleteMapperlhjcjy;
import com.jhta.mybatis.mapper.firstsearch.FirstSearchMapperlhjcjy;
import com.jhta.mybatis.mapper.firstsearch.SearchByStarMapperlhjcjy;
import com.jhta.project.vo.SearchVolhjcjy;



@Service
public class SearchByStarServicelhjcjy {
@Autowired private SearchByStarMapperlhjcjy mapper;

	public List<SearchVolhjcjy> getStarList(HashMap<String, Object> map){
		return mapper.getStarList(map);
	}
	
	public List<SearchVolhjcjy> getStarSec(HashMap<String, Object> map){
		return mapper.getStarSec(map);
	}
}
