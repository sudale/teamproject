package com.jhta.project.controller.member_mypage;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.project.service.qna.UserqnaService;
import com.jhta.project.vo.UserqnaVo3;

@Controller
public class myqnalistControllerjhr {
	@Autowired private UserqnaService service;
	@Autowired private ServletContext sc;
	@GetMapping("/jhr/mypageQnalist")
	public String listForm(String mid,Model model) {
		return "user/member_mypage/mypageQnalist";
	}
	@GetMapping("/jhr/myqnaUpdate")
	public String updateForm(String mid, String qid, Model model) {
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("mid",mid);
		map.put("qid",qid);
		UserqnaVo3 vo=service.detail(map);
		model.addAttribute("vo",vo);
		return "user/member_mypage/myqnaUpdate";
	}
	@PostMapping("/jhr/myqnaUpdate")
	public String update(String mid, String qid, String qcate, String qtitle, String qcontent, Model model) {
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("mid",mid);
		map.put("qid",qid);
		map.put("qcate",qcate);
		map.put("qtitle",qtitle);
		map.put("qcontent",qcontent);
		System.out.println(mid);
		System.out.println(qid);
		int vo=service.update(map);
		if(vo>0) {
			return "redirect:/user/member_mypage/mypage";
		} else {
			model.addAttribute("errMsg", "문의를 수정할 수 없습니다.");
			return "user/member_mypage/myqnaUpdate";
		}
	}
	@GetMapping("/jhr/myqnaDelete")
	public String delete(UserqnaVo3 qid) {
		service.delete(qid);
		return "redirect:/user/member_mypage/mypage";
	}
	
}
