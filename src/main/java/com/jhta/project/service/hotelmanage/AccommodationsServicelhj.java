package com.jhta.project.service.hotelmanage;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.hotelmanage.Admin_AccommodationsMapperlhj;
import com.jhta.project.vo.AccommodationsVo2;
import com.jhta.project.vo.Room_infoVo2;


@Service
public class AccommodationsServicelhj {
	@Autowired private Admin_AccommodationsMapperlhj mapper;
	
	public int count(HashMap<String, Object> map) {
		return mapper.count(map);
	}
	public List<AccommodationsVo2> accommlist(){
		return mapper.accommlist();
	}
	public AccommodationsVo2 detail(int aid){
		return mapper.detail(aid);
	}
	public List<Room_infoVo2> roomlist(int aid){
		return mapper.roomlist(aid);
	}
	public Room_infoVo2 roomDetail(int riid){
		return mapper.roomDetail(riid);
	}
	public int accommUpdate(AccommodationsVo2 vo) {
		return mapper.accommUpdate(vo);
	}
	public int roomUpdate(Room_infoVo2 vo) {
		return mapper.roomUpdate(vo);
	}
	public int delupdate(HashMap<String, Object> map) {
		return mapper.delupdate(map);
	}
}