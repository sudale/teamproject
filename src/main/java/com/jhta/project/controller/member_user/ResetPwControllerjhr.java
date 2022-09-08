package com.jhta.project.controller.member_user;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jhta.project.service.member_user.MembersService;
import com.jhta.project.vo.jhr.MembersVo;

@Controller
public class ResetPwControllerjhr {
	@Autowired private MembersService service;
	@GetMapping("/member_user/checkpw")
	public String loginForm() {
		return "user/jhr/checkpw";
	}
	@PostMapping("/jhr/checkpw")
	public String findid(String mid, String mname, String mphone, String memail, String mbirth, Model model) {
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("mid",mid);
		map.put("mname",mname);
		map.put("mphone",mphone);
		map.put("memail",memail);
		map.put("mbirth",mbirth);
		MembersVo vo=service.checkPw(map);
		if(vo!=null) { 
			//model.addAttribute("mid",mid);
			return "user/member_user/resetpw";
		} else {
			model.addAttribute("errMsg", "입력하신 정보와 일치하는 계정이 없습니다.");
			return "user/member_user/checkpw";
		}
	}
	@PostMapping("/jhr/resetpw")
	public String resetpw(MembersVo vo, Model model) {
		try {
			service.resetPw(vo);
			return "redirect:/member_user/login";
		} catch(Exception e) {
			e.printStackTrace();
			return "user/member_user/resetpw";
		}
	}
	
	@GetMapping("/jhr/mypageResetpw")
	public String updateForm() {
		return "user/member_mypage/mypageResetpw";
	}
	@PostMapping("/jhr/mypageResetpw")
	public String mypageResetpw(MembersVo vo,Model model, HttpSession session) {
		try {
			service.resetPw(vo);
			session.invalidate();
			return "redirect:/member_user/login";
		} catch(Exception e) {
			e.printStackTrace();
			return "user/member_mypage/mypageResetpw";
		}
	}
}
