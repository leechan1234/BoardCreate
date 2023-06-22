package com.board.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.board.domain.ImgFileVO;

// 이미지 파일용 로직처리 
public interface FileService {

	// 이미지 파일 저장 처리 
	public void addFiles(Long bno, MultipartFile[] uploadFile, String path);
	
	// 본문글 하나에 해당하는 이미지들 가져오기 
	public List<ImgFileVO> getBoardImgs(Long bno);
	
	
	
	
}
