package com.gjai.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
// Data만 있으면 아래 3개는 선언안해도 됨
//@AllArgsConstructor
//@NoArgsConstructor
//@ToString
public class BoardVO {
	private int idx;
	private String memId;
	private String title;
	private String contents;
	private int count;
	private String writer;
	private String indate;
	private int boardGroup;		// 게시물과 댓글을 묶는 역할
	private int boardSequence;	// 댓글 순서
	private int boardLevel;		// 댓글 레벨
	private int boardAvailable;	// 삭제 여부(0, 1)
	
}
