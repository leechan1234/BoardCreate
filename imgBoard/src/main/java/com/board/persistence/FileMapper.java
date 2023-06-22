package com.board.persistence;

import java.util.List;

import com.board.domain.ImgFileVO;

public interface FileMapper {

	// 파일 정보 저장 
	public int insertFile(ImgFileVO vo);
	
	// 본문글 하나에 해당하는 이미지들 리턴 
	public List<ImgFileVO> getBoardImgs(Long bno);
	
	
	
	
}
