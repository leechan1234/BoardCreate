package com.board.service;

import java.util.List;

import com.board.domain.BoardVO;
import com.board.domain.Pager;

public interface BoardService {

	// 글 저장 처리 
	public void addArticle(BoardVO board);
	// 글 첨부파일 저장 처리 
	
	
	// 글 하나 가져오기 
	public BoardVO get(Long bno);
	// 글 수정 
	public boolean modify(BoardVO board);
	// 글 삭제 
	public boolean remove(Long bno);
	// 글 목록 + 페이징처리 
	public List<BoardVO> getList(Pager pager); 
	// 전체 글 개수 
	public int getTotal(Pager pager);
	
	
}
