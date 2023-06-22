package com.board.controller;

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
	
	
	
	
	
	
	
	
}
