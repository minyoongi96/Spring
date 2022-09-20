package com.gjai.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import com.gjai.entity.BoardVO;

public interface BoardMapper {
	public List<BoardVO> boardList();
	public void boardInsert(BoardVO vo);
	
	@Select("select * from board where idx = #{idx}")	// xml파일에서 쿼리문 안쓰고도 가능한 방법, 중복하면 안됨
	public BoardVO boardView(int idx);
	
	@Delete("delete from board where idx = #{idx}")
	public void boardDelete(int idx);
	
	public void boardUpdate(BoardVO vo);
}
