package kr.or.ddit.post.web;



import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import kr.or.ddit.board.model.BoardVo;
import kr.or.ddit.board.service.BoardServiceInf;
import kr.or.ddit.cooperative.service.CooperativeServiceInf;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.post.model.PostVo;
import kr.or.ddit.post.service.PostServiceInf;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping(value="/post")
@Controller(value="postController")
public class PostController {
	
	private Logger logger = LoggerFactory.getLogger(PostController.class);
	
	@Resource(name="postService")
	private PostServiceInf postService;
	
	@Resource(name="boardService")
	private BoardServiceInf boardService;
	
	@Resource(name="cooperativeService")
	private CooperativeServiceInf cooperativeService;
	
	@RequestMapping(value="/list")
	public String postList(
							@RequestParam(value="page",defaultValue="1")int page
							,@RequestParam(value="pageSize",defaultValue="10")int pageSize
							,@RequestParam(value="board_num")int board_num
							,@RequestParam(value="search", defaultValue="")String search
							,Model model
						){	
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("page", page);
		paramMap.put("pageSize", pageSize);
		paramMap.put("board_num", board_num);
		paramMap.put("search", search);
		
		Map<String, Object> resultMap = postService.postPageList(paramMap);
		List<PostVo> postList = (List<PostVo>) resultMap.get("pageList");
		model.addAttribute("postList",postList);
		
		model.addAllAttributes(resultMap);
		model.addAttribute("board_num", board_num);
		return "noticeBoard";
	}
	
	@RequestMapping(value="/change")
	@ResponseBody
	public Map<String, Object> changePostList(
										@RequestParam(value="changeSize")int changeSize
										,@RequestParam(value="board_num")int board_num
										,@RequestParam(value="search",defaultValue="")String search
									){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("page", 1);
		paramMap.put("pageSize", changeSize);
		paramMap.put("board_num", board_num);
		paramMap.put("search", search);
		Map<String, Object> resultMap = postService.postPageList(paramMap);
		
		
		return resultMap;
	}
	
	@RequestMapping(value="/searchPost")
	@ResponseBody
	public List<PostVo> searchPost(
									@RequestParam(value="search")String post_title
									,@RequestParam(value="board_num")int board_num
									,PostVo postVo
			) throws UnsupportedEncodingException{
		post_title = URLDecoder.decode(post_title, "UTF-8");
		
		postVo.setPost_title(post_title);
		postVo.setBoard_num(board_num);
		List<PostVo> searchPost = postService.searchPost(postVo);
		
		return searchPost;
	}
	
	@RequestMapping(value="/detail")
	public String detailPost(
								@RequestParam(value="id")int post_num
								,Model model
							){
		PostVo postVo = postService.numPost(post_num);
		model.addAttribute("postVo", postVo);
		
		return "detailPost";
	}
	
	@RequestMapping(value="/copartnershipPostdetail")
	public String copartnershipPostdetail(
			@RequestParam(value="id")int post_num
			,Model model,
			HttpSession session
			){
		PostVo postVo = postService.numPost(post_num);
		BoardVo boardVo = boardService.getBoard(postVo.getBoard_num());
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("mem_id", ((MemberVo)session.getAttribute("memberVo")).getMem_id());
		data.put("cship_num", boardVo.getCship_num());
		model.addAttribute("cooperative", cooperativeService.getCooperativeVo(data));
		model.addAttribute("postVo", postVo);
		
		return "copartnershipPostdetail";
	}
	
	@RequestMapping(value="/opinion")
	public String opinionPost(){
		return "board/opinionPost";
	}
	
	@RequestMapping(value="/insertpost")
	public String insertpost(@RequestParam(value="board_num")int id,
							 Model model){
		int board_num = boardService.getBoardnum(id);
		model.addAttribute("board_num", board_num);
		return "board/insertpost";
	}
	
	@RequestMapping(value="/opinionSubmit")
	@ResponseBody
	public void opinionSubmit(
								@RequestParam(value="opinioncontent")String post_content
								,@RequestParam(value="opinionTitle")String post_title
								,@RequestParam(value="opinionBoard_num")int board_num
								,HttpSession session
							) throws UnsupportedEncodingException{
		post_content = URLDecoder.decode(post_content, "UTF-8");
		post_title = URLDecoder.decode(post_title, "UTF-8");
		
		PostVo postVo = new PostVo();
		postVo.setMem_id(((MemberVo)session.getAttribute("memberVo")).getMem_id());
		postVo.setBoard_num(board_num);
		postVo.setPost_content(post_content);
		postVo.setPost_title(post_title);
		
		postService.insertOpinion(postVo);
	}
	
	@RequestMapping(value="/newPost")
	public String newPost(){
		return "newPost";
	}
	
	@RequestMapping(value="/newPostSubmit")
	public String newPostSubmit(@RequestParam(value="title")String title
								,@RequestParam(value="content")String content
								,HttpSession session
								){
		MemberVo memberVo = (MemberVo) session.getAttribute("memberVo");
		PostVo postVo = new PostVo();
		
		postVo.setBoard_num(1);
		postVo.setMem_id(memberVo.getMem_id());
		postVo.setPost_content(content);
		postVo.setPost_title(title);
		
		postService.insertPost(postVo);
		return "redirect:/post/list?board_num=1";
	}
	
	@RequestMapping(value="/deletePost")
	public String deletePost(@RequestParam(value="post_num")int post_num){
		
		postService.deletePost(post_num);
		
		return "redirect:/post/list?board_num=1";
	}
	
	@RequestMapping(value="/opinionList")
	public String opinionList(
								@RequestParam(value="page",defaultValue="1")int page
								,@RequestParam(value="pageSize",defaultValue="10")int pageSize
								,@RequestParam(value="board_num")int board_num
								,Model model
							){
		return "opinionList";
	}
	
	@RequestMapping("/delete")
	public ModelAndView delete(@RequestParam("post_num")String post_num){
		
		int num = Integer.parseInt(post_num);
		ModelAndView mav = new ModelAndView("jsonView");
		
		postService.deletePost(num);
		int cship_num = postService.searchCopartnership(num);
		mav.addObject("cship_num", cship_num);
		
		return mav;
	}
}