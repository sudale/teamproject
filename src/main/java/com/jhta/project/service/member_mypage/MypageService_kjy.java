package com.jhta.project.service.member_mypage;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.member_mypage.MypageMapperkjy;
import com.jhta.project.vo.MypageVo_kjy;

@Service
public class MypageService_kjy {
	@Autowired private MypageMapperkjy mapper;
	public MypageVo_kjy list(String mid) {
		return mapper.list(mid);
	}
	public int profiledel(String mid) {
		return mapper.profiledel(mid);
	}
	public int profileup(HashMap<String, Object> map) {
		return mapper.profileup(map);
	}
}
