package com.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.domain.BoardVO;
import com.board.domain.Pager;
import com.board.persistence.BoardMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
//final or @NonNull 붙은 변수를 매개변수로하는 생성자 자동생성
@RequiredArgsConstructor 
@Slf4j
public class BoardServiceImpl implements BoardService {
	
	// 생성자로 주입받기 
	private final BoardMapper boardMapper; 

	@Override
	public void addArticle(BoardVO board) {
		log.info("addArticle result : {}", boardMapper.insert(board));
	}

	// TODO : 글 내용과 이미지도 같이 가져와야함 (수정필요)
	@Override
	public BoardVO get(Long bno) {
		return boardMapper.getArticle(bno);
	}

	// TODO : 이미지 수정시 이미지까지 수정해야함 (수정필요)
	@Override
	public boolean modify(BoardVO board) {
		return boardMapper.update(board) == 1;
	}

	// TODO : 본문글 수정시, 댓글도 같이 삭제, 이미지도 삭제 (추가 필요)
	@Override
	public boolean remove(Long bno) {
		return boardMapper.delete(bno) == 1;
	}

	@Override
	public List<BoardVO> getList(Pager pager) {
		return boardMapper.getListWithPaging(pager);
	}

	@Override
	public int getTotal(Pager pager) {
		return boardMapper.getArticleCount(pager);
	}
	
}
