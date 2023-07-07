package com.board.controller;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.board.domain.BoardVO;
import com.board.domain.PageDTO;
import com.board.domain.Pager;
import com.board.service.BoardService;
import com.board.service.FileService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/board/")
@RequiredArgsConstructor
@Slf4j
public class BoardController {
	
	private final BoardService boardService; 
	private final FileService fileService; 

	// 게시판 글 작성 폼 요청 
	@GetMapping("write")
	public String writeForm() {
		return "board/write";
	}
	
	@PostMapping("write")
	public String writePro(BoardVO board, MultipartFile[] uploadFile, HttpServletRequest request) {
		log.info("writePro board BEFORE Service : {}", board);
		
		// 게시글 텍스트 저장 
		boardService.addArticle(board);
		log.info("writePro board AFTER Service : {}", board);
		
		// 첨부 이미지파일과 정보 저장 (bno필요)
		String path = request.getRealPath("/resources/upload");
		log.info("path : {}", path);
		fileService.addFiles(board.getBno(), uploadFile, path); 
		
		return "redirect:/board/list";
	}
	
	@GetMapping("list")
	public String list(Pager pager, Model model) {
		
		model.addAttribute("list", boardService.getList(pager)); // 글목록 가져와 뷰에전달
		int total = boardService.getTotal(pager); // 글 개수 가져오기 
		model.addAttribute("pageDTO", new PageDTO(pager, total)); // 페이징처리요소 뷰에전달
		
		return "board/list";
	}
	
	@GetMapping("content")
	public String content(Long bno, @ModelAttribute("pager") Pager pager, Model model) {
		
		// 글 한개 뷰로 보내기 
		model.addAttribute("board", boardService.get(bno));
		// 이미지도 보내기 (List<ImgFileVO>) 
		model.addAttribute("imgList", fileService.getBoardImgs(bno));
		
		return "board/content";
	}
	
//	// 댓글 로직 테스트 
//	@GetMapping("replyTest")
//	public String replyTest() {
//		
//		
//		return "board/replytest";
//	}
	
	//글 삭제
	@PostMapping("delete")
	public String delete(Long bno, Pager pager) {
		
		boardService.remove(bno);
		
		//보던 리스트로 돌아가기
		return "redirect:/board/list" + pager.getParameterQuery();
	}
	
	//글 수정
	@GetMapping("modify")
	public String modifyForm(Model model, Long bno, @ModelAttribute("pager")Pager pager) {
		
		/// 글 한개 수정
		model.addAttribute("board" , boardService.get(bno));
		model.addAttribute("imgList" , fileService.getBoardImgs(bno));
		return "board/modify";
	}
	
	// removeFiles : 기존 이미지 삭제 체크박스 선택한 값들 담아주는 변수(fno)
	@PostMapping("modify")
	public String modifyPro(Pager pager, BoardVO board, Long[] removeFiles, MultipartFile[] uploadFile) {
		
		log.info("modifyPro board : {}" , board);
		log.info("modifyPro removeFiles : {}" , Arrays.toString(removeFiles));
		log.info("modifyPro uploadFile : {}" , Arrays.toString(uploadFile));
		// Arrays.toString(배열) : 배열안의 데이터를 출력형태로 리턴
		
		//수정처리
		
		return "readirect:/board/content" + pager.getParameterQuery() + "&bno=" +  board.getBno();
	}
	
	
	
	
}
