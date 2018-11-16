package kr.or.ddit.analysis_res.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import kr.or.ddit.analysis_res.model.AnalysisCodeVo;
import kr.or.ddit.analysis_res.model.AnalysisRecVo;
import kr.or.ddit.analysis_res.model.AnalysisResVo;
import kr.or.ddit.analysis_res.service.AnalysisResServiceInf;
import kr.or.ddit.floating.service.FloatingServiceInf;
import kr.or.ddit.industry.service.IndustryServiceInf;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.open_close.service.Open_closeServiceInf;
import kr.or.ddit.rating.service.RatingServiceInf;
import kr.or.ddit.rectal.service.RectalServiceInf;
import kr.or.ddit.region.service.RegionServiceInf;
import kr.or.ddit.residential.service.ResidentialServiceInf;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.xml.sax.SAXException;

@RequestMapping("/analysisRes")
@Controller
public class AnalysisResController {
	
	@Resource(name="industryService")
	private IndustryServiceInf industryService;
	
	@Resource(name="analysisResService")
	private AnalysisResServiceInf analysisService;
	
	@Resource(name="ratingService")
	private RatingServiceInf ratingService;
	
	@Resource(name="regionService")
	private RegionServiceInf regionService;
	
	@Resource(name="floatingService")
	private FloatingServiceInf floatingService;
	
	@Resource(name="rectalService")
	private RectalServiceInf rectalService;
	
	@Resource(name="residentialService")
	private ResidentialServiceInf residentialService;
	
	@Resource(name="open_closeService")
	private Open_closeServiceInf open_closeService;
	
	XmlParsing xmlparser = new XmlParsing();
	
//////////////////////////상권분석 선택  > 상권분석 보고서
	@RequestMapping("result")
	public String taResult(@RequestParam("addr")String addr,
						   @RequestParam("uj")List<String> ujList, 
						   @RequestParam(required=false, value="radius") String radius,
						   @RequestParam("latlngJson") String latlng,
						   HttpSession session,
						   Model model){
		String mem_id = ((MemberVo)session.getAttribute("memberVo")).getMem_id();
		
		//analysis_res insert
		AnalysisResVo anVo = new AnalysisResVo();
		anVo.setAn_div('1');
		anVo.setMem_id(mem_id);
		int an_num = insertAnalysisRes(anVo);
		
		//analysis_code insert
		for(String industry : ujList){
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("an_num", an_num);
			data.put("ind_code", industry);
			data.put("dong", addr.split(" ")[2]);
			insertAnalysisCode(data);
		}
		
		//analysis_rec insert
		JSONObject jsonobject = new JSONObject(latlng);
		JSONArray jsonArray = jsonobject.getJSONArray("latlng");
		for(int i=0; i<jsonArray.length(); i++){
			AnalysisRecVo arVo = new AnalysisRecVo();
			arVo.setAN_NUM(an_num);
			arVo.setAN_SHAPE(jsonArray.length()==1?radius==null?'1':'2':'3');
			arVo.setAN_RAD(radius==null?0:Double.parseDouble(radius));
			arVo.setAN_COORX(jsonArray.getJSONObject(i).getDouble("lng"));
			arVo.setAN_COORY(jsonArray.getJSONObject(i).getDouble("lat"));
			insertAnalysisRec(arVo);
		}
		
		model.addAllAttributes(results(an_num));
		return "taResult";
	}
	
	//상권분석 보고서 넘어갈 때 가져갈 것들 모음집
	public Map<String, Object> results(int an_num){
		//평가지수
		Map<String, Object> resultMap = ratingService.getRatingLists(an_num);
		//analysisres, recVo
		List<AnalysisRecVo> arVo = analysisService.getAnalysisRecList(an_num);
		resultMap.put("analysisRecVo", arVo);
		//ac_vo List
		List<AnalysisCodeVo> acVoList = analysisService.getAnalysisCodeVo(an_num);
		resultMap.put("acVoList", acVoList);
		//평가등급
		resultMap.put("ratingGrade", ratingService.getRatingGrade(acVoList.get(0).getREG_CODE()));
		long reg_code = acVoList.get(0).getREG_CODE();
		//regionVo
		resultMap.put("regionVo", regionService.getRegion(reg_code));
		List<String> industryCodeList = new ArrayList<String>();
		for(AnalysisCodeVo acVo : acVoList){
			industryCodeList.add(acVo.getIND_CODE());
		}
		//업종리스트
		resultMap.put("industryList", industryService.getIndustryList(industryCodeList));
		//분석시점
		resultMap.put("an_dt", acVoList.get(0).getAN_DT());
		try {
			//선택 지역 안에 업종 개수
			resultMap.putAll(xmlparser.getstoreListInUpjong(acVoList, arVo));
		} catch (ParserConfigurationException | SAXException | IOException e) {
			e.printStackTrace();
		}
		//유동인구수
		resultMap.put("floatingVo", floatingService.getFloatingVo(reg_code));
		//직장인구수
		resultMap.put("rectalVo", rectalService.getRectalVo(reg_code));
		//주거인구수
		resultMap.put("ResidentialVo", residentialService.getResidentialVo(reg_code));
		//창폐업율
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("ind_lcode", acVoList.get(0).getIND_MCODE().substring(0, 1));
		data.put("reg_gucode", (int)((acVoList.get(0).getREG_CODE())/100000));
		resultMap.putAll(open_closeService.getOpenCloseList(data));
		return resultMap;
	}
	
	//리턴값 : an_num
	private int insertAnalysisRes(AnalysisResVo anVo){
		return analysisService.insertAnalysisRes(anVo);
	}
	
	//리턴값 : reg_code
	private long insertAnalysisCode(Map<String, Object> data){
		return analysisService.insertAnalysisCode(data);
	}
	
	private int insertAnalysisRec(AnalysisRecVo arVo){
		return analysisService.insertAnalysisRec(arVo);
	}

//////////////////////////분석이력
	@RequestMapping("/tradeAnalysisRes")
	public String analysisResMain(HttpSession session
								, @RequestParam(value = "page", defaultValue = "1") int page
								, @RequestParam(value = "pageSize", defaultValue = "10") int pageSize
								, @RequestParam(value = "an_div", defaultValue = "0") int div
								, Model model){
		MemberVo mem = (MemberVo)session.getAttribute("memberVo");
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("page", page);
		data.put("pageSize", pageSize);
		data.put("an_div", div);
		data.put("mem_id", mem.getMem_id());
		model.addAllAttributes(analysisService.getAnalysisResList(data));
		return "tradeAnalysisRes";
	}
	
	//분석이력 페이지네이션으로 바뀔때 가져갈거 ㅠ
	@RequestMapping("/tradeAnalysisResSelectList")
	public ModelAndView tradeAnalysisResSelectList(HttpSession session
												 , @RequestParam(value = "pageSize") int pageSize
												 , @RequestParam("div") int div){
		ModelAndView mav = new ModelAndView("jsonView");
		String mem_id = ((MemberVo)session.getAttribute("memberVo")).getMem_id();
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("page", 1);
		data.put("pageSize", pageSize);
		data.put("an_div", div);
		data.put("mem_id", mem_id);
		mav.addAllObjects(analysisService.getAnalysisResList(data));
		return mav;
	}
	
//분석이력 >상권분석 보고서
	@RequestMapping("/tradeReport")
	public String tradeReport(int an_num, Model model){
		model.addAllAttributes(results(an_num));
		return "taResult";
	}
//분석이력>상권분석 다시분석	
	@RequestMapping("/retrade")
	public String retrade(int an_num, Model model){
		model.addAttribute("lList", industryService.getInd_L());
		//좌표 등등 리스트
		List<AnalysisRecVo> analysisrecList = analysisService.getAnalysisRecList(an_num);
		model.addAttribute("analysisrecList", analysisrecList);
		//업종
		List<AnalysisCodeVo> acVoList = analysisService.getAnalysisCodeVo(an_num);
		List<String> indcodeList = new ArrayList<String>();
		for(AnalysisCodeVo acVo : acVoList){
			indcodeList.add(acVo.getIND_CODE());
		}
		model.addAttribute("indcodeList", indcodeList);
		model.addAttribute("indli", industryService.getIndustryStr(indcodeList));
		return "taSelect";
	}
	
	
}
