package com.jhta.mybatis.mapper.firstsearch;

import java.util.HashMap;

import com.jhta.project.vo.FavoriteVo_kjy;

public interface FavoriteMapperkjy {
	FavoriteVo_kjy list(String mid);
	int airportup(HashMap<String, Object> map);
	int airlineup(HashMap<String, Object> map);
	int hotelup(HashMap<String, Object> map);
}
