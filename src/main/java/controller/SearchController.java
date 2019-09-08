package controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.Parcel;
import model.Pickup;
import model.Qualities;
import model.RootNode;
import model.WayBill;
import service.SearchDBBeanMybatis;

@Controller
@RequestMapping("/search/")
public class SearchController {
    ModelAndView mv = new ModelAndView();
    
    @Autowired
    public SearchDBBeanMybatis searchDBBeanMybatis;
    
    @RequestMapping("search")
    public ModelAndView searchPro(String w_num) {
    	mv.clear();
    	if(w_num == null) {
    		mv.setViewName("search/search");
    		return mv;
    	}
    	
    	WayBill wb = searchDBBeanMybatis.searchPost(w_num);
    	
    	if(wb == null) {
    		mv.setViewName("redirect:search?noParcel=1");
    		return mv;
    	}
    	
    	RootNode rn = searchDBBeanMybatis.selectNodeCode(w_num);
    	List<Qualities> list = new ArrayList<Qualities>();
    	list = searchDBBeanMybatis.selectQualities(w_num);
    	
    	Parcel parcel = searchDBBeanMybatis.selectWhereNow(w_num);
    	Pickup pickup = searchDBBeanMybatis.reservedChk(parcel.getP_num());
    	String whereNow = parcel.getP_location();
    	String p_num = parcel.getP_num();
    	
    	mv.addObject("rootnode", rn);
    	mv.addObject("waybill", wb);
    	mv.addObject("qList", list);
    	mv.addObject("pickup", pickup);
    	mv.addObject("whereNow", whereNow);
    	mv.addObject("p_num", p_num);
    	mv.addObject("p_quality", parcel.getP_quality());
    	
    	mv.setViewName("search/search");
    	return mv;
    }
     
    @RequestMapping("/pickUpReserve")
    public ModelAndView pickUpReserve(Pickup pickup, String w_num) {
    	mv.clear();
    	pickup.setPu_date();
    	searchDBBeanMybatis.pickupReserve(pickup);
    	WayBill wb = searchDBBeanMybatis.searchPost(w_num);
    	RootNode rn = searchDBBeanMybatis.selectNodeCode(w_num);
    	List<Qualities> list = new ArrayList<Qualities>();
    	list = searchDBBeanMybatis.selectQualities(w_num);
    	
    	Parcel parcel = searchDBBeanMybatis.selectWhereNow(w_num);
    	Pickup pickup2 = searchDBBeanMybatis.reservedChk(parcel.getP_num());
    	String whereNow = parcel.getP_location();
    	String p_num = parcel.getP_num();
    
    	mv.addObject("rootnode", rn);
    	mv.addObject("waybill", wb);
    	mv.addObject("qList", list);
    	mv.addObject("pickup", pickup2);
    	mv.addObject("whereNow", whereNow);
    	mv.addObject("p_num", p_num);
    	mv.addObject("p_quality", parcel.getP_quality());
    	
    	mv.setViewName("search/search");
    	return mv;
    }
}
