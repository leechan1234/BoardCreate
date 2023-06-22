package com.board.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {

	// 한페이지에 보여줄 페이지번호의 개수 
	private final int PAGENUM_SIZE = 10; 
	
	private int startPage; 
	private int endPage; 
	private boolean prev, next; 
	
	private int total; 
	private Pager pager;  // pageNum, listSize, sel, keyword
	private int bnumber;  // 글 목록에 뿌려줘야하는 가상 글 번호 
	
	public PageDTO(Pager pager, int total) {
		this.pager = pager; 
		this.total = total; 
		
		this.endPage = (int)(Math.ceil( (double)pager.getPageNum() / PAGENUM_SIZE)) * PAGENUM_SIZE;
		this.startPage = this.endPage - (PAGENUM_SIZE - 1);
		int realEnd = (int)(Math.ceil( (double)total / pager.getListSize() ));
		if(this.endPage > realEnd) {
			this.endPage = realEnd; 
		}
		
		this.prev = this.startPage > 1; 
		this.next = this.endPage < realEnd; 
		
		bnumber = total - (pager.getPageNum()-1) * pager.getListSize(); 
		
	}
	
	
	
	
}
