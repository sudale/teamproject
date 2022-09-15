package com.jhta.project.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;



//getter,setter 를 동시에 할수잇는 어노케이션 Data
//객채생성페이지
@Data   
@AllArgsConstructor
@NoArgsConstructor
public class AccommodationsVo {
	private int aid;
	private String acate;
	private String aname;
	private String aaddress;
	private String aphone;
	private String axcoordi;
	private String aycoordi;
	private int atotalroom;
	private String restar;
	private String agrade;
	private String adetail;
	private String amainimg;
	private Date aregdate;
	private String aisde1;
}
