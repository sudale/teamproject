package com.jhta.project.service.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.admin.AdminMapperHjy;
import com.jhta.project.vo.HeadadminVo;

@Service
public class HeadadminServiceHjy {
	@Autowired AdminMapperHjy mapper;
	public HeadadminVo login(HeadadminVo vo) {
		return mapper.login(vo);
	}
}
