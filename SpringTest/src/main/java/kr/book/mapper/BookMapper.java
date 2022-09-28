package kr.book.mapper;

import java.util.List;

import kr.book.entity.BookVO;


public interface BookMapper {
	
	public List<BookVO> bookList();
	public void bookInsert(BookVO vo);
	
	
}