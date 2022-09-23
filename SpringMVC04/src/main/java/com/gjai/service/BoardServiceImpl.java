package com.gjai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.gjai.entity.BoardVO;
import com.gjai.entity.Criteria;
import com.gjai.entity.Member;
import com.gjai.mapper.BoardMapper;

@Service		// Controller와 Mapper 사이에서 비즈니스 로직을 추가할 수 있는 Service Layer
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardMapper boardMapper;
	
	@Override
	public List<BoardVO> getList(Criteria cri){
		List<BoardVO> list = boardMapper.getList(cri);
		
		return list;
	}
	@Override
	public void register(BoardVO vo) {
		boardMapper.insert(vo);
	}
	@Override
	public BoardVO get(int idx) {
		BoardVO vo = boardMapper.read(idx);	
		return vo;
	}
	@Override
	public void remove(int idx) {
		boardMapper.delete(idx);
	}
	@Override
	public void modify(BoardVO vo) {
		boardMapper.update(vo);
	}
	@Override
	public Member loginCheck(Member vo) {
		Member mvo = boardMapper.getLogin(vo);
		
		return mvo;
	}
	@Override
	public void replyUpdate(BoardVO parent) {
		boardMapper.replyUpdate(parent);
		
	}
	@Override
	public void replyInsert(BoardVO vo) {
		boardMapper.replyInsert(vo);
		
	}
	@Override
	public int boardCount(Criteria cri) {
		return boardMapper.boardCount(cri);
	}
	
}
