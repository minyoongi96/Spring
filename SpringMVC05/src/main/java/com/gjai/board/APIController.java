package com.gjai.board;

import java.net.URL;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class APIController {
	
	@RequestMapping("/api.do")
	public String api() {
		
		return "api";
	}
	
	@ResponseBody
	@RequestMapping("/bible.do")
	public String getBible() {
		try {
			// 1. 요청 URL(Open API)
			String url = "https://sum.su.or.kr:8888/bible/today";
			
			// 2. URL 객체 생성
			URL u = new URL(url);
			
			// 3. 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "";
	}
}
