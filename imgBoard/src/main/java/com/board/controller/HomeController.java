package com.board.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.member.domain.MemberVO;
import com.member.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;



/**
 * Handles requests for the application home page.
 */
@Controller
@RequiredArgsConstructor
@Slf4j
public class HomeController {
   
	private final MemberService memebrService;
 
   @RequestMapping(value = "/", method = RequestMethod.GET)
   public String home() {
    
      
      return "redirect:/main";
   }
   
   //Controller에서는 Cookie 꺼낼떄 @CookieValue 어노테이션 이용 가능
   @RequestMapping("/main")
   public String main(@CookieValue(name="coookieAuto",required = false) String cookieId,
		   @CookieValue(name="coookieAuto",required = false) String cookiePw,
		   @CookieValue(name="coookieAuto",required = false) String cookieAuto) {
	   log.info("cookieAuto : {} " , cookieId);
	   log.info("cookieAuto : {} " , cookiePw);
	   log.info("cookieAuto : {} " , cookieAuto);
	   
	   if(cookieAuto != null && cookiePw != null && cookieAuto != null) {
		   MemberVO member = new MemberVO();
		   member.setId(cookieId);
		   member.setId(cookiePw);
		   memebrService.login(null, cookieAuto);
	   }
	   
	   return "main";
   }
   
}