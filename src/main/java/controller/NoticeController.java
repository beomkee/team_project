package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.NoticeDataBean;
import service.NoticeDBBeanMybatis;

@Controller
@RequestMapping("/notice/")
public class NoticeController {
	ModelAndView mv= new ModelAndView();
	int pageNum;
	@Autowired
	NoticeDBBeanMybatis noticeDBBeanMybatis;
	
	@ModelAttribute
	public void setAttr(HttpServletRequest request) {
		HttpSession session = request.getSession();

		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch (Exception e) {
			pageNum = 1;
		}
	}
	
	@RequestMapping("notice")
	public ModelAndView noticeList() throws Exception {
		mv.clear();
		int pageSize = 6;
		int currentPage = pageNum;

		int count = noticeDBBeanMybatis.getContentCount();
		int startRow = (currentPage - 1) * pageSize;
		int endRow = currentPage * pageSize;
		if (count < endRow)
			endRow = count;
		List<NoticeDataBean> noticeList = null;
		
		noticeList = noticeDBBeanMybatis.getNoticeList(startRow + 1, endRow);
		
		int number = count - ((currentPage - 1) * pageSize);
		int bottomLine = 3;
		// 5 page
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		
		mv.addObject("count", count);
		mv.addObject("pageNum", pageNum);
		mv.addObject("noticeList", noticeList);
		mv.addObject("number", number);
		mv.addObject("startPage", startPage);
		mv.addObject("bottomLine", bottomLine);
		mv.addObject("endPage", endPage);
		mv.addObject("pageCount", pageCount);
		mv.setViewName("notice/noticeBoard");
		return mv;
	}
	
	@RequestMapping("noticeContent")
	public ModelAndView noticeContent(int nb_num) throws Exception {
		mv.clear();
		NoticeDataBean noticeBoardContent = noticeDBBeanMybatis.getNoticeContent(nb_num);
		String e_id = noticeDBBeanMybatis.getEmpId(nb_num);
		
		
		mv.addObject("noticeBoardContent", noticeBoardContent);
		mv.addObject("e_id", e_id);
		System.out.println(e_id);
		mv.addObject("pageNum", pageNum);
		mv.setViewName("notice/noticeContent");
		return mv;
	}
}
