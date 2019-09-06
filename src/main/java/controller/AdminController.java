package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.Deliverestimation;
import model.Emp;
import service.AdminService;

@Controller
@RequestMapping("/admin/")
public class AdminController {

	ModelAndView mv = new ModelAndView();

	@Autowired
	AdminService adminservice;

	@RequestMapping("main")
	public ModelAndView main() {
		mv.clear();
		mv.setViewName("../admin_view/main_admin");
		return mv;
	}

	@RequestMapping("popup")
	public ModelAndView popup() {
		mv.clear();
		mv.setViewName("../admin_view/popUpManagement/popup");
		return mv;
	}

	@RequestMapping("notice")
	public ModelAndView notice() {
		mv.clear();
		mv.setViewName("../admin_view/noticeManagement/noticeAdmin");
		return mv;
	}

	@RequestMapping("menu")
	public ModelAndView menu() {
		mv.clear();
		mv.setViewName("../admin_view/menuManagement/menuAdmin");
		return mv;
	}

	@RequestMapping("reference")
	public ModelAndView reference() {
		mv.clear();
		mv.setViewName("../admin_view/emp/reference");
		return mv;
	}

	@RequestMapping("emp") //얘랑 아주 똑같아! 아주아중자우자ㅜ아자우자우우자우ㅏ또각ㅌ아
	public ModelAndView emp(HttpSession session) {
		mv.clear();

		Emp emp = (Emp) session.getAttribute("emp");

		List<Deliverestimation> ds = adminservice.getDS(emp.getE_num());
		
		mv.addObject("DSs", ds);
		mv.setViewName("../admin_view/emp/emp");
		return mv;
	}

	@RequestMapping("passParcel")
	@ResponseBody
	public int passParcel(String emp, String quality, String ds_num, int cn, String receiver, String receiverLoaction) throws Exception {
		// List nodeList = adminservice.getAllNodeDiv2();
		System.out.println("emp: " + emp + "\tquality: " + quality+"\tds_num: "+ds_num);
		
		int result = adminservice.passParcel(emp, quality, ds_num);
		System.out.println("pass currentNode: "+cn);
		if (cn == 3) {
			adminservice.clearParcel(ds_num, receiver, receiverLoaction, emp);
		}
		return result;
	}

	@RequestMapping("workProcess")
	@ResponseBody
	public HashMap workProcess(String num) throws Exception {
		HashMap map = new HashMap();

		int currentNode = adminservice.getCurrentNode(num);
		System.out.println("currentNode: "+currentNode);
		if (currentNode == 1 || currentNode == 2) {
			List<Emp> emps = adminservice.getNextEmp(num, currentNode);
			map.put("emps", emps);
		} 
		map.put("currentNode", currentNode);
		return map;
	}
}
