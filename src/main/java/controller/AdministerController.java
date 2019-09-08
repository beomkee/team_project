package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.NoticeDataBean;
import model.SurveyBoardAboutDataBean;
import model.TopMenuDataBean;
import service.AdministrationDBBeanMybatis;

@Controller
@RequestMapping("/administer/")
public class AdministerController {

	ModelAndView mv = new ModelAndView();

	@Autowired
	AdministrationDBBeanMybatis administrationDBBeanMybatis;

	@ModelAttribute
	public void setAttr(HttpServletRequest request) {
		HttpSession session = request.getSession();
		int e_num = 1111;
	}

	@RequestMapping("popup")
	public ModelAndView popup() {
		mv.clear();
		mv.setViewName("../admin_view/popUpManagement/popup");
		return mv;
	}

	// 공지
	@RequestMapping("notice")
	public ModelAndView noticeList() throws Exception {
		mv.clear();
		List<NoticeDataBean> noticeList = null;
		noticeList = administrationDBBeanMybatis.getNoticeList();
		mv.addObject("noticeList", noticeList);
		mv.setViewName("../admin_view/noticeManagement/noticeAdmin");
		return mv;
	}

	// 공지 작성 / 수정
	@RequestMapping("WriteNotice")
	public String writeNotice(NoticeDataBean notice, int nb_num) {
		mv.clear();
		if (nb_num == 0) {
			// 조회
			int bringNb_num = administrationDBBeanMybatis.getNoticeNum();
			if (bringNb_num != 0) {
				bringNb_num = bringNb_num + 1;
			} else {
				bringNb_num = 1;
			}

			// 셋팅
			notice.setNb_num(bringNb_num);
			// e_num 바꿀 부분
			notice.setE_num(1111);

			System.out.println(notice.toString());
			// 작성 실행
			administrationDBBeanMybatis.insertNotice(notice);
		} else {

			// e_num 바꿀 부분
			notice.setE_num(2222);
			administrationDBBeanMybatis.updateNotice(notice);
		}

		return "redirect:notice";
	}

	// 공지 삭제
	@RequestMapping("DeleteNotice")
	public String deleteNotice(int nb_num) {
		mv.clear();
		// 삭제 실행
		administrationDBBeanMybatis.deleteNotice(nb_num);

		int count = administrationDBBeanMybatis.getNoticeSelectCount(nb_num);
		if (count != 0) {
			for (int i = 1; i <= count; i++) {
				administrationDBBeanMybatis.updateNoticeNum(nb_num + i);
			}
		}
		return "redirect:notice";
	}

	// 글번호, 제목, 내용 가져오기
	@RequestMapping(value = "bringInfo", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> bringAbout(int nb_num) {
		/* int nb_num = Integer.parseInt(request.getParameter("nb_num")); */
		List<NoticeDataBean> noticeBringInfo = null;

		noticeBringInfo = administrationDBBeanMybatis.getNoticeInfo(nb_num);
		Map<String, Object> aboutmap = new HashMap<String, Object>();

		aboutmap.put("getNb_num", noticeBringInfo.get(0).getNb_num());
		aboutmap.put("getNb_title", noticeBringInfo.get(0).getNb_title());
		aboutmap.put("getNb_content", noticeBringInfo.get(0).getNb_content());
		return aboutmap;
	}

	// 메뉴
	@RequestMapping("menu")
	public ModelAndView menu() {
		mv.clear();
		List<TopMenuDataBean> topMenuList = null;
		topMenuList = administrationDBBeanMybatis.getTopMenuList();
		mv.addObject("topMenuList", topMenuList);
		mv.setViewName("../admin_view/menuManagement/menuAdmin");
		return mv;
	}

	// 메뉴 작성 및 수정
	@RequestMapping("writeMenu")
	public String writeMenu(TopMenuDataBean topMenu, int tm_num, String tm_parentYN) {
		mv.clear();
		System.out.println(topMenu.toString());
		System.out.println(tm_num);
		if (tm_num == 0) {
			// 조회
			int bringTm_num = administrationDBBeanMybatis.getTopMenuCount();
			if (bringTm_num != 0) {
				bringTm_num = bringTm_num + 1;
			} else {
				bringTm_num = 1;
			}

			// 셋팅
			topMenu.setTm_num(bringTm_num);

			// e_num 바꿀 부분
			topMenu.setE_num(1111);

			System.out.println(topMenu.toString());
			// 작성 실행
			administrationDBBeanMybatis.insertTopMenu(topMenu, tm_parentYN);
		} else {
			// e_num 바꿀 부분
			topMenu.setE_num(2222);

			administrationDBBeanMybatis.updateTopMenu(topMenu, tm_parentYN);
		}

		return "redirect:menu";
	}

	// 글번호, 제목, 내용 가져오기
	@RequestMapping(value = "getMenu", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getMenu(int tm_num) {

		List<TopMenuDataBean> menuBringInfo = null;
		menuBringInfo = administrationDBBeanMybatis.getMenuInfo(tm_num);
		Map<String, Object> aboutmap = new HashMap<String, Object>();

		aboutmap.put("getTm_num", menuBringInfo.get(0).getTm_num());
		aboutmap.put("getTm_text", menuBringInfo.get(0).getTm_text());
		aboutmap.put("getTm_div", menuBringInfo.get(0).getTm_div());
		aboutmap.put("getTm_url", menuBringInfo.get(0).getTm_url());
		aboutmap.put("getTm_use", menuBringInfo.get(0).getTm_use());
		aboutmap.put("getTm_parent", menuBringInfo.get(0).getTm_parent());
		
		System.out.println(aboutmap.toString());
		
		return aboutmap;
	}


	// 메뉴 삭제
	@RequestMapping("deleteMenu")
	public String deleteMenu(int tm_num) {
		mv.clear();

		// 삭제 실행
		administrationDBBeanMybatis.deleteMenu(tm_num);

		return "redirect:menu";
	}

}
