package com.member.persistence;

import com.member.domain.MemberVO;

public interface MemberMapper {

	// 회원 저장 
	public int insertMember(MemberVO member);
	// 로그인 처리  
	public int idPwCheck(MemberVO member);
	// 회원 정보 가져오기 (PK id값)
	public MemberVO getMember(String id);
	// 회원 수정 
	public int updateMember(MemberVO member);
	// 회원 삭제 
	public int deleteMember(String id);
	
	
}
