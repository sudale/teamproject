package com.jhta.project.service.firstsearch;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.firstsearch.FavoriteMapperkjy;
import com.jhta.mybatis.mapper.firstsearch.FavoritesearchMapperkjy;
import com.jhta.project.vo.FavoriteVo_kjy;

@Service
public class FavoriteService_kjy {
	@Autowired private FavoriteMapperkjy mapper;
	public FavoriteVo_kjy list(String mid) {
		return mapper.list(mid);
	}
	public int airportup(HashMap<String, Object> map) {
		return mapper.airportup(map);
	}
	public int airlineup(HashMap<String, Object> map) {
		return mapper.airlineup(map);
	}
	public int hotelup(HashMap<String, Object> map) {
		return mapper.hotelup(map);
	}
}
