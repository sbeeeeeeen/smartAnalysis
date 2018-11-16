package kr.or.ddit.member.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.consulting.model.ConsultingVo;
import kr.or.ddit.consulting.service.ConsultingServiceInf;
import kr.or.ddit.industry.model.IndustryVo;
import kr.or.ddit.industry.service.IndustryServiceInf;
import kr.or.ddit.kisa.seed.KISA_SEED_CBC;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.MemberServiceInf;
import kr.or.ddit.post.model.PostVo;
import kr.or.ddit.post.service.PostServiceInf;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/member")
@Controller("memberController")
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	private String emailKind ="";
	
	@Resource(name="postService")
	private PostServiceInf postService;
	
	@Resource(name="memberService")
	private MemberServiceInf memberService;
	
	@Resource(name="industryService")
	private IndustryServiceInf industryService;
	
	@Resource(name="consultingService")
	private ConsultingServiceInf consultingService;
	
	//로그인 한 사용자 메인화면
	@RequestMapping("/main")
	public String view1(Model model){
		List<PostVo> postList = postService.postList(1);
		model.addAttribute("post5List", postList);
		return "smartMain";
	}
	
	//로그인 화면
	@RequestMapping("/login")
	public String view(){
		
		return "login";
	}
	
	//로그인 처리 
	@RequestMapping(value="/loginProcess", method = RequestMethod.POST)
	public String loginProcess(@RequestParam(value="userId")String userId,
							   @RequestParam(value="password", defaultValue="0")String password,
							   MemberVo memVo,
							   HttpSession session,
							   ServletRequest resuest){
		
		//로그인 프로세스
		memVo = memberService.getOneMember(userId);
		
		if(memVo== null){
			return "redirect:/member/login";
		}
		
		if(memVo.getMem_del()=='n'){
			return "login";
			
		}
		
		
		if(!password.equals("0")){
			String pass = KISA_SEED_CBC.Encrypt(password);
			if(memVo.vaildateUser(userId, pass)){
				System.out.println("-------userId"+userId);
				System.out.println("-------pass"+password);
				session.setAttribute("memberVo", memVo);
				return "redirect:/member/main";
				
			} else{
				return "login";
			}
		}else{
			session.setAttribute("memberVo", memVo);
			return "redirect:/member/main";
		}
//		String password = resuest.getParameter("password");
		//암호화
	}
	
	
	//로그아웃 처리
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		session.removeAttribute("memberVo");
		session.removeAttribute("mem_id");
		session.removeAttribute("mem_name");
		
		return "redirect:/member/login";
		
	}
	
	/*---------------------------------------------마이페이지---------------------------------------------- */
	
	//마이페이지 수정
	@RequestMapping("/mypage")
	@ResponseBody
	public ModelAndView mypage(Model model, HttpSession session){
		ModelAndView mav = new ModelAndView("mypage");
		List<IndustryVo> ind_Llist = new ArrayList<IndustryVo>();
		ind_Llist = industryService.getInd_L();
		mav.addObject("ind_Llist", ind_Llist);
		
		MemberVo mem = (MemberVo) session.getAttribute("memberVo");
		String passDec = KISA_SEED_CBC.Decrypt(mem.getMem_pass());
//		mem.setMem_pass(passDec);
		model.addAttribute("pw", passDec);
		String myCode = mem.getInd_code();
		IndustryVo indVo = new IndustryVo();
		indVo = industryService.getIndustryVo(myCode);
		mav.addObject("myCode", indVo.getIND_S());
		
		String mem_id = mem.getMem_id();
		String consultingId = consultingService.getChannelId(mem_id);
		
		mav.addObject("consultingId", consultingId);
		
		return mav;

	}
	
	@RequestMapping(value="/mypageProcess", method = RequestMethod.POST)
	public String mypageProcess(@RequestParam(value="mycode")String mycode,
								@RequestParam(value="ind_codeL")String ind_codeL,
								@RequestParam(value="mem_id")String mem_id, 
								@ModelAttribute MemberVo memberVo,
								HttpServletRequest request,
								HttpSession session){
		
		String mem_pass = request.getParameter("mem_pass");
		String mem_call = request.getParameter("mem_call");
		String mem_email = request.getParameter("mem_email");
		String mem_add = request.getParameter("mem_add");
		String mem_type = request.getParameter("mem_type");
		
		memberVo = memberService.getOneMember(mem_id);
		memberVo.setMem_pass(KISA_SEED_CBC.Encrypt(mem_pass));
		memberVo.setMem_call(mem_call);
		memberVo.setMem_email(mem_email);
		memberVo.setMem_add(mem_add);
		memberVo.setMem_type(mem_type);
		memberVo.setMem_del('y');
		
		if(ind_codeL==""){
			memberVo.setInd_code(mycode);
		}else{
			String ind_codeS = request.getParameter("ind_codeS");
			memberVo.setInd_code(ind_codeS);
		}
		memberService.updateMem(memberVo);
		session.setAttribute("memberVo", memberVo);
			
		return "redirect:/member/mypage";
	}

	
	/*---------------------------------------------회원가입---------------------------------------------- */
	
	//회원가입 선택 화면
	@RequestMapping("/joinSel")
	public String joinSel(){

		return "join2";
	}
	
	//회원가입 폼 화면
	@RequestMapping("/join")
	@ResponseBody
	public ModelAndView join(@RequestBody String ind_L, ServletRequest request, HttpSession session){
		ModelAndView mav = new ModelAndView("join");
		
		//대분류 리스트
		List<IndustryVo> ind_Llist = new ArrayList<IndustryVo>();
		ind_Llist = industryService.getInd_L();
		mav.addObject("ind_Llist",ind_Llist);
		
		String btn = request.getParameter("btn");
		
		if(btn.equals("joinBtn")){
			session.removeAttribute("mem_id");
			session.removeAttribute("mem_name");
		}

		return mav;
	}
	
	//카카오계정회원가입
	@RequestMapping("/kakaoJoin")
	@ResponseBody
	public String kakaoJoin(ServletRequest request, HttpSession session){
		String mem = request.getParameter("mem_id");
		String name = request.getParameter("mem_name");
		
		
		session.setAttribute("mem_id", mem);
		session.setAttribute("mem_name", name);
		return "/member/join";
	}
	
	
	
	//회원가입 프로세스
	@RequestMapping(value="/joinProcess",method = RequestMethod.POST)
	public String joinProcess(@RequestParam(value="ind_code")String ind_code,
			
							  @RequestParam(value="mem_pass")String mem_pass,
							  MemberVo memberVo){
		
		String pass = KISA_SEED_CBC.Encrypt(mem_pass);
		memberVo.setMem_pass(pass);
		memberVo.setInd_code(ind_code);
		memberVo.setMem_del('y');
		memberService.insertMember(memberVo);
		
		return "redirect:/member/login";
	}
	
	//아이디 중복체크
	@RequestMapping(value = "/idCheck", method=RequestMethod.POST)
    @ResponseBody
    public Map<Object, Object> idcheck(@RequestBody String mem_id) {
        int count = 0;
        Map<Object, Object> map = new HashMap<Object, Object>();
        count = memberService.idcheck(mem_id);
        map.put("cnt", count);
 
        return map;
    }
	
	//이메일 중복체크
	@RequestMapping(value = "/emailCheck", method=RequestMethod.POST)
    @ResponseBody
    public Map<Object, Object> emailCheck(@RequestBody String mem_email) {
        int count = 0;
        Map<Object, Object> map = new HashMap<Object, Object>();
        count = memberService.emailCheck(mem_email);
        map.put("cnt", count);
 
        return map;
    }
	
	//중분류 리스트 가져오기
	@RequestMapping(value="/mList", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView Mlist(@RequestBody String l_code){
		ModelAndView mav = new ModelAndView("jsonView");
		List<IndustryVo> ind_mList = new ArrayList<IndustryVo>();
		ind_mList = industryService.getIndustryM(l_code);
		mav.addObject("ind_mList", ind_mList);
		return mav;
	}
	
	//소분류 리스트 가져오기
	@RequestMapping(value="/sList", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView Slist(@RequestBody String m_code){
		ModelAndView mav = new ModelAndView("jsonView");
		List<IndustryVo> ind_sList = new ArrayList<IndustryVo>();
		ind_sList = industryService.getIndustryS(m_code);
		mav.addObject("ind_sList", ind_sList);
		return mav;
	}
	
	///이메일 인증번호
	@RequestMapping(value="/emailAuth", method=RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> emailAuth(@RequestBody String email, HttpServletResponse response, HttpServletRequest request) throws Exception{
		
		emailKind = "emailAuth";
		
		String authNum = "";
		authNum = RandomNum();

		sendEmail(email, authNum);
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		map.put("mem_email", email);
		map.put("authNum", authNum);
		return map;
	}
	
	

	//인증번호 발생 메소드
	private String RandomNum() {
		StringBuffer buffer = new StringBuffer();
		for(int i=0; i<=6; i++){
			int n = (int)(Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();
	}

	/*아이디 또는 비밀번호 찾기*/
	
	//아이디 찾기 화면
	@RequestMapping("/findId")
	public String findId(){
		return "findId";
	}
	
	
	//비밀번호 찾기 화면
	@RequestMapping("/findPw")
	public String findPw(){
		return "findPw";
	}
	
	@RequestMapping(value="/findIdProcess")
	@ResponseBody
	public Map<Object, Object> findIdProcess (@RequestParam(value="email") String email, @RequestParam(value="name") String name) throws Exception{
		
		emailKind = "emailFindId";
		
		name = new String(name.getBytes("8859_1"), "UTF-8");
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		MemberVo memberVo = memberService.findId(email);
		
		if(memberVo==null){
			map.put("error", email);
			return map;
		}

		String mem_id = memberVo.getMem_id();
		String mem_name = memberVo.getMem_name();
		String mem_email = memberVo.getMem_email();
		map.put("mem_id", mem_id);
		map.put("mem_name", mem_name);
		map.put("mem_email", mem_email);
		
		if(name.equals(mem_name)){
			sendEmail(email, mem_id);
		}
		return map;
		
	}
	
	//비밀번호 찾기 프로세스
	@RequestMapping(value="/findPwProcess")
	@ResponseBody
	public Map<Object, Object> findPwProcess (@RequestParam(value="email") String email,
											  @RequestParam(value="id")String id) throws Exception{
		
		emailKind = "emailFindPw";
		
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		MemberVo memberVo = memberService.getOneMember(id);
		
		if(memberVo==null){
			map.put("error", id);
			return map;
		}

		String mem_id = memberVo.getMem_id();
		String mem_pass = KISA_SEED_CBC.Decrypt(memberVo.getMem_pass());
		String mem_email = memberVo.getMem_email();
		
		map.put("mem_id", mem_id);
		map.put("mem_pass", mem_pass);
		map.put("mem_email", mem_email);
		
		if(email.equals(mem_email)){
			sendEmail(email, mem_pass);
		}
		return map;
		
	}
	
	/*회원관리*/
	
	
	@RequestMapping(value="/memberList")
	public String memList(@RequestParam(value="page",defaultValue="1") int page,
						  @RequestParam(value="pageSize", defaultValue="10") int pageSize,
						  Model model){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("page", page);
		paramMap.put("pageSize", pageSize);
		
		Map<String, Object> resultMap = memberService.getMemberPageList(paramMap);
		List<MemberVo> memberList = (List<MemberVo>) resultMap.get("pageList");
		model.addAttribute("memberList", memberList);
		model.addAllAttributes(resultMap);
		
		return "memberList";
	}
	
	
	@RequestMapping(value="/memberDel")
	public String memDel(@RequestParam(value="id")String id,
						Model model){
		
		MemberVo memVo = memberService.getOneMember(id);
		memVo.setMem_del('n');
		memberService.updateMem(memVo);
		model.addAttribute("memberList", memVo);
		
		
		
		return "redirect:/member/memberList";
	}
	
	//메일 전송하는 메서드
	private void sendEmail(String email, String param) throws Exception {
		
		//메일 관련 정보
		String host = "smtp.naver.com";
		final String username = "cxzhappy";
		final String password = "tkdnsk1908!";
		String from = "cxzhappy@naver.com";
		int port = 465;
		
		String fromName = "관리자";
		String to1 = email;
		
		Properties props = System.getProperties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			String un=username;
			String pw=password;
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(un, pw);
			}
		});

		session.setDebug(true); //for debug
		
		Message mimeMessage = new MimeMessage(session);
		mimeMessage.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName,"UTF-8","B")));
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(to1));
		
		
		if(emailKind == "emailAuth"){
	
			String subject = "[대전 스마트 상권분석] 인증번호 전달";
			String content = "인증번호는[ "+param+" ] 입니다";
			mimeMessage.setSubject(subject);
			mimeMessage.setText(content);
		}
		
		if(emailKind == "emailFindId"){
			
			String subject = "[대전 스마트 상권분석] 아이디를 발송합니다";
			String content = " 아이디는[ "+param+" ] 입니다";
			mimeMessage.setSubject(subject);
			mimeMessage.setText(content);
		}
		
		if(emailKind =="emailFindPw"){
			
			String subject = "[대전 스마트 상권분석] 비밀번호를 발송합니다";
			String content = "비밀번호는[ "+param+" ] 입니다";
			mimeMessage.setSubject(subject);
			mimeMessage.setText(content);			
			
		}
		Transport.send(mimeMessage);
	}
	
}
