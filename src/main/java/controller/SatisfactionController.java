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

import model.SurveyBoardAboutDataBean;
import model.SurveyBoardAnswerDataBean;
import model.SurveyBoardDataBean;
import model.SurveyBoardQuestionDataBean;
import model.SurveyBoardWriteDataBean;
import model.SurveyContentResultDataBean;
import model.SurveyResultDataBean;
import service.SurveyBoardDBBeanMybatis;

@Controller
@RequestMapping("/satisfaction/")
public class SatisfactionController {
	ModelAndView mv = new ModelAndView();
	int pageNum;
	@Autowired
	public SurveyBoardDBBeanMybatis surveyBoardDBBeanMybatis;

	@ModelAttribute
	public void setAttr(HttpServletRequest request) {
		HttpSession session = request.getSession();

		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch (Exception e) {
			pageNum = 1;
		}
	}

	// 질문, 선택지 가져오기
	@RequestMapping("survey")
	public ModelAndView surveyUploadForm() throws Exception {
		mv.clear();

		List<SurveyBoardQuestionDataBean> surveyQuestionList = null;
		List<SurveyBoardAnswerDataBean> surveyAnswerList = null;

		if (surveyBoardDBBeanMybatis.mybatisConnector.getDbname().equals("Oracle")) {
			surveyQuestionList = surveyBoardDBBeanMybatis.getQuestionList();
			surveyAnswerList = surveyBoardDBBeanMybatis.getAnswerList();
		} else {
			surveyQuestionList = surveyBoardDBBeanMybatis.getQuestionList();
			surveyAnswerList = surveyBoardDBBeanMybatis.getAnswerList();
		}
		mv.addObject("surveyQuestionList", surveyQuestionList);
		mv.addObject("surveyAnswerList", surveyAnswerList);
		mv.setViewName("satisfaction/satisfactionForm");
		return mv;
	}

	// 유효성 검사
	@RequestMapping(value = "pNumCheck", method = RequestMethod.GET)
	@ResponseBody
	public String pNumCheck(HttpServletRequest request) {
		// 운송장 번호 넘겨받기
		int p_num = Integer.parseInt(request.getParameter("p_num"));

		// 운송장 번호 자료 유무 및 수령여부 체크(1 있음, 0 없음)
		int result1 = surveyBoardDBBeanMybatis.pNumCheck(p_num);
		// 운송장 번호 작성되었나 유무 체크(1 작성,0 작성안함)
		int result2 = surveyBoardDBBeanMybatis.pNumDupCheck(p_num);
		// 최종 확인
		int resultCheck;

		// 운송번호는 있고, 글 존재 여부
		if (result1 == 1) {
			if (result2 == 0) {
				resultCheck = 0;
			} else {
				resultCheck = 1;
			}
		}
		// 둘다 아닐때
		else {
			resultCheck = 2;
		}

		return Integer.toString(resultCheck);
	}

	// 수령자, 직원번호 가져오기
	@RequestMapping(value = "pNumCheck1", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> bringAbout(HttpServletRequest request) {
		int p_num = Integer.parseInt(request.getParameter("p_num"));
		List<SurveyBoardAboutDataBean> surveyBoardAboutList = null;

		if (surveyBoardDBBeanMybatis.mybatisConnector.getDbname().equals("Oracle")) {
			surveyBoardAboutList = surveyBoardDBBeanMybatis.getBringAbout(p_num);
		} else {
			surveyBoardAboutList = surveyBoardDBBeanMybatis.getBringAbout(p_num);
		}

		Map<String, Object> aboutmap = new HashMap<String, Object>();
		aboutmap.put("r_num", surveyBoardAboutList.get(0).getR_num());
		aboutmap.put("e_num", surveyBoardAboutList.get(0).getE_num());
		aboutmap.put("r_receiver", surveyBoardAboutList.get(0).getR_receiver());

		return aboutmap;
	}

	// 입력처리
	@RequestMapping("surveyPro")
	public String surveyUploadPro(SurveyBoardWriteDataBean writeBoard, SurveyResultDataBean resultBoard) {
		surveyBoardDBBeanMybatis.insertSurvey(writeBoard);
		System.out.println("insertSurvey 실행===============");

		int sb_num = writeBoard.getSb_num();
		int e_num = writeBoard.getE_num();
		surveyBoardDBBeanMybatis.insertResult(resultBoard, sb_num, e_num);
		System.out.println("insertResult 실행===============");

		return "redirect:list?pageNum=1";
	}

	// 목록 가져오기
	@RequestMapping("list")
	public ModelAndView surveylist() throws Exception {
		mv.clear();

		int pageSize = 6;
		int currentPage = pageNum;

		int count = surveyBoardDBBeanMybatis.getReadCount();
		int startRow = (currentPage - 1) * pageSize;
		int endRow = currentPage * pageSize;
		if (count < endRow)
			endRow = count;
		List<SurveyBoardDataBean> surveyBoardList = null;

		if (surveyBoardDBBeanMybatis.mybatisConnector.getDbname().equals("Oracle")) {
			surveyBoardList = surveyBoardDBBeanMybatis.getSurveyList(startRow + 1, endRow);
		} else {
			surveyBoardList = surveyBoardDBBeanMybatis.getSurveyList(startRow, pageSize);
		}

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
		mv.addObject("surveyBoardList", surveyBoardList);
		mv.addObject("number", number);
		mv.addObject("startPage", startPage);
		mv.addObject("bottomLine", bottomLine);
		mv.addObject("endPage", endPage);
		mv.addObject("pageCount", pageCount);

		mv.setViewName("satisfaction/satisfactionBoard");
		return mv;

	}

	// 내용 가져오기
	@RequestMapping("content")
	public ModelAndView surveyContent(int sb_num) {
		mv.clear();
		SurveyBoardDataBean surveyBoardContent = surveyBoardDBBeanMybatis.getSurveyContent(sb_num);

		List<SurveyContentResultDataBean> surveyContentResult = surveyBoardDBBeanMybatis.getSurveyContentResult(sb_num);

		mv.addObject("surveyBoardContent", surveyBoardContent);
		mv.addObject("surveyContentResult", surveyContentResult);
		mv.addObject("pageNum", pageNum);
		mv.setViewName("satisfaction/satisfactionContent");
		return mv;
	}

	// 삭제
	@RequestMapping("delete")
	public ModelAndView delete(int sb_num) {
		mv.clear();
		mv.addObject("sb_num", sb_num);
		mv.addObject("pageNum", pageNum);
		mv.setViewName("satisfaction/surveyDelete");
		return mv;
	}

	@RequestMapping("deletePro")
	public ModelAndView deleteSurvey(int sb_num, String passwd) {
		mv.clear();
		int check = surveyBoardDBBeanMybatis.deleteSurvey(sb_num, passwd);
		mv.addObject("check", check);
		mv.addObject("pageNum", pageNum);
		mv.setViewName("satisfaction/deleteCheck");
		return mv;
	}

	// 업데이트를 위한 비밀번호 확인폼으로 이동
	@RequestMapping("updateMove")
	public ModelAndView updateCheck(int sb_num) throws Exception {
		mv.clear();
		mv.addObject("sb_num", sb_num);
		mv.addObject("pageNum", pageNum);
		mv.setViewName("satisfaction/updateCheck");
		return mv;
	}

	// 업데이트를 위한 비밀번호 확인
	@RequestMapping("updateCheck")
	public String updateCheck(int sb_num, String passwd) throws Exception {
		mv.clear();
		int check = surveyBoardDBBeanMybatis.updateCheckSurvey(sb_num, passwd);
		/*mv.addObject("check", check);
		mv.addObject("sb_num", sb_num);
		mv.addObject("pageNum", pageNum);
		mv.setViewName("satisfaction/updateCheckPro");*/
		if (check==1) {
			return "redirect:updateSurvey?sb_num="+sb_num+"&pageNum="+pageNum;
		}
		else {
			return "redirect:updateCheckError?sb_num="+sb_num+"&pageNum="+pageNum;
		}
	}
	
	//에러 떴을 시에
		@RequestMapping("updateCheckError")
		public ModelAndView updateCheckError(int sb_num) {
			mv.clear();
			mv.addObject("sb_num", sb_num);
			mv.addObject("pageNum", pageNum);
			mv.setViewName("satisfaction/updateCheckPro");
			return mv;
		}

	// 업데이트
	@RequestMapping("updateSurvey")
	public ModelAndView updateSurvey(int sb_num) throws Exception {
		mv.clear();

		// 결과물(만족도 게시판, 평가 결과)과 원래 질문, 선택지 가져오기
		SurveyBoardDataBean surveyBoard = surveyBoardDBBeanMybatis.getSurveyContent(sb_num);
		List<SurveyContentResultDataBean> contentResult = surveyBoardDBBeanMybatis.getSurveyContentResult(sb_num);
		List<SurveyBoardQuestionDataBean> surveyQuestionList = surveyBoardDBBeanMybatis.getQuestionList();
		;
		List<SurveyBoardAnswerDataBean> surveyAnswerList = surveyBoardDBBeanMybatis.getAnswerList();

		// 확인하기
		mv.addObject("pageNum", pageNum);
		mv.addObject("surveyBoard", surveyBoard);
		mv.addObject("contentResult", contentResult);
		mv.addObject("surveyQuestionList", surveyQuestionList);
		mv.addObject("surveyAnswerList", surveyAnswerList);
		mv.setViewName("satisfaction/surveyUpdateForm");
		return mv;
	}

	@RequestMapping("updatePro")
	public String updateSurveyPro(SurveyBoardWriteDataBean updateBoard, SurveyResultDataBean updateResultBoard,
			int sb_num) {
		mv.clear();
		surveyBoardDBBeanMybatis.updateSurvey(updateBoard, sb_num);

		int[] surveyResultupdate = { updateResultBoard.getSatisfaction1(), updateResultBoard.getSatisfaction2(),
				updateResultBoard.getSatisfaction3(), updateResultBoard.getSatisfaction4(),
				updateResultBoard.getSatisfaction5(), updateResultBoard.getSatisfaction6() };
		
		for (int i = 0; i < 6; i++) {
			surveyBoardDBBeanMybatis.updateResultSurvey(sb_num, i+1,surveyResultupdate[i]);
		}
		
		return "redirect:list?pageNum="+pageNum;
	}

}
