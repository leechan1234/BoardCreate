package com.board.service;

import org.springframework.stereotype.Service;

import com.board.domain.Pager;
import com.board.domain.ReplyPageDTO;
import com.board.domain.ReplyVO;
import com.board.persistence.ReplyMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

// 댓글 서비스 구현 클래스 

@Service
@RequiredArgsConstructor
@Slf4j
public class ReplyServiceImpl implements ReplyService {

	// 생성자로 주입받기 
	private final ReplyMapper replyMapper;

	// 신규 댓글 저장 
	@Override
	public int insert(ReplyVO reply) {
		log.info("insert reply vo : {}", reply);
		return replyMapper.insert(reply);
	}

	// 댓글에 답글달기 
	@Override
	public int addReply(ReplyVO reply) {
		log.info("addReply reply : {}", reply);
		// 기존에추가된 댓글의답글들이 있으면, 
		// 그 답글들의 rstep을 하나씩 올려주기 
		replyMapper.upadateStep(reply);
		
		// 답글 저장 : step과 level은 넘어온값 + 1 로 수정해서 insert
		// 넘어온 step,level(답글다는 대상의 step,level값) 
		// -> 이거보다 밑에 달려야하니
		// 넘어온 값에 +1 해서 저장하다 
		reply.setRstep(reply.getRstep() + 1);
		reply.setRlevel(reply.getRlevel() + 1);
		return replyMapper.addReReply(reply);		
	}

	@Override
	public ReplyVO get(Long rno) {
		return replyMapper.read(rno);
	}

	@Override
	public int delete(Long rno) {
		log.info("delete reply rno : {}", rno);
		return replyMapper.delete(rno);
	}

	@Override
	public int deleteReplies(Long bno) {
		log.info("delete replies bno : {}", bno);
		return replyMapper.deleteReplies(bno);
	}

	// 댓글 페이징 DTO로 리턴해주는 댓글 목록 조회 
	@Override
	public ReplyPageDTO getListWithPaging(Long bno, Pager pager) {
		log.info("getListWithPaging bno : {}", bno);
		log.info("getListWithPaging pager : {}", pager);
		// 생성자 매개변수1 : bno에 해당하는 전체 댓글 개수 구한 값 
		// 생성자 매개변수2 : bno,page 참고하여 댓글 목록 리스트 
		return new ReplyPageDTO(replyMapper.getReplyCount(bno), 
				replyMapper.getListWithPaging(bno, pager));
	}

	
}
