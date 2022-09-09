package com.jhta.project.service.firstsearch;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.firstsearch.FavoritesearchMapperkjy;
import com.jhta.project.vo.FavoritesearchVo_kjy;

@Service
public class FavoritesearchService_kjy {
	@Autowired private FavoritesearchMapperkjy mapper;
	public List<FavoritesearchVo_kjy> hotelsearch(String hotel) {
		return mapper.hotelsearch(hotel);
	}
	public List<FavoritesearchVo_kjy> airportsearch(String portname) {
		return mapper.airportsearch(portname);
	}
	public List<FavoritesearchVo_kjy> airlinesearch(String airname) {
		return mapper.airlinesearch(airname);
	}
}
