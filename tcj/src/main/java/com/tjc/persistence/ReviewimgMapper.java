package com.tjc.persistence;

import java.util.List;

import com.tjc.domain.ReviewimgVO;

public interface ReviewimgMapper {
	
	// 리뷰 이미지 정보 저장
	public int insertFile(ReviewimgVO vo);

	// 리뷰에 해당하는 이미지들 조회
	public List<ReviewimgVO> getReviewImgs(Long reviewnum);

	// 이미지 정보 삭제
	public void deleteReviewImages(Long reviewnum);


	
	
}
