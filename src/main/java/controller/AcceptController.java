package controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.Charge;
import model.WayBill;
import model.WayBillTelAndAddr;
import service.AcceptService;

@Controller
@RequestMapping("/accept/")
public class AcceptController {

	ModelAndView mv = new ModelAndView();
	
	@Autowired
	AcceptService acceptService;

	@RequestMapping("accept")
	public ModelAndView accept() {
		mv.clear();
		mv.setViewName("accept/accept");
		return mv;
	}
	
	@RequestMapping("acceptSuccess")
	public ModelAndView acceptCheck() {
		mv.clear();
		mv.setViewName("accept/acceptSuccess");
		return mv;
	}
	
	@RequestMapping("chargeInfo")
	public ModelAndView chargeInfo() {
		mv.clear();
		mv.setViewName("accept/chargeInfo");
		return mv;
	}
	
	@RequestMapping("getNodeDiv2")
	@ResponseBody
	public List getAllNodeDiv2() throws Exception {
		List nodeList = acceptService.getAllNodeDiv2();
		return nodeList;
	}
	
	@RequestMapping("chargeCal")
	@ResponseBody
	public Charge chargeCal(int totalLength, int weight, String area) throws Exception {
		String size = "";
		if (weight > 30 || totalLength > 160) {
			size = "대";
		} else if (weight > 20 || totalLength > 140) {
			size = "중";
		} else if (weight > 10 || totalLength > 120) {
			size = "소";
		} else {
			size = "극소";
		}
		return acceptService.chargeCal(size, area);
	}
	
	@RequestMapping("createWaybill")
	public ModelAndView createWaybill(WayBill wayBill, WayBillTelAndAddr wayBillTelAndAddr, HttpServletRequest request, String duedate, String n_starts, String n_ends, String n_vias, String w_weights) throws Exception {
		mv.clear();
		HttpSession session = request.getSession();
		//int id = (Integer) session.getAttribute("LOGINED_ID");
		
//		if (id != 0) {
//			wayBill.setM_num(id);
//		} else {
			wayBill.setM_num(0);
//		}
//		Date dt =  new SimpleDateFormat("yy/MM/dd").parse(duedate);
//		System.out.println(dt);
//		wayBill.setW_duedate(dt);
		wayBill.setN_start(Integer.parseInt(n_starts));
		wayBill.setN_via(Integer.parseInt(n_vias));
		wayBill.setN_end(Integer.parseInt(n_ends));
		wayBill.setW_weight(Integer.parseInt(w_weights));
		wayBill.setSender_tel(wayBillTelAndAddr.s_tel());
		wayBill.setW_dtn(wayBillTelAndAddr.r_addr());
		wayBill.setSender_add(wayBillTelAndAddr.s_addr());
		wayBill.setReceiver_tel(wayBillTelAndAddr.r_tel());
		wayBill.setReceiver_add(wayBillTelAndAddr.r_addr());
		
		acceptService.insertWayBill(wayBill);
		acceptService.insertParcel(wayBill.getN_start());
		int pacelNum = acceptService.getParcelNum();
		acceptService.insertDS(pacelNum, wayBill.getN_start());
		
		int wbNum = acceptService.getWbNum();
		
		mv.addObject("wbNum", wbNum);
		
		mv.setViewName("accept/acceptSuccess");
		return mv;
	}
	
	@RequestMapping("avgDelevery")
	@ResponseBody
	public String avgDelevery(String startNodeNum, String endNodeNum) throws Exception {
		return acceptService.avgDelevery(startNodeNum, endNodeNum);
	}
}
