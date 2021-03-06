package kr.or.ddit.sns_analysis.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.sns_analysis.service.SnsAnalysisServiceInf;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/snsAnalysis")
public class SnsAnalysisController {
	
	private Logger logger = LoggerFactory.getLogger(SnsAnalysisController.class);
	@Resource(name = "snsAnalysisService")
	private SnsAnalysisServiceInf service;

	@RequestMapping("/view")
	public ModelAndView snsAnalysisView() {
		ModelAndView mav = new ModelAndView("snsAnalysis");
		return mav;
	}
	
	//�ΰ��� �׽�Ʈ �غ�����.
	@RequestMapping("/test")
	public String testView(){
		return "snsAnalysis/animation";
	}
	
	//�ΰ��� �׽�Ʈ �غ�����.
		@RequestMapping("/test2")
		public String testView2(){
			return "snsAnalysis/animation2";
		}
	
	@RequestMapping(value="/adams", method = RequestMethod.GET)
	public ModelAndView adamsAPI(HttpServletRequest request,HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		return mav;
	}
}