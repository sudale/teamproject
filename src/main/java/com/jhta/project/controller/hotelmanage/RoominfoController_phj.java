package com.jhta.project.controller.hotelmanage;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.project.service.hotelmanage.RoominfoService_phj;
import com.jhta.project.vo.RoominfoVo_phj;

@Controller
public class RoominfoController_phj {
	
	@Autowired private RoominfoService_phj service;

	@GetMapping(value="/phj/roominfo/{riid}",produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String, Object> roominfo(@PathVariable("riid")int riid) {
		RoominfoVo_phj vo=service.select(riid);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("riroomtype",vo.getRiroomtype());
		map.put("rimaxper", vo.getRimaxper()); //숙박최대인원
		map.put("riminper", vo.getRiminper()); //숙박가능인원
		map.put("riservice", vo.getRiservice()); //부가서비스
		return map;
	}
}
