package com.tjc.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

// list 페이지 요청 시 부수적인 파라미터 정보 담아줄 객체 
@Getter
@Setter
@ToString
public class PageInfo {

	private int pageNum; 	// 페이지 번호
	private int listSize; 	// 한 페이지에 보여줄 게시글의 개수 (10개)

	// 검색기능 위해 추가 
	private String sel; 	// 검색 조건 : t c w tc tw tcw (select 태그의 option value값)
	private String keyword; // 검색 키워드 
	
	// 기본생성자 : pageNum과 listSize의 기본값을 1, 10 지정 
	public PageInfo() {
		this(1, 10); // 1page 10개씩 보여주기로 기본값 처리 
	}
	public PageInfo(int pageNum, int listSize) {
		this.pageNum = pageNum; 
		this.listSize = listSize;
	}
	
	// set 변수에 있는 조건검색값을 문자열하나씩 때서 배열로 리턴해주는 메서드 
	public String[] getSelArr() { // Mapper.xml -> selArr 이름으로 접근 
		return sel == null ? new String[] {} : sel.split("");
	}
	
	// 각 변수의 이름과 값을 쿼리스트링 형태로 변환해서 리턴해주는 메서드 
	public String getParameterToQueryString() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("listSize", this.listSize)
				.queryParam("sel", this.sel)
				.queryParam("keyword", this.keyword);
		
		System.out.println("uri string : " + builder.toUriString());
		
		// 문자열로 리턴 : ?pageNum=1&listSize=10
		return builder.toUriString();
	}
	
	
	
	
}
