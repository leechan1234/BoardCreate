package com.member.service;

import com.member.domain.MemberVO;

public interface MemberService {

	// 회원 추가 
	public int addMember(MemberVO member);
	// 로그인 
	public int login(MemberVO member, String auto);
	// 로그아웃 
	public void logout();
	// 회원 정보 가져오기 
	public MemberVO getMember();
	// 회원 정보 수정 
	public int modifyMember(MemberVO member);
	// 회원 탈퇴 
	public int deleteMember(MemberVO member);
	
}
