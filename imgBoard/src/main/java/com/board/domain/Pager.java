package com.board.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Pager {

	private int pageNum; 
	private int listSize;
	
	private String sel;   // t c w tw tc tcw
	private String keyword;
	
	public Pager() { // ..8080/board/list 요청하면 pageNum listSize 안넘어옴 
		this(1, 10); // 1페이지 10개씩 으로 초기화 
	}
	
	public Pager(int pageNum, int listSize) {
		this.pageNum = pageNum; 
		this.listSize = listSize;
	}
	
	// sel 값을 문자열 배열에 담아주는 메서드 
	public String[] getSelArr() {
		return sel == null ? new String[] {} : sel.split("");
	}
	
	// 위 변수=값 들을 쿼리스트링으로 변환해주는 메서드 
	public String getParameterQuery() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("listSize", this.listSize)
				.queryParam("sel", this.sel)
				.queryParam("keyword", this.keyword);
		System.out.println("pageInfo uri query string " + builder.toUriString());
		
		return builder.toUriString();
	}
	
	
	
	
}
