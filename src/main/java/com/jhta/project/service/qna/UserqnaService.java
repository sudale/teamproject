package com.jhta.project.service.qna;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.jhr.UserqnaMapper;
import com.jhta.project.vo.UserqnaVo3;

@Service
public class UserqnaService {
   @Autowired UserqnaMapper mapper;
   public UserqnaVo3 detail(HashMap<String, String> map) {
	   return mapper.detail(map);
   }
   public List<UserqnaVo3> detail2(String mid) {
	   return mapper.detail2(mid);
   }
   public int delete(UserqnaVo3 vo) {
	   return mapper.delete(vo);
   }
   public int update(HashMap<String, String> map) {
	   return mapper.update(map);
   }
   public List<UserqnaVo3> checkId(String mid) {
	   return mapper.checkId(mid);
   }
   public List<UserqnaVo3> list(HashMap<String, Object> map) {
	   return mapper.list(map);
   }
   public int getCount(HashMap<String, Object> map) {
	   return mapper.count(map);
   }
   public UserqnaVo3 prev(int num) {
	   return mapper.prev(num);
   }
   public UserqnaVo3 next(int num) {
	   return mapper.next(num);
   }
}