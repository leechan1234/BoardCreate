package com.board.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardVO {
	
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Integer readcount;
	private Timestamp regDate;		//글 처음 작성시간
	private Timestamp updateDate;	//글 수정 시간 ( 화면에 보여줄 시간)
}
