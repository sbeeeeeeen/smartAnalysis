package kr.or.ddit.guide.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/guide")
@Controller("guideController")
public class GuideController {

	@RequestMapping(value = "/book")
	public String view() {
		return "guide/guide2";
	}

}
