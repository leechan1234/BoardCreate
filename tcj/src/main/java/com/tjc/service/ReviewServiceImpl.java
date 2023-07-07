package com.tjc.service;

import java.io.File;
import java.util.List;

import org.springframework.stereotype.Service;

import com.tjc.domain.PageInfo;
import com.tjc.domain.ReviewVO;
import com.tjc.domain.ReviewimgVO;
import com.tjc.persistence.ReviewMapper;
import com.tjc.persistence.ReviewimgMapper;

import lombok.RequiredArgsConstructor;
@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService {

		private final ReviewMapper reviewMapper;
		private final ReviewimgMapper reviewimgMapper;
	
	//글 저장
	@Override
	public void saveReview(ReviewVO review) {
		//db에 저장 시키기
		reviewMapper.insertReview(review);
	}
	
	//글 전체 조회
	@Override
	public List<ReviewVO> getList() {
		return reviewMapper.getList();
	}
	
	// 글 전체 조회 + 페이징 처리
	@Override
	public List<ReviewVO> getListWithPaging(PageInfo pageInfo) {
		
		return reviewMapper.getListWithPaging(pageInfo);
	}
	
	// 전체 글 개수 구하기 
	@Override
	public int getReviewCount(PageInfo pageInfo) {
		
		return reviewMapper.getReviewCount(pageInfo);
	}

	// 글 한개 조회
	@Override
	public ReviewVO getReview(Long reviewnum) {
		ReviewVO review = reviewMapper.getReview(reviewnum);
		return review;
	}
	// 부품에 대한 리뷰 목록 가져오기  (부품 한개 상세페이지)
	@Override
	public List<ReviewVO> getPartsReviews(String ordertype, Long productnum) {
		return reviewMapper.getPartsReviews(ordertype, productnum);
	}
	// 완제품에 대한 리뷰 목록 가져오기 (완제품 한개 상세페이지) 
	@Override
	public List<ReviewVO> getFinishedReviews(String ordertype, Long productnum) {
		return reviewMapper.getFinishedReviews(ordertype, productnum);
	}
	// 맞춤주문에 대한 리뷰 목록 가져오기 (맞춤주문 제작페이지)
	@Override
	public List<ReviewVO> getCustomReviews(String ordertype, Long ordernum) {
		return reviewMapper.getCustomReviews(ordertype, ordernum);
	}
	
	// 리뷰 삭제
	@Override
	public void deleteReview(Long reviewnum) {
	    // 리뷰 이미지 정보 가져오기
	    List<ReviewimgVO> reviewImages = reviewimgMapper.getReviewImgs(reviewnum);

	    // 리뷰 이미지 삭제
//	    for (ReviewimgVO reviewImage : reviewImages) {
//	        String imagePath = reviewImage.getPath();
//	        // 실제 이미지 파일 삭제
//	        File imageFile = new File(imagePath);
//	        imageFile.delete();
//	        
	    // 리뷰 이미지 삭제
	    for (ReviewimgVO reviewImage : reviewImages) {
	        // 데이터베이스에서 이미지 정보 삭제
	        reviewimgMapper.deleteReviewImages(reviewImage.getReviewnum());
	    }
	   

	    // 리뷰 삭제
	    reviewMapper.deleteReview(reviewnum);
	}
		




}
