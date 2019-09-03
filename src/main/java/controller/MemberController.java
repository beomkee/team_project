package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.MemberDataBean;
import service.MemberService;

@Controller
@RequestMapping("/member/")          
public class MemberController {

	ModelAndView mv  = new ModelAndView();
	
	
	
	@Autowired
	public MemberService memberservice;
	
	
	@RequestMapping("login")        					 /* �α��� */
	public ModelAndView login() {
		mv.clear();
		mv.setViewName("user/user_login");
		return mv;
	}
	
	@RequestMapping("memJoin")       					 /* ȸ������ */
	public ModelAndView memJoin(MemberDataBean member) {
		mv.clear(); 
		
//		String id = member.getM_id();
//		String passwd = member.getM_pw();
		
		
		System.out.println(id);
		mv.setViewName("user/user_join");
		return mv;
	}
	
	@RequestMapping("memInformation") 					/* ȸ�������� */
	public ModelAndView memInformation() {
		mv.clear();
		mv.setViewName("user/user_meminformation");
		return mv;
	}
	
	
}
