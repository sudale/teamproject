package com.jhta.project.service.firstsearch;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.firstsearch.AutoCompleteMapperHjy;

@Service
public class FirstSearchServiceHjy {
@Autowired private AutoCompleteMapperHjy automapper;

	public List<String> findhotel(String aname){
		return automapper.findhotel(aname);
	}
}
