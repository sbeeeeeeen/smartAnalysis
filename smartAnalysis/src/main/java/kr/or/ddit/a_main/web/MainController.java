package kr.or.ddit.a_main.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import kr.or.ddit.industry.model.IndustryVo;
import kr.or.ddit.industry.service.IndustryServiceInf;
import kr.or.ddit.post.model.PostVo;
import kr.or.ddit.post.service.PostServiceInf;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/main")
@Controller("mainController")
public class MainController {
	
	@Resource(name="postService")
	private PostServiceInf postService;
	
	@Resource(name="industryService")
	private IndustryServiceInf industryService;
	
	@RequestMapping("/view")
	public String view(Model model){
		List<PostVo> postList = postService.postList(1);
		model.addAttribute("post5List", postList);
		return "smartMain";
	}
	
	@RequestMapping(value="/chatList")
	public String chatList(Model model){
		model.addAttribute("industryList", industryService.getInd_L());
		return "chat/chatList";
	}
	
	@RequestMapping(value="/chat")
	public String chat(IndustryVo industry, Model model){
		model.addAttribute("industry", industry);
		return "chat/chat";
	}
	
	@RequestMapping(value="/bot")
	public String bot(){
		return "chat/speech";
	}
	
	@RequestMapping(value="/pop")
	public String pop(){
		return "content/mainPopimg";
	}
}
