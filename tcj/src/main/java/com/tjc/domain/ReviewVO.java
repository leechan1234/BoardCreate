package com.tjc.domain;

import java.sql.Timestamp;

import lombok.Data;
@Data

public class ReviewVO {

	private Long reviewnum;//  리뷰 번호
	private String id;  // 회원 아이디, 외래키 참조 users
	private String ordertype; // 주문타입  parts or finished or custom 값만 들어감 
	private Long productnum; // 주문한 상품번호 (부품번호 또는 완제품상품번호)
	private Long ordernum;	// 맞춤제작 주문번호 
	private String content; // 리뷰 내용
	private String title; // 리뷰 제목
	private Timestamp reg; // 리뷰 작성 일자
	
	private String orderdata; // 뷰에서 select 선택해 임시로 받을 변수 (DB와 상관 없음) 
}
