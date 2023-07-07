package com.member.controller;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.member.domain.MemberVO;
import com.member.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member/*")
@RequiredArgsConstructor
@Slf4j
public class MemberController {

	// 생성자 자동 주입 
	private final MemberService memberService; // @RequiredArgsConstructor 추가 
	
	// 회원 가입 
	@GetMapping("signup")
	public String signup() {
		return "member/signup";
	}
	@PostMapping("signup")
	public String signupPro(@ModelAttribute("member") MemberVO member, Model model) {
		log.info("************ signupPro member : {}", member);
		
		int result = memberService.addMember(member);
		model.addAttribute("result", result);
		
		return "member/signupPro";
	}
	
	// 로그인 
	@GetMapping("login")
	public String login() {
		return "member/login";
	}
	@PostMapping("login")
	public String loginPro(MemberVO member, String auto, RedirectAttributes rttr) {
		log.info("************ loginPro member : {}", member);
		log.info("************ loginPro auto : {}", auto);
		
		int result = memberService.login(member, auto);
		HashMap<String, String> map = new HashMap<>();
		map.put("type", "login");
		map.put("result", result + "");
		rttr.addFlashAttribute("resultMap", map);
		
		return "redirect:/main";
	}
	
	// 로그아웃 
	@GetMapping("logout")
	public String logout() {
		
		memberService.logout();
		
		return "redirect:/main";
	}
	
	// 마이페이지, 회원정보 수정 폼 : url요청경로가 jsp 경로 
	@GetMapping({"mypage", "modify"})
	public void mypage(Model model) {
		model.addAttribute("member", memberService.getMember());
	}
	
	/*
	 RedirectAttributes : Model과 더불어 스프링 MVC가 자동으로
	 	데이터를 전달해주는 타입중 하나임. 
	 	일회성으로 데이터를 전달하는 용도로 사용가능. 
	 	[ex]
	 	response.sendRedirect("/test?a=111&b=222");
	 	vs
	 	rttr.addAttribute("a", 111); 
	 	rttr.addAttribute("b", 222); 
	 	return "redirect:/test"
	 	
	 	메서드 
	 		.addAttribute("이름", 값);   
	 			: 전달하는 값은 url뒤 붙고, 리프레쉬해도 데이터 유지 
	 		.addFlashAttribute("이름", 값); 
	 			: 전달하는 값은 url뒤에 안붙고, 일회성이라 리프레쉬하면 데이터 소멸.
	 			  한개만 전달가능. 여러데이터를 보내주고 싶으면 Map타입을 이용해서 
	 			  한번에 전달해주어야함 
	*/
	@PostMapping("modify")
	public String modifyPro(MemberVO member, RedirectAttributes rttr) {
		log.info("************ modifyPro member : {}", member);
		
		int result = memberService.modifyMember(member);
		rttr.addFlashAttribute("result", result); // 단발성으로 사용하는 데이터 전송 
		
		return "redirect:/member/mypage";
	}
	
	// 회원 탈퇴 
	@GetMapping("delete")
	public String delete() {
		return "member/delete";
	}
	@PostMapping("delete")
	public String deletePro(MemberVO member, RedirectAttributes rttr) {
		log.info("************ deletePro member : {}", member);
		
		int result = memberService.deleteMember(member);
		HashMap<String, String> map = new HashMap<>();
		map.put("type", "delete");
		map.put("result", result + "");
		rttr.addFlashAttribute("resultMap", map);
		
		return "redirect:/main";
	}
	
	
	
	
	
	
}
