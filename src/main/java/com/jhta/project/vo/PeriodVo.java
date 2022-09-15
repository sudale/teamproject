package com.jhta.project.vo;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

//시즌
public class PeriodVo {
	private int peid;
	private String peseason;
	private Date pestart;
	private Date peend;
	private int aid;
	
	private List<PeriodVo> periodVo;

}
