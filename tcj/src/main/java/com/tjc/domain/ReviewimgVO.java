package com.tjc.domain;

import lombok.Data;

@Data
public class ReviewimgVO {
	private Long rinum; //리뷰 이미지 번호
	private Long reviewnum; //리뷰 번호,외래키 참조 review
	private String path; //리뷰 이미지 경로
	
}
