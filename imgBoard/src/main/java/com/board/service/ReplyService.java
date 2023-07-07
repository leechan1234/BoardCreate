package com.board.service;

import java.util.List;

import com.board.domain.Pager;
import com.board.domain.ReplyPageDTO;
import com.board.domain.ReplyVO;

// 댓글 서비스 인터페이스 
public interface ReplyService {

	// 댓글 신규 등록
	public int insert(ReplyVO reply);
	// 댓글의 답글 등록 
	public int addReply(ReplyVO reply);
	
	// 댓글 한개 조회 
	public ReplyVO get(Long rno);
	// 댓글 삭제 
	public int delete(Long rno);
	// 본문에 해당하는 댓글 모두 삭제 
	public int deleteReplies(Long bno);
	
	// 댓글 조회 + 페이징 처리 
	public ReplyPageDTO getListWithPaging(Long bno, Pager pager);
	
	
}
