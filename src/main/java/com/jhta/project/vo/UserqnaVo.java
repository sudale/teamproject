package com.jhta.project.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class UserqnaVo {
	private String qid;
	private String qcate;
	private String qpw;
	private String qtitle;
	private String qcontent;
	private String qfile;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date qrdate;
	private String qlev;
	private int qref;
	private int qstep;
	private String mid;
}
