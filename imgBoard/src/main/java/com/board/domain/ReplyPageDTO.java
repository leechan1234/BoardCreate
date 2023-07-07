package com.board.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

// 댓글 목록 + 전체개수 담아 뷰에 전달할 용도로 사용 

@Data
@AllArgsConstructor
public class ReplyPageDTO {

	private int replyCount;		// 댓글 전체 개수 
	private List<ReplyVO> list; // 댓글 목록  
	
}
