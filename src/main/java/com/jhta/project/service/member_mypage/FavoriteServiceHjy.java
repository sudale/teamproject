package com.jhta.project.service.member_mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.member_mypage.FavoriteMapperHjy;

@Service
public class FavoriteServiceHjy {
	@Autowired FavoriteMapperHjy mapper;
	public String find(String mid) {
		return mapper.find(mid);
	}; 
}
