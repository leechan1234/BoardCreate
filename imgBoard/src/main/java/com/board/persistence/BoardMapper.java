package com.board.persistence;

import java.util.List;

import com.board.domain.BoardVO;
import com.board.domain.Pager;

public interface BoardMapper {

	// 글 저장 
	public int insert(BoardVO vo); 
	// 글 하나 가져오기 
	public BoardVO getArticle(Long bno);
	// 글 수정 
	public int update(BoardVO vo);
	// 글 삭제 
	public int delete(Long bno);
	
	// 글 목록 가져오기 (페이징 처리) 
	public List<BoardVO> getListWithPaging(Pager pager);
	// 글 전체 개수 
	public int getArticleCount(Pager pager);
	
	
}
