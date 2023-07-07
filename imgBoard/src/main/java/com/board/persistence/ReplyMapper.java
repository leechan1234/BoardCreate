package com.board.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.board.domain.Pager;
import com.board.domain.ReplyVO;

// 댓글 Mapper 
public interface ReplyMapper {

	// 신규 댓글 저장 
	public int insert(ReplyVO vo);
	
	// 댓글의답글 rstep 수정 
	public int upadateStep(ReplyVO vo);
	// 댓글의 답글 저장 
	public int addReReply(ReplyVO vo);
	
	
	// 댓글 한개 조회 
	public ReplyVO read(Long rno);
	
	// 댓글 삭제 
	public int delete(Long rno);
	// 본문 글에 해당하는 모든 댓글 삭제 
	public int deleteReplies(Long bno);
	
	// 댓글 목록 조회 (+ 페이징처리) 
	public List<ReplyVO> getListWithPaging(
			@Param("bno") Long bno, 
			@Param("pager") Pager pager);
	// 댓글 전체 개수 
	public int getReplyCount(Long bno);
	
	
	
}
