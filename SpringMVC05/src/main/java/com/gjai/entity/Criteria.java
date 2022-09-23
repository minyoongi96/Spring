package com.gjai.entity;

import lombok.Data;

@Data
public class Criteria {
	private int page;	 //현재 페에지 번호
	private int perPageNum;
	
	private String type;
	private String keyword;
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}
	
	// 현재 페이지의 게시글 시작 번호
	public int getPageStart() {
		return (page - 1) * perPageNum;	// limit 0, 10
	}
}
