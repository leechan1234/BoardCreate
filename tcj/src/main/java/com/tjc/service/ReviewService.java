package com.tjc.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.tjc.domain.PageInfo;
import com.tjc.domain.ReviewVO;

public interface ReviewService {

	// 글 작성 로직
	public void saveReview(ReviewVO review);
	
	//글 전체 조회
	public List<ReviewVO> getList();
	
	//글 전체 조회 + 페이징 처리
	public List<ReviewVO> getListWithPaging(PageInfo pageInfo);
	
	//글 전체 개수 가져오기
	public int getReviewCount(PageInfo pageInfo);
	
	//글 한개 조회
	public ReviewVO getReview(Long reviewnum);
	
	// 리뷰 삭제 
	public void deleteReview(Long reviewnum);
	
	// 부품에 대한 리뷰 목록 가져오기  (부품 한개 상세페이지)
	public List<ReviewVO> getPartsReviews(String ordertype, Long productnum);
	
	// 완제품에 대한 리뷰 목록 가져오기 (완제품 한개 상세페이지) 
	public List<ReviewVO> getFinishedReviews(String ordertype, Long productnum);
	
	// 맞춤주문에 대한 리뷰 목록 가져오기 (맞춤주문 제작페이지)
	public List<ReviewVO> getCustomReviews(String ordertype, Long ordernum);
	
	
}
