package com.gjai.member;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.gjai.entity.MemberVO;
import com.gjai.mapper.MemberMapper;

@Controller
public class MemberController {
	
	// @Autowired	// Inject는 Spring boot 까지 호환이 가능하다.
	@Inject
	private MemberMapper mapper;
	
	// spring 4.0버전 부터는 void 반환형 일 시, 메소드 이름이 리턴된다. (해당 메소드는 "main"으로 리턴)
	@RequestMapping("/main.do")
	public void main() {}
	
	@RequestMapping("join.do")
	public void join() {}
	
	@RequestMapping("/idCheck.do")
	public @ResponseBody MemberVO idCheck(String id) {
		MemberVO vo = mapper.idCheck(id);
		
		if(vo != null) {
			vo = new MemberVO();
			vo.setId("true");
		} else {
			vo = new MemberVO();
			vo.setId("null");
		}
		
		return vo;
	}
	
	@PostMapping("/memberList.do")
	public @ResponseBody List<MemberVO> memberList(){
		List<MemberVO> list = mapper.memberList();
		System.out.println(list);
		
		return list;
	}
	
}
