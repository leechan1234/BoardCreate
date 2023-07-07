package com.tjc.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.tjc.domain.PageInfo;
import com.tjc.domain.ReviewVO;
import com.tjc.domain.ReviewimgVO;

//이미지 파일용 로직처리
public interface ReviewimgService {

	// 이미지 파일 저장 처리
//	public void addFiles(Long reviewnum, MultipartFile[] uploadFile, String path);
	public void addFiles(Long reviewnum, MultipartFile[] uploadFile, String path);

	
	// 리뷰 하나에 해당하는 이미지들 가져오기
	public List<ReviewimgVO> getReviewImg(Long reviewnum);
	
	
	// 리뷰에 해당하는 이미지목록 삭제
	public void deleteReviewImages(Long reviewnum);

	// 리뷰 목록들에 해당하는 이미지들 가져오기 (매개변수 수정)
	public List<ReviewimgVO> getReviewListImgs(List<ReviewimgVO> reviewList);
	

	
}
