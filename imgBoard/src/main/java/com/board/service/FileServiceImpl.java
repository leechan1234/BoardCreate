package com.board.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.board.domain.ImgFileVO;
import com.board.persistence.FileMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class FileServiceImpl implements FileService{
	
	private final FileMapper fileMapper; 
	
	
	// 이미지 파일 정보 DB에 저장 처리 로직 
	@Override
	public void addFiles(Long bno, MultipartFile[] uploadFile, String path) {
		// 실제이미지파일 -> /resources/upload 폴더에 저장 
		// DV에 이미지 파일 정보 저장 
		saveFiles(bno, uploadFile, path);
		
		
	}//addFiles

	private void saveFiles(Long bno, MultipartFile[] uploadFile, String path) {
		for(MultipartFile mf : uploadFile) {
			
			log.info("mf isEmpty() : {}", mf.isEmpty());
			log.info("mf getSize() : {}", mf.getSize());
			
			// 파일이 있으면(비어있지않으면) 저장처리해라~ 
			if(!mf.isEmpty()) {
			
				// * 파일의 형식(타입) 꺼내기  *  
				String contentType = mf.getContentType();
				log.info("contentType : {}", contentType);
				
				// * 파일 저장할 이름 준비 *
				// UUID 이름 
				UUID uuid = UUID.randomUUID();   
				String uploadFilename = uuid.toString();  
				// 확장자명 추출해 연결
				String orgFilename = mf.getOriginalFilename();
				String ext = orgFilename.substring(orgFilename.lastIndexOf("."));
				uploadFilename += ext;
				log.info("orgFilename : {}", orgFilename);
				log.info("ext : {}", ext);
				log.info("uploadFilename : {}", uploadFilename); // 이름준비완료
	
				// * DB에 파일 정보 저장할 VO 생성 *
				ImgFileVO fileVO = new ImgFileVO(); 
				fileVO.setBno(bno);
				fileVO.setFilename(uploadFilename);
				fileVO.setOrgfilename(orgFilename);
				fileVO.setFiletype(contentType);
				
				// * 파일 자체를 저장시킬 File 객체 준비 
				File saveFile = new File(path, uploadFilename);
				try {
					mf.transferTo(saveFile); // 실제 파일 저장!! 
					
					// 파일 정보 DB에 저장 
					int result = fileMapper.insertFile(fileVO);
					log.info("insertFile result : {}", result);
					log.info("insertFile fileVO : {}", fileVO);
					
				}catch(IOException e) {
					e.printStackTrace();
				}
			}// if !isEmpty()
			
		}//for
	}
	

	@Override
	public List<ImgFileVO> getBoardImgs(Long bno) {
		
		List<ImgFileVO> result = fileMapper.getBoardImgs(bno);
		log.info("fileMapper getImgs result : {}", result);
		
		return result;
	}//getBoardImgs


	@Override
	public void modify(Long bno, MultipartFile[] uploadFile, Long[] removeFiles) {
		HttpServletRequest request = 
				((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes())
				.getRequest();
		String path = request.getRealPath("/resources/upload");
		log.info("modify path : {}", path);
		// uploadFile 저장처리 
		saveFiles(bno, uploadFile, path); // 파일 추가로 데이터가 넘어왔는지 검사처리 완료 
		
		// removeFiles 삭제 처리 
		if(removeFiles != null) { // null 체크 필요(NullPointerException방지)
			for(int i = 0; i < removeFiles.length; i++) {
				// 저장된 폴더경로(path), 삭제할 파일이름(DB)
				File rf = new File(path, fileMapper.getOneFile(removeFiles[i]).getFilename());
				rf.delete();  // 실제 파일 삭제 
				fileMapper.deleteOne(removeFiles[i]); // DB 파일 정보 삭제 
			}
		}
		
	}

	
	
	
	
	
	
	
	
	
}//class
