package com.gjai.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gjai.entity.BoardVO;
import com.gjai.service.BoardService;

@RestController		// JSON Data 리턴 (REST)
public class BoardRestController {
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping("/board")
	public List<BoardVO> boardListAjax() {
		List<BoardVO> list = boardService.boardList();
		
		return list;		// jackson-databind api를 사용해서 자동으로 Object -> JSON 변환
	}
	// public @ResponseBody List<BoardVO> boardListAjax() : @RestController가 아니라 @Controller일 때는 메서드에 @ResponseBody를 사용하면 json형태로 응답하게 됨
	
	
	// boardViewAjax와 boardDeleteAjax 둘다 맵핑 url은 같지만
	// 클라이언트가 ajax통신으로 요청할 때 type : "get" 이면 boardViewAjax, type: "delete"이면 boardDeleteAjax가 호출된다.
	// GetMapping -> {type : "get"} ,   DeleteMapping -> {type : "delete"}
	@GetMapping("/board/{idx}")
	public BoardVO boardViewAjax(@PathVariable int idx) {
		return boardService.boardView(idx);
	}
	
	@DeleteMapping("/board/{idx}")
	public void boardDeleteAjax(@PathVariable int idx) {
		boardService.boardDelete(idx);
	}

}
