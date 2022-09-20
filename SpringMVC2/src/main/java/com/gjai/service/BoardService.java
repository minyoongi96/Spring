package com.gjai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.gjai.entity.BoardVO;
import com.gjai.mapper.BoardMapper;

@Service		// Controller와 Mapper 사이에서 비즈니스 로직을 추가할 수 있는 Service Layer
public class BoardService {
	
	@Autowired
	BoardMapper boardMapper;
	
	public List<BoardVO> boardList(){
		List<BoardVO> list = boardMapper.boardList();
		
		return list;
	}
	
	public void boardInsert(BoardVO vo) {
		boardMapper.boardInsert(vo);
	}
	
	public BoardVO boardView(int idx) {
		BoardVO vo = boardMapper.boardView(idx);	
		return vo;
	}
	
	public void boardDelete(int idx) {
		boardMapper.boardDelete(idx);
	}
	
	public void boardUpdate(BoardVO vo) {
		boardMapper.boardUpdate(vo);
	}
}
