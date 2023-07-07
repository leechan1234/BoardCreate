package com.board.service;

import java.io.File;
import java.util.List;

import javax.servlet.ServletRegistration;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.board.domain.BoardVO;
import com.board.domain.ImgFileVO;
import com.board.domain.Pager;
import com.board.persistence.BoardMapper;
import com.board.persistence.FileMapper;
import com.board.persistence.ReplyMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
//final or @NonNull 붙은 변수를 매개변수로하는 생성자 자동생성
@RequiredArgsConstructor 
@Slf4j
public class BoardServiceImpl implements BoardService {
	
	// 생성자로 주입받기 
	private final BoardMapper boardMapper; 
	private final ReplyMapper replyMapper; // 댓글 삭제
	private final FileMapper fileMapper;
	
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
		//댓글 삭제
		replyMapper.deleteReplies(bno);
		//이미지 파일과 이미지 DB 정보 삭제
		//실제 파일 정보 가져오기
		List<ImgFileVO>files = fileMapper.getBoardImgs(bno);
		//실제 파일 삭제(upload폴더에 저장된 파일명 필요)
		ServletRequestAttributes sra = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		HttpServletRequest request = sra.getRequest();
		//실제 업로드되는 파일의 경로(폴더)
		String path = request.getRealPath("/resources/upload");
		log.info("path : {}", path);
		//파일삭제
		for (ImgFileVO f : files) {
			File file = new File(path, f.getFilename());
			file.delete(); // 실제파일삭제
		}
		
		//imgfile DB 테이블의 파일 정보 삭제
		fileMapper.deleteFiles(bno);
		
		//본문 게시글 삭제
		
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
