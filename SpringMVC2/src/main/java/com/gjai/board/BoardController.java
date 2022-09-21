package com.gjai.board;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gjai.entity.BoardVO;
import com.gjai.entity.Member;
import com.gjai.mapper.BoardMapper;
import com.gjai.service.BoardServiceImpl;
@Controller		// new BoardController();  @Controller : 해당 클래스를 메모리에 할당
public class BoardController {
	@Autowired    // Spring 컨테이너에서 필요한 의존 객체의 "타입"에 해당하는 빈을 찾아 주입(DI: 의존성 주입)
	BoardServiceImpl boardService;	// servlet-context에서 스캔한 service 레이어를 Spring 컨테이너에서 찾음
								// BoardService에서 BoardMapper를 통해 DB와 연결 (비즈니스 로직은 Service 레이어에서)
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	@RequestMapping("/boardList.do")   // HandlerMapping이 내부적으로 처리됨
	public String boardList(Model model){
		System.out.println("게시판 목록보기 요청");
		
		List<BoardVO> list = boardService.getList();
	    model.addAttribute("list", list);
		return "boardList";
	}
	
	@RequestMapping(value="/boardWrite.do", method = RequestMethod.GET)
	public String register() {
		return "boardWrite";
	}
	
	@RequestMapping(value="/boardWrite.do", method = RequestMethod.POST)
	public String register(BoardVO vo, HttpSession session) {
		Member mvo = (Member)session.getAttribute("mvo");
		
		vo.setMemId(mvo.getMemId());
		boardService.register(vo);	// vo의 파라미터명과 jsp에서 넘어오는 파라미터명이 같으면 자동으로 맵핑되어 vo형태로 받아올 수 있다.
		
		return "redirect:/boardList.do";
	}
	
	@GetMapping("/boardView.do")
	public String get(@RequestParam("idx") int idx, Model model) {	// 넘어오는 파라미터명과 받을때 변수 명이 같으면 자동으로 맵핑, 다를때는 @RequestParam("idx") int idx 로
		//System.out.println(idx);
		BoardVO vo = boardService.get(idx);
		model.addAttribute("vo", vo);
		
		return "boardView";
	}
	
	// 			 /boardDelete.do/9
	@GetMapping("/boardDelete.do/{idx}")
	public String remove(@PathVariable int idx) {	// url의 {idx}를 파라미터로 받을 때 쓰는 어노테이션
		boardService.remove(idx);
		return "redirect:/boardList.do";
	}
	
	@GetMapping("/boardUpdate.do/{idx}")
	public String modify(@PathVariable int idx, Model model) {
		BoardVO vo = boardService.get(idx);
		model.addAttribute("vo", vo);
		return "boardUpdate";
	}
	
	@PostMapping("/boardUpdate.do")
	public String modify(BoardVO vo) {
		System.out.println(vo);
		boardService.modify(vo);
		
		return "redirect:/boardList.do";
	}
}