package kr.or.ddit.jumpo.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.xml.parsers.ParserConfigurationException;

import kr.or.ddit.analysis_res.model.AnalysisCodeVo;
import kr.or.ddit.analysis_res.model.AnalysisRecVo;
import kr.or.ddit.analysis_res.model.AnalysisResVo;
import kr.or.ddit.analysis_res.service.AnalysisResServiceInf;
import kr.or.ddit.analysis_res.web.XmlParsing;
import kr.or.ddit.industry.model.IndustryVo;
import kr.or.ddit.industry.service.IndustryServiceInf;
import kr.or.ddit.region.service.RegionServiceInf;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.xml.sax.SAXException;

@RequestMapping("/jumpo")
@Controller("jumpoController")
public class JumpoController {
	
	private Logger logger = LoggerFactory.getLogger(JumpoController.class);
	
	@Resource(name = "industryService")
	private IndustryServiceInf industryService;

	@Resource(name = "analysisResService")
	private AnalysisResServiceInf analysisService;

	@Resource(name = "regionService")
	private RegionServiceInf regionService;
	
	XmlParsing3 xmlparser3 = new XmlParsing3();

	// 점포검색 메인창, 대분류
	@RequestMapping(value = "/view")
	public ModelAndView view() {

		ModelAndView mav = new ModelAndView("jumpoMain");

		List<IndustryVo> Ind_lList = industryService.getInd_L();
		mav.addObject("Ind_lList", Ind_lList);

		return mav;

	}

	// 업종 중분류 리스트
	@RequestMapping("/ind_l")
	public ModelAndView ind_lView(@RequestParam(value = "ind_l") String ind_l) {

		ModelAndView mav = new ModelAndView("jsonView");

		List<IndustryVo> Ind_mList = industryService.getIndustryM(ind_l);
		mav.addObject("Ind_mList", Ind_mList);

		return mav;
	}

	// 업종 소분류 리스트
	@RequestMapping("/ind_m")
	public ModelAndView ind_mView(@RequestParam(value = "ind_m") String ind_m) {

		ModelAndView mav = new ModelAndView("jsonView");

		List<IndustryVo> Ind_sList = industryService.getIndustryS(ind_m);
		mav.addObject("Ind_sList", Ind_sList);

		return mav;
	}

	// 결과창 출력
	// 선택한 주소, 업종 리스트, 반경, 좌표들 가져오기
	@RequestMapping("/result")
	public ModelAndView result(@RequestParam("addr") String addr,
			@RequestParam("uj") List<String> ujList,
			@RequestParam(required = false, value = "radius") String radius,
			@RequestParam("latlngJson") String latlng,
			@RequestParam("divRange") char divRange) {
		
		logger.debug("{},addr ==========================================="+addr);
		
		ModelAndView mav = new ModelAndView("jsonView");
		List<IndustryVo> Ind_lList = industryService.getInd_L();
		mav.addObject("Ind_lList", Ind_lList);
		Map<String, Object> resultMap = new HashMap<String, Object>();

		
		// analysis_rec insert
		JSONObject jsonobject = new JSONObject(latlng); //좌표 오브젝트 가져오기
		JSONArray jsonArray = jsonobject.getJSONArray("latlng");
		List<AnalysisRecVo> arVoList = new ArrayList<AnalysisRecVo>();
		for (int i = 0; i < jsonArray.length(); i++) {
			AnalysisRecVo arVo = new AnalysisRecVo();
			
			arVo.setAN_RAD(radius == null ? 0 : Double.parseDouble(radius));
			arVo.setAN_COORX(jsonArray.getJSONObject(i).getDouble("lng"));
			arVo.setAN_COORY(jsonArray.getJSONObject(i).getDouble("lat"));
			arVoList.add(arVo);
		}
		
		List<AnalysisCodeVo> acVoList = new ArrayList<AnalysisCodeVo>();
		String dong = addr.split(" ")[2];
		logger.debug("{},==================================================dong"+dong);
		long reg_code = regionService.getRegCode(dong);
		logger.debug("{},==================================================reg_code"+reg_code);
		for (String industry : ujList) {
			AnalysisCodeVo asVo = new AnalysisCodeVo();
			asVo.setIND_CODE(industry);
			asVo.setIND_MCODE(industry.substring(0, 3));
			asVo.setREG_CODE(reg_code);
			acVoList.add(asVo);
		}
		
		// 선택한 지역 안의 점포정보 가져오기
		try {
			resultMap.putAll(xmlparser3.getstoreListInUpjong(acVoList,arVoList,divRange));
		} catch (ParserConfigurationException | SAXException | IOException e) {
			e.printStackTrace();
		}
		mav.addAllObjects(resultMap);
		mav.addObject("acVoList", acVoList);
		mav.addObject("arVoList", arVoList);
		mav.addObject("divRange", divRange);
		return mav;
	}

}
