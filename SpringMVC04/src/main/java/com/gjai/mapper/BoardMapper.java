package com.gjai.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.gjai.entity.BoardVO;
import com.gjai.entity.Criteria;
import com.gjai.entity.Member;

public interface BoardMapper {
	public List<BoardVO> getList(Criteria cri);
	public void insert(BoardVO vo);
	
	@Select("select * from reboard where idx = #{idx}")	// xml파일에서 쿼리문 안쓰고도 가능한 방법, 중복하면 안됨
	public BoardVO read(int idx);
	
	@Update("update reboard set boardAvailable = 0 where idx=#{idx}")
	public void delete(int idx);
	
	public void update(BoardVO vo);
	
	public Member getLogin(Member vo);
	public void replyUpdate(BoardVO parent);
	public void replyInsert(BoardVO vo);
	public int boardCount(Criteria cri);	// 총 게시물 개수
	
}
