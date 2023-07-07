// ReviewController.java
package com.tjc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.tjc.domain.PageInfo;
import com.tjc.domain.Pager;
import com.tjc.domain.ReviewVO;
import com.tjc.domain.ReviewimgVO;
import com.tjc.service.ReviewService;
import com.tjc.service.ReviewimgService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/board/*")
@Slf4j
@RequiredArgsConstructor
public class ReviewController {

	private final ReviewService reviewService; // 리뷰 처리
	private final ReviewimgService reviewimgService; // 리뷰 이미지 처리

	// 리뷰게시판 폼 요청
	@GetMapping("write")
	public String write(Model model) {
		return "board/write";
	}

	// 리뷰 게시판 글 작성 처리
	@PostMapping("write")
	public String reviewPro(ReviewVO review, MultipartFile[] uploadFile, HttpServletRequest request, Model model) {
		 // 주문 데이터에서 주문 유형을 추출하여 설정합니다.
		String type = review.getOrderdata().split("-")[0]; // orderdata="parts-10"
		review.setOrdertype(type); // ordertype 변수에 지정
		if (type.equals("custom")) { // 맞춤제작 주문일때
			  // 주문 번호를 추출하여 설정합니다.
			review.setOrdernum(Long.parseLong(review.getOrderdata().split("-")[1]));
		} else {// 부품주문이나 완제품주문일때
			// 제품 번호를 추출하여 설정
			review.setProductnum(Long.parseLong(review.getOrderdata().split("-")[1]));
		}

		reviewService.saveReview(review);

		// 사진 등록 처리 추가하기
		String path = request.getServletContext().getRealPath("/resources/upload");
		reviewimgService.addFiles(review.getReviewnum(), uploadFile, path);
		
	    // 상품번호와 분류를 모델에 추가
	    model.addAttribute("ordernum", review.getOrderdata().split("-")[1]);
	    model.addAttribute("ordertype", review.getOrdertype());
		 // 글 목록 페이지로 리다이렉트
		return "redirect:/board/list";
	}

	// 리뷰 리스트 목록 요청
	@GetMapping("list")
	public String list(PageInfo pageInfo, Model model) {
		// 비지니스 로직처리: DB에서 글 내용 가져오기
		List<ReviewVO> list = reviewService.getListWithPaging(pageInfo);
		model.addAttribute("list", list);
		
		// 글 목록에 해당하는 이미지들도 가져와 전달
		List<List<ReviewimgVO>> imgList = new ArrayList<>();
		for (ReviewVO review : list) {
			List<ReviewimgVO> reviewImgs = reviewimgService.getReviewImg(review.getReviewnum());
			imgList.add(reviewImgs);
		}
		model.addAttribute("imgList", imgList); 
		log.info("imgList : {}", imgList);
		// imgList        List[ List[ReviewImgVO, ReviewImgVO] ,List[ReviewImgVO] ,       List [ReviewImgVO] ,......... ]
		// 리뷰들의 이미지들         1번리뷰 이미지 묶음            		2번리뷰의 이미지묶음     			 3번리뷰의 이미지 묶음 
		
		// 페이징 처리를 위한 정보 계산하여 전달
		int total = reviewService.getReviewCount(pageInfo);
		Pager pager = new Pager(pageInfo, total);
		model.addAttribute("pager", pager);

		return "board/list";
	}

	// 리뷰 본문 페이지(제목 누르고 들어갔을때) 
	@GetMapping("content")
	public String content(Model model, Long reviewnum, @ModelAttribute("pageInfo") PageInfo pageInfo) {
		//데이터베이스에서 해당 리뷰 번호에 대한 리뷰를 조회
	    ReviewVO review = reviewService.getReview(reviewnum);
	    model.addAttribute("review", review);

	   
	    List<ReviewimgVO> imgList = reviewimgService.getReviewImg(review.getReviewnum());
	    //뷰로 리뷰 이미지 정보
	    model.addAttribute("imgList", imgList);
	    
	    return "board/content";
	}
	
	// 리뷰 삭제 
	@PostMapping("delete")
	public String delete(Long reviewnum, PageInfo pageInfo) {
		//리뷰 삭제
		reviewService.deleteReview(reviewnum);
		// 사진도 삭제 todo
		 reviewimgService.deleteReviewImages(reviewnum);
		
		return "redirect:/board/list" + pageInfo.getParameterToQueryString();
	}
}








