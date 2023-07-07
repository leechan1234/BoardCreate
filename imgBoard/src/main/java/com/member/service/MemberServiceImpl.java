package com.member.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.member.domain.MemberVO;
import com.member.persistence.MemberMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

	private final MemberMapper memberMapper;
	
	// 회원 가입 
	@Override
	public int addMember(MemberVO member) {
		return memberMapper.insertMember(member);
	}

	// 로그인
	// TODO : 메인에서 쿠키로 로그인 하는것 추가 필요
	@Override
	public int login(MemberVO member, String auto) {
		
		// DB에 가서 id,pw 일치하는지 확인 (일치 = 1, 불일치 = 0)
		int result = memberMapper.idPwCheck(member);
		
		HttpSession session = getSession();
		HttpServletResponse response = getResponse();
		
		if(result == 1) { 
			session.setAttribute("sid", member.getId());
			if(auto != null) {
				Cookie c1 = new Cookie("cookieId", member.getId());
				Cookie c2 = new Cookie("cookiePw", member.getPw());
				Cookie c3 = new Cookie("cookieAuto", auto);
				c1.setMaxAge(60*60*24); // 24시간 
				c2.setMaxAge(60*60*24); 
				c3.setMaxAge(60*60*24); 
				c1.setPath("/"); // 경로지정 
				c2.setPath("/");
				c3.setPath("/");
				response.addCookie(c1);
				response.addCookie(c2);
				response.addCookie(c3);
			}
		}
		return result; // id,pw 체크한 결과 리턴 
	}

	// 로그아웃 
	@Override
	public void logout() {
		// 세션 속성 모두 삭제 (sid포함) 
		getSession().invalidate();
		
		// 쿠키 삭제 
		Cookie[] coos = getRequest().getCookies();
		HttpServletResponse response = getResponse();
		if(coos != null) {
			for(Cookie c : coos) {
				if(c.getName().equals("cookieId") 
						|| c.getName().equals("cookiePw") 
						|| c.getName().equals("cookieAuto")) {

					c.setPath("/"); 
					c.setMaxAge(0);
					response.addCookie(c);
				}
			}
		}
		
	}

	// 회원 정보 가져오기 
	@Override
	public MemberVO getMember() {
		return memberMapper.getMember((String)getSession().getAttribute("sid"));
	}

	// 회원 정보 수정 
	@Override
	public int modifyMember(MemberVO member) {
		// 비밀번호 확인후 
		int result = memberMapper.idPwCheck(member);
		if(result == 1) {
			// 수정 
			memberMapper.updateMember(member);
		}
		return result; // 비번확인결과 리턴 
	}

	// 회원 탈퇴 처리 
	@Override
	public int deleteMember(MemberVO member) {
		
		member.setId((String)getSession().getAttribute("sid"));
		int result = memberMapper.idPwCheck(member);
		if(result == 1) {
			memberMapper.deleteMember(member.getId());
			logout();// 로그아웃
		}
		return result;
	}

	
	// 서비스 클래스 안에서 내부적으로 사용할 메서드 
	// request 객체 리턴 
	private HttpServletRequest getRequest() {
		ServletRequestAttributes sra = 
				(ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		return sra.getRequest();
	}
	
	// session 리턴 
	private HttpSession getSession() {
		return getRequest().getSession();
	}
	
	// response 객체 리턴 
	private HttpServletResponse getResponse() {
		ServletRequestAttributes sra = 
				(ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		return sra.getResponse();
	}
	
	
}
