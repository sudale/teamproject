package com.jhta.project.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class Room_infoVo2 {
	private int riid;
	private String riroomtype;
	private int riroom;
	private String riservice;
	private String risize;
	private int riminper;
	private int rimaxper;
	private int ripeak;
	private int risemipeak; 
	private int rioff;//요금
	private String rimainimg; //이미지
	private String riextraimg1; //이미지
	private String riextraimg2; // 이미지
	private int aid;
}
