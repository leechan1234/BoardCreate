package com.tjc.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tjc.domain.PageInfo;
import com.tjc.domain.Pager;
import com.tjc.domain.ReviewVO;
import com.tjc.domain.ReviewimgVO;
import com.tjc.service.ReviewService;
import com.tjc.service.ReviewimgService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin/*")
@RequiredArgsConstructor
public class AdminController {

	private final ReviewService reviewService; // 리뷰 처리
	private final ReviewimgService reviewimgService; // 리뷰 이미지 처리
	
	@GetMapping("mainm")
	public String mainm() {
		return "admin/mainm";
	}
	
	// 리뷰 리스트 목록 요청
		@GetMapping("reviewm/reviewlist")
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
			// imgList        List[ List[ReviewImgVO, ReviewImgVO] ,List[ReviewImgVO] ,       List [ReviewImgVO] ,......... ]
			// 리뷰들의 이미지들         1번리뷰 이미지 묶음            		2번리뷰의 이미지묶음     			 3번리뷰의 이미지 묶음 
			
			// 페이징 처리를 위한 정보 계산하여 전달
			int total = reviewService.getReviewCount(pageInfo);
			Pager pager = new Pager(pageInfo, total);
			model.addAttribute("pager", pager);

			return "admin/reviewm/reviewlist";
		}
		
		// 리뷰 본문 페이지 
		@GetMapping("reviewm/admincontent")
		public String content(Model model, Long reviewnum, @ModelAttribute("pageInfo") PageInfo pageInfo) {
		    ReviewVO review = reviewService.getReview(reviewnum);
		    model.addAttribute("review", review);

		    List<ReviewimgVO> imgList = reviewimgService.getReviewImg(review.getReviewnum());
		    model.addAttribute("imgList", imgList);
		    
		    return "admin/reviewm/admincontent";
		}

		// 리뷰 삭제 
		@PostMapping("delete")
		public String delete(Long reviewnum, PageInfo pageInfo) {
			//리뷰 삭제
			reviewService.deleteReview(reviewnum);
			// 사진도 삭제 todo
			 reviewimgService.deleteReviewImages(reviewnum);
			
			return "redirect:/admin/reviewm/reviewlist" + pageInfo.getParameterToQueryString();
		}

	
}
