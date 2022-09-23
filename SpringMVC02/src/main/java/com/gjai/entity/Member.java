package com.gjai.entity;

import lombok.Data;

@Data
//Data만 있으면 아래 3개는 선언안해도 됨
//@AllArgsConstructor
//@NoArgsConstructor
//@ToString
public class Member {
	private String memId;
	private String memPwd;
	private String memName;
}
