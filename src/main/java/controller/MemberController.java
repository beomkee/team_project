package controller; /*�帧����*/

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.MemberDataBean;
import service.MemberService;

@Controller  //���� Ŭ������ ���������� �����ϴ� ��Ʈ�ѷ� bean���� ����
@RequestMapping("/member/")  //��� ������ /member/�� ���
public class MemberController { 
	//�α��� ���� ����
	ModelAndView mv = new ModelAndView();

	@Autowired
	public MemberService memberservice;

	@RequestMapping("login") /* 01. �α��� ȭ�� */
	public ModelAndView login() throws Exception {
		mv.clear();
		mv.setViewName("user/user_login");
		return mv;
	}

	@RequestMapping("loginPro") // jsp���� name���� ���� -> loginPro(String m_id, String m_pw, HttpServletRequest req)
	public ModelAndView loginPro(String m_id, String m_pw, HttpServletRequest req) throws Exception {
		System.out.println("===========================================================");
		System.out.println(m_id + ":" + m_pw);
		MemberDataBean member = memberservice.user_login(m_id, m_pw);
		req.getSession().setAttribute("member", member);
		System.out.println("toString��" + member);
		ModelAndView model = new ModelAndView();
		
		if(member == null) {
			model.setViewName("redirect:/member/login");
			model.addObject("loginNotOk","1");
		}else {
			model.setViewName("redirect:/main");
		}
		return model;
	}

	@RequestMapping("logout") /* 03. �α׾ƿ� ó�� */
	public String logout(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		return "redirect:/main";
	}

	@RequestMapping("memJoin") /* ȸ������ */
	public ModelAndView memJoin(MemberDataBean member) {
		mv.clear();

//		String id = member.getM_id();
//		String passwd = member.getM_pw();

		mv.setViewName("user/user_join");
		return mv;
	}

	@RequestMapping("memJoin2") /* ȸ������ */
	public ModelAndView memJoin2(MemberDataBean member, String wRoadAdderess, String wRestAddress, String wPostCode)
			throws Exception {
		mv.clear();

		member.setM_add(wPostCode + " " + wRoadAdderess + " " + wRestAddress);
		member.setE_num("1");

		// ���񽺸� ���� ���� ū ȸ�� ��ȣ�� ��������;�

		// ���񽺸� ���ؼ� ����ū ȸ����ȣ�� ã�ƿ� =>>> 1 �̰� String maxMemNum �� �����ž� �׷��㿡
		// 2 member.setM_num(maxMemNum)���� ���� �����ž� �׷� ��� �ؾ��ұ��?

		int maxMemNum = memberservice.getMaxNum();

		member.setM_num(String.valueOf(maxMemNum + 1));

		memberservice.insertMember(member);

		mv.setViewName("user/user_login");
		return mv;
	}

	@RequestMapping("memInformation") /* ȸ�������� */
	public ModelAndView memInformation() {
		mv.clear();
		mv.setViewName("user/user_meminformation");
		return mv;
	}
	
}
