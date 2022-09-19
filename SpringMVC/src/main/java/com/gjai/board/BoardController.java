package com.gjai.board;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gjai.entity.BoardVO;
import com.gjai.mapper.BoardMapper;
@Controller
public class BoardController {
	@Autowired    // 알아서 객체 생성
	BoardMapper mapper;
	
	@RequestMapping("/boardList.do")
	public String boardList(Model model){
		System.out.println("게시판 목록보기 요청");
		
		List<BoardVO> list = mapper.boardList();
	    model.addAttribute("list", list);
		return "boardList";
	}
}