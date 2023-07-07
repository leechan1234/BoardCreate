package com.board.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReplyVO {

	private Long rno; 			// 댓글 고유번호 
	private Long bno; 			// 게시판 글 번호 
	private String rcontent; 	// 댓글 내용 
	private String replyer; 	// 댓글 작성자 
	private Timestamp regDate; 	// 댓글 작성시간 
	private Long rgroup; 		// 댓글 그룹 (첫 댓글의 rno)
	private Integer rstep; 		// 댓글 순서 
	private Integer rlevel;		// 글의 단계 (댓글의 댓글? 댓글의 대댓글?)
	
}
