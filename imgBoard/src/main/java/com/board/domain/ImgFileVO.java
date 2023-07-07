package com.board.domain;

import lombok.Data;

@Data
public class ImgFileVO {

	private Long fno; 				// 파일 고유번호 
	private Long bno; 				// 게시판 글 번호
	private String filename; 		// 파일 저장 이름 (uuid)
	private String orgfilename; 	// 파일 원본 이름 
	private String filetype; 		// 파일의 컨텐트타입 
	
}
