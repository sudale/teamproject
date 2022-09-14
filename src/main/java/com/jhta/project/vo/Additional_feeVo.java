package com.jhta.project.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Additional_feeVo {
	private int afid;
	private int afpersonnel; //인원수 추가
	private int afbreakfast; //조식추
	private int afbed; //침대추가
	private int riid;
	private List<Additional_feeVo> additional_feeVo;

}
