package com.gjai.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import com.gjai.entity.BoardVO;
import com.gjai.entity.Member;

public interface BoardMapper {
	public List<BoardVO> getList();
	public void insert(BoardVO vo);
	
	@Select("select * from board where idx = #{idx}")	// xml파일에서 쿼리문 안쓰고도 가능한 방법, 중복하면 안됨
	public BoardVO read(int idx);
	
	@Delete("delete from board where idx = #{idx}")
	public void delete(int idx);
	
	public void update(BoardVO vo);
	
	public Member getLogin(Member vo);
}
