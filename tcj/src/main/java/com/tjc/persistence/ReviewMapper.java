package com.tjc.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.tjc.domain.PageInfo;
import com.tjc.domain.ReviewVO;

public interface ReviewMapper {
	
	//글 저장
	public void insertReview(ReviewVO review);
	
	//글 전체 조회(구버전, 페이징처리x)
	public List<ReviewVO> getList();
	
	// 글 전체 조회 + 페이징처리 
	public List<ReviewVO> getListWithPaging(PageInfo pageInfo);
		
	// 전체 글 개수 조회 
	public int getReviewCount(PageInfo pageInfo);
		
	// 글 한개 조회 TODO
	public ReviewVO getReview(Long reviewnum);
	
	// 글 삭제 
	public void deleteReview(Long reviewnum);
	// 사진테이블 db에서 삭제 
	

	// TODO
	// 부품에 대한 리뷰 목록 가져오기  (부품 한개 상세페이지)
	public List<ReviewVO> getPartsReviews(@Param("ordertype")String ordertype, 
			@Param("productnum")Long productnum);
	
	// 완제품에 대한 리뷰 목록 가져오기 (완제품 한개 상세페이지) 
	public List<ReviewVO> getFinishedReviews(@Param("ordertype")String ordertype, 
			@Param("productnum")Long productnum);
	
	// 맞춤주문에 대한 리뷰 목록 가져오기 (맞춤주문 제작페이지)
	public List<ReviewVO> getCustomReviews(@Param("ordertype")String ordertype, 
			@Param("ordernum") Long ordernum);
	
}
