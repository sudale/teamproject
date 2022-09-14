package com.jhta.project.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ReservationVo2 {
	private int rid;
	private int rordernum; // 객실예약번호
	private int ramount; // 인원
	private int rroomnum; // 방 개수
	private String rcheckin;
	private String rcheckout;
	private String rresname; //예약자이름
	private String rresphone;
	private String rresemail;
	private int rexbreaknum; //조식추가
	private int rexbed; //침대추가 
	private int rexperson; // 인원추가 
	private String rcancel;
	private String mid;
	private int riid;
	private String ptoken;
}
