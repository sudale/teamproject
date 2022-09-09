package com.jhta.project.controller.hotelmanage;

import java.util.HashMap;
import java.util.List;

import com.jhta.project.vo.AccommodationsVo2;
import com.jhta.project.vo.Room_infoVo2;

public interface Admin_AccommodationsMapperlhj {
	public int count(HashMap<String, Object> map);
	public List<AccommodationsVo2> accommlist();
	public AccommodationsVo2 detail(int aid);
	public List<Room_infoVo2> roomlist(int aid);
	public Room_infoVo2 roomDetail(int riid);
	public int accommUpdate(AccommodationsVo2 vo);
	public int roomUpdate(Room_infoVo2 vo);
	public int delupdate(HashMap<String, Object> map);
}