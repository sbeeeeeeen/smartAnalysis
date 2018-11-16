package kr.or.ddit.map.web;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import kr.or.ddit.industry.model.IndustryVo;
import kr.or.ddit.industry.service.IndustryServiceInf;
import kr.or.ddit.region.service.RegionServiceInf;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;



@RequestMapping("/map")
@Controller
public class MapController {
	
	@Resource(name="industryService")
	private IndustryServiceInf indService;
	
	@Resource(name="regionService")
	private RegionServiceInf regService;
	
	@RequestMapping("/taSelect")
	public String taSelect(HttpSession session, Model model) {
		if(session.getAttribute("memberVo")==null){
			return "login";
		}
		model.addAttribute("lList", indService.getInd_L());
		return "taSelect";
	}
	
	@RequestMapping(value="/getreg", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String getreg(@RequestParam(value = "reg") String reg) throws UnsupportedEncodingException, JsonProcessingException{
		reg = URLDecoder.decode(reg, "UTF-8");
		return new ObjectMapper().writeValueAsString(regService.searchRegion(reg));
	}
	
	@RequestMapping("/getIndustryM")
	public ModelAndView getIndustryM(@RequestParam("lcode") String lcode){
		ModelAndView mav = new ModelAndView("jsonView");
		List<IndustryVo> mList = indService.getIndustryM(lcode);
		mav.addObject("mList", mList);
		return mav;
	}
	
	@RequestMapping("/getIndustryS")
	public ModelAndView getIndustryS(@RequestParam("mcode")String mcode){
		ModelAndView mav = new ModelAndView("jsonView");
		List<IndustryVo> sList = indService.getIndustryS(mcode);
		mav.addObject("sList", sList);
		return mav;
	}
	
	/*@RequestMapping(value = "/imageCreate")
	public ModelAndView createImage(HttpServletRequest request)throws Exception {
		String binaryData = request.getParameter("imgSrc");
		FileOutputStream stream = null;
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		try {
			System.out.println("binary file   " + binaryData);
			if (binaryData == null || binaryData == "") {
				throw new Exception();
			}

			binaryData = binaryData.replaceAll("data:image/png;base64,", "");
			byte[] file = Base64.decodeBase64(binaryData);
			System.out.println("file  :::::::: " + file + " || " + file.length);
			String fileName = UUID.randomUUID().toString();

			stream = new FileOutputStream("c:\\test\\" + fileName + ".png");
			stream.write(file);
			stream.close();
			System.out.println("파일 작성 완료");
			mav.addObject("msg", "ok");

		} catch (Exception e) {
			System.out.println("파일이 정상적으로 넘어오지 않았습니다");
			mav.addObject("msg", "no");
			return mav;
		} finally {
			stream.close();
		}
		return mav;

	}*/
	
}
