package com.tjc.domain;

import lombok.Getter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Getter
@ToString
@Slf4j
public class Pager {
	
	// 페이번호는 10개씩 보여준다. 
	// list 밑에 페이지번호 보여줄 개수 지정(이 클래스 안에서만 사용할 용도)
	private final int PAGENUM_SIZE = 10;
	
	private int startPage;  // 시작 페이지 번호 
	private int endPage;	// 마지막 페이지 번호 
	private boolean prev, next;  // 이전, 다음 보여줄지 여부 
	
	private int total; 		// 전체 글의 개수 
	private PageInfo pageInfo;  // PageInfo 객체 (pageNum, listSize)
	
	// 생성자 : list.jsp에서 필요한 위 변수의 값 계산에 체워주기 
	public Pager(PageInfo pageInfo, int total) {
		this.pageInfo = pageInfo;
		this.total = total;
		
		// 현재 보고있는 기준에서의 마지막 페이지 번호 (10씩늘어나게 임의로 계산)
		this.endPage = (int)(Math.ceil(pageInfo.getPageNum() / (double)PAGENUM_SIZE)) * PAGENUM_SIZE; 
		this.startPage = this.endPage - (PAGENUM_SIZE - 1);
		// 전체에서 최종 마지막 페이지 번호 
		int realEnd = (int)(Math.ceil((double)total / pageInfo.getListSize()));
		// readEnd와 endPage를 비교해서 endPage 검증/정정
		if(this.endPage > realEnd) { 
			this.endPage = realEnd; 
		}
		
		this.prev = this.startPage > 1; 
		this.next = this.endPage < realEnd;
		
		log.info("startPage : {}", startPage);
		log.info("endPage : {}", endPage);
		log.info("realEnd : {}", realEnd);
		log.info("prev : {}", prev);
		log.info("next : {}", next);
		log.info("pageInfo : {}", pageInfo);
		
	}
	
}
