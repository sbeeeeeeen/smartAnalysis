package kr.or.ddit.utilization.web;

import java.util.List;

import javax.annotation.Resource;

import kr.or.ddit.industry.model.IndustryVo;
import kr.or.ddit.industry.service.IndustryServiceInf;
import kr.or.ddit.region.model.RegionVo;
import kr.or.ddit.region.service.RegionServiceInf;
import kr.or.ddit.utilization.model.UtilizationVo;
import kr.or.ddit.utilization.service.UtilizationServiceInf;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/util")
@Controller("utilizationController")
public class UtilizationController {

	private Logger logger = LoggerFactory
			.getLogger(UtilizationController.class);

	@Resource(name = "regionService")
	private RegionServiceInf regionService;

	@Resource(name = "utilizaionService")
	private UtilizationServiceInf utilizaionService;

	@Resource(name = "industryService")
	private IndustryServiceInf industryService;

	@RequestMapping(value = "/view")
	@ResponseBody
	public ModelAndView view() {
		ModelAndView mav = new ModelAndView("utilization");
		List<RegionVo> reg_guList = regionService.getReg_gu();
		mav.addObject("reg_guList", reg_guList);
		
		return mav;
	}

	@RequestMapping("/regGu")
	public ModelAndView regGu(@RequestParam(value = "reg_gu") String reg_gu1,
			Model model) {
		
		ModelAndView mav = new ModelAndView("jsonView");


			int reg_gu = Integer.parseInt(reg_gu1);
			List<RegionVo> dongList = regionService.getRegionVo(reg_gu);
			model.addAttribute("dongList", dongList);


		return mav;

	}
	
	@RequestMapping(value = "/result")
	public ModelAndView regDong(
			@RequestParam(value = "reg_dong") String reg_dong) {
		ModelAndView mav = new ModelAndView("jsonView");
		
		List<RegionVo> reg_guList = regionService.getReg_gu();
		mav.addObject("reg_guList", reg_guList);
		
		logger.debug("{},reg_dong======================================="+reg_dong);
		if (reg_dong != null) {
			long reg_dongParse = Long.parseLong(reg_dong);
			List<UtilizationVo> resultListSang = utilizaionService
					.getUtilSang(reg_dongParse);
			List<UtilizationVo> resultListHa = utilizaionService
					.getUtilHa(reg_dongParse);

			
			int sangCnt = 0;
			for (int i = 0; i < resultListSang.size(); i++) {

				sangCnt += resultListSang.get(i).getCnt();

			}

			int haCnt = 0;
			for (int i = 0; i < resultListHa.size(); i++) {

				haCnt += resultListHa.get(i).getCnt();

			}

			int sangListSize = resultListSang.size();
			int haListSize = resultListHa.size();

			if (sangListSize >= haListSize) {
				mav.addObject("listSize", sangListSize);
			} else {
				mav.addObject("listSize", haListSize);
			}
			logger.debug("{},resultListSang======================================="+resultListSang);
			mav.addObject("resultListSang", resultListSang);
			mav.addObject("resultListHa", resultListHa);
			mav.addObject("sangCnt", sangCnt);
			mav.addObject("haCnt", haCnt);

		}

		return mav;

	}

	// 업종 보는 창
	@RequestMapping(value = "/upzong")
	@ResponseBody
	public ModelAndView upjongView() {

		ModelAndView mav = new ModelAndView("upzongUilization");

		List<IndustryVo> Ind_lList = industryService.getInd_L();
		mav.addObject("Ind_lList", Ind_lList);

		return mav;

	}

	// 업종 중분류 선택
	@RequestMapping("/ind_l")
	public ModelAndView ind_lView(@RequestParam (value = "ind_l") String ind_l) {

		ModelAndView mav = new ModelAndView("jsonView");

			List<IndustryVo> Ind_mList = industryService.getIndustryM(ind_l);
			mav.addObject("Ind_mList", Ind_mList);


		return mav;
	}

	// 업종 현황보기 창
	@RequestMapping(value = "/upzongResult")
	public ModelAndView upjongResultView(
			@RequestParam(value = "ind_m") String ind_m) {

		ModelAndView mav = new ModelAndView("jsonView");
		
		List<IndustryVo> Ind_lList = industryService.getInd_L();
		mav.addObject("Ind_lList", Ind_lList);

		if ("ind_m" != null) {
			List<UtilizationVo> upzongResultSang = utilizaionService
					.getUpzongSang(ind_m);
			List<UtilizationVo> upzongResultHa = utilizaionService
					.getUpzongHa(ind_m);

			int sangCnt = 0;
			for (int i = 0; i < upzongResultSang.size(); i++) {

				sangCnt += upzongResultSang.get(i).getCnt();

			}

			int haCnt = 0;
			for (int i = 0; i < upzongResultHa.size(); i++) {

				haCnt += upzongResultHa.get(i).getCnt();

			}

			int sangListSize = upzongResultSang.size();
			int haListSize = upzongResultHa.size();

			if (sangListSize >= haListSize) {
				mav.addObject("listSize", sangListSize);
			} else {
				mav.addObject("listSize", haListSize);
			}
			logger.debug("{},upzongResultSang======================================================="+upzongResultSang);
			mav.addObject("upzongResultSang", upzongResultSang);
			mav.addObject("upzongResultHa", upzongResultHa);
			mav.addObject("sangCnt", sangCnt);
			mav.addObject("haCnt", haCnt);

		}

		return mav;
	}

}
