package com.board.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.board.domain.Pager;
import com.board.domain.ReplyPageDTO;
import com.board.domain.ReplyVO;
import com.board.service.ReplyService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

// 댓글 컨트롤러 
@RestController
@RequestMapping("/replies/*")
@RequiredArgsConstructor
@Slf4j
public class ReplyController {

	private final ReplyService replyService;
	
	@PostMapping(value="new", consumes = "application/json",
			produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> register(@RequestBody ReplyVO reply) {
		
		log.info("new reply : {}", reply);

		// 테스트용으로 bno는 DB에 존재하는 값으로 고정해서 테스트해보자
		// postman에서 bno 넣어 처리 
		int result = -1;
		// 새글등록 : ReplyVO reply의 rno == null 
		if(reply.getRno() == null) {
			reply.setRstep(0);
			reply.setRlevel(0);
			result = replyService.insert(reply);
			log.info("new reply result : {}", result);
		}else {
		// 댓글의 답글 : ReplyVO reply의 rno != null
			result = replyService.addReply(reply);
			log.info("add reply result : {}", result);
		}
		
		return result == 1 ? 
				new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 댓글 목록 요청 + 페이징처리 
	// bno : 본문글 번호 
	// page : 댓글의 페이지 번호
	@GetMapping(value="list/{bno}/{page}", 
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<ReplyPageDTO> getList(
			@PathVariable("bno") Long bno,
			@PathVariable("page") int page) {
		
		log.info("getList bno : {}", bno);
		log.info("getList page : {}", page);
		
		Pager pager = new Pager(page, 10);
		log.info("getList pager : {}", pager);
		
		return new ResponseEntity<>(replyService.getListWithPaging(bno, pager), 
				HttpStatus.OK);
	}
	
	// 댓글 삭제 
	@DeleteMapping(value="{rno}")
	public ResponseEntity<String> delete(@PathVariable("rno")Long rno) {
		
		log.info("delete reply rno : {} ", rno);
		
		return replyService.delete(rno) == 1 ?
				new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); 
	}
	
	// 댓글 한개 조회 
	@GetMapping(value="{rno}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<ReplyVO> get(@PathVariable("rno")Long rno) {
		
		log.info("get one reply rno : {} ", rno);
		
		return new ResponseEntity<>(replyService.get(rno), HttpStatus.OK);
	}
	
	
	
	
	
	
	
}
