package com.gjai.entity;

import lombok.Data;

@Data
public class PageMaker {
	public Criteria cri;
	private int totalCount;	// 총 게시글의 수
	private int startPage;	// 시작페이지 번호
	
	private int endPage;	// 끝 페이지 번호
	private boolean prev;
	private boolean next;
	private int display = 3;	// 보여질 페이지 번호 수
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcPaging();
	}
	
	private void calcPaging() {
		// 1. 화면에 보여질 마지막 페이지 번호
		endPage=(int)(Math.ceil(cri.getPage()/(double)display)*display);
		
		// 2. 화면에 보여질 시작 페이지 번호
		startPage = endPage - display + 1;
		if(startPage <= 0) startPage = 1;
		
		// 3. 전체 마지막 페이지 계산
		int tempEndPage = (int)(Math.ceil(totalCount / (double)cri.getPerPageNum()));
		
		// 4. 화면에 보여질 마지막 페이지 유효성 검사
		if(tempEndPage < endPage) {
			endPage = tempEndPage;
		}
		
		// 5. 이전 페이지 링크 존재 여부
		prev = startPage == 1 ? false : true;
		
		// 6. 다음 페이지 링크 존재 여부
		next = endPage < tempEndPage ? true : false;
	}
}