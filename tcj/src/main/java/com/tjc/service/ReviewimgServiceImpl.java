package com.tjc.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.tjc.domain.PageInfo;
import com.tjc.domain.ReviewVO;
import com.tjc.domain.ReviewimgVO;
import com.tjc.persistence.ReviewimgMapper;

import lombok.RequiredArgsConstructor;
@Service
@RequiredArgsConstructor
public class ReviewimgServiceImpl implements ReviewimgService {
	
	private final ReviewimgMapper reviewimgMapper;
	
	// 이미지 파일 정보 DB에 저장 처리 로직 
	@Override
	public void addFiles(Long reviewnum, MultipartFile[] uploadFile, String path) {
		
		saveFiles(reviewnum, uploadFile, path);
	}//addFiles
	
	// 이미지들 저장처리 기능 
	private void saveFiles(Long reviewnum, MultipartFile[] uploadFile, String path) {
		 for (MultipartFile mf : uploadFile) {
		        if (!mf.isEmpty()) { // 파일이 비어있지 않은 경우에만 처리
		            //String contentType = mf.getContentType(); // 파일의 형식(타입) 추출
		            
		            UUID uuid = UUID.randomUUID(); // UUID 생성
		            String uploadFilename = uuid.toString(); // UUID를 파일 이름에 추가
		            String orgFilename = mf.getOriginalFilename(); // 업로드된 파일의 원본 이름 추출
		            String ext = orgFilename.substring(orgFilename.lastIndexOf(".")); // 파일 확장자 추출
		            uploadFilename += ext; // UUID와 확장자를 결합하여 최종 파일 이름 생성
		            
		            // DB에 이미지정보 저장하기위해 VO로 데이터 준비시키고 
		            ReviewimgVO imgVO = new ReviewimgVO(); // 리뷰 이미지 정보를 담을 ReviewimgVO 객체 생성
		            imgVO.setReviewnum(reviewnum);; // 리뷰 고유 번호 설정
		            imgVO.setPath(uploadFilename); // 파일명 설정
		            
		            // 실제 이미지 파일을 /resources/upload 폴더안에 저장 		           
		            File saveFile = new File(path, uploadFilename); // 파일 저장하기위해서 필요한 파일 객체 생성
		            try {
		                mf.transferTo(saveFile); // 실제 파일 저장해라!!!
		                
		                // 리뷰 이미지 정보 DB에 저장
		                reviewimgMapper.insertFile(imgVO); 
		            } catch (IOException e) {
		                e.printStackTrace();
		           }
		      }
		  }
	}

	// 리뷰 하나에 해당하는 이미지들 가져오기
	@Override
	public List<ReviewimgVO> getReviewImg(Long rinum) {
		
		List<ReviewimgVO> result = reviewimgMapper.getReviewImgs(rinum);
		return result;
	}

	// 리뷰 하나에 해당하는 이미지들 모두 삭제 
	@Override
	public void deleteReviewImages(Long reviewnum) {
		//todo 이미지 고유리뷰번호 가져와 삭제
		reviewimgMapper.deleteReviewImages(reviewnum);
		
	}

	// 리뷰 목록요청시, 목록에 띄워줄 각 리뷰에 해당하는 사진들 (reviewnum 이 필요함)
	@Override
	public List<ReviewimgVO> getReviewListImgs(List<ReviewimgVO> reviewList) {
		  List<ReviewimgVO> imgList = new ArrayList<>();
		    for (ReviewimgVO review : reviewList) {
		        List<ReviewimgVO> reviewImgs = reviewimgMapper.getReviewImgs(review.getReviewnum());
		        imgList.addAll(reviewImgs);
		  }
		   return imgList;
}

	

	
			
			
		
}// class


