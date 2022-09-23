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
	
}
