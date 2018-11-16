package kr.or.ddit.post.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.post.dao.PostDaoInf;
import kr.or.ddit.post.model.PostVo;

@Service(value="postService")
public class PostService implements PostServiceInf {

	@Resource(name="postDao")
	private PostDaoInf postDao;

	/**
	 * Method : postList
	 * 최초작성일 : 2018. 8. 30.
	 * 작성자 : PC09
	 * 변경이력 :
	 * @param board_num
	 * @return
	 * Method 설명 : 공지사항 게시글 리스트 조회
	 */
	@Override
	public List<PostVo> postList(int board_num) {
		return postDao.postList(board_num);
	}

	/**
	 * Method : postCount
	 * 최초작성일 : 2018. 8. 30.
	 * 작성자 : PC09
	 * 변경이력 :
	 * @return
	 * Method 설명 : 게시판 번호에 맞는 게시글 개수 조회
	 */
	@Override
	public int postCount(int board_num) {
		return postDao.postCount(board_num);
	}

	@Override
	public Map<String, Object> postPageList(Map<String, Object> map) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<PostVo> pageList = postDao.postPageList(map);
		resultMap.put("pageList", pageList);

		int board_num = (int) map.get("board_num");
		
		int totCnt = postDao.postCount(board_num);
		resultMap.put("totCnt", totCnt);

		int page = (int) map.get("page");
		int pageSize = (int) map.get("pageSize");
		String search = (String) map.get("search");

		resultMap.put("pageNavi", makePageNavi(page, pageSize,board_num, search, totCnt));

		return resultMap;
	}

	private String makePageNavi(int page, int pageSize,int board_num, String search, int totCnt){
		int cnt = totCnt/pageSize;
		int mod = totCnt%pageSize;

		if(mod>0){
			cnt++;
		}
		StringBuffer pageNaviStr = new StringBuffer();

		int prevPage = page ==1 ? 1: page-1;
		int nextPage = page == cnt ? page: page+1;

		pageNaviStr.append("<li><a href=\"/post/list?"
				+ "page="
				+ prevPage
				+ "&pageSize="
				+ pageSize
				+"&board_num="
				+board_num
				+"&search="
				+search
				+ "\" aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span></a></li>");

		for(int i = 1; i<=cnt; i++){
			String activeClass = "";
			if(i==page){
				activeClass = "class=\"active\"";
			}
			pageNaviStr.append("<li " + activeClass
					+ "><a href=\"/post/list?page=" + i + "&pageSize="
					+ pageSize +"&board_num="+board_num+"&search="+search +"\">" + i + "</a></li>");

		}
		pageNaviStr.append("<li><a href=\"/post/list?"
				+ "page="
				+ nextPage
				+ "&pageSize="
				+ pageSize
				+"&board_num="
				+ board_num
				+"&search="
				+search
				+ "\" aria-label=\"Next\"><span aria-hidden=\"true\">&raquo;</span></a></li>");

		return pageNaviStr.toString();
	}

	/**
	* Method : searchPost
	* 최초작성일 : 2018. 9. 3.
	* 작성자 : PC09
	* 변경이력 :
	* @param post_title
	* @return
	* Method 설명 : 검색 결과 조회
	*/
	@Override
	public List<PostVo> searchPost(PostVo postVo) {
		return postDao.searchPost(postVo);
	}

	/**
	* Method : numPost
	* 최초작성일 : 2018. 9. 4.
	* 작성자 : PC09
	* 변경이력 :
	* @param post_num
	* @return
	* Method 설명 : 게시글 번호로 게시글 조회
	*/
	@Override
	public PostVo numPost(int post_num) {
		return postDao.numPost(post_num);
	}

	/**
	* Method : insertOpinion
	* 최초작성일 : 2018. 9. 5.
	* 작성자 : PC09
	* 변경이력 :
	* @param postVo
	* @return
	* Method 설명 : 개선의견 발송(성공하면 1, 실패하면 0)
	*/
	@Override
	public int insertOpinion(PostVo postVo) {
		return postDao.insertOpinion(postVo);
	}
	
	
	@Override
	public Map<String, Object> postPageListajax(Map<String, Object> map) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		List<PostVo> pageList = postDao.postPageList(map);
		resultMap.put("pageList", pageList);
		int board_num = (int) map.get("board_num");
		
		int totCnt = postDao.postsearchCount(map);	//이것도 구분해야되는데....ㅓㅏ
		resultMap.put("totCnt", totCnt);
		
		int page = (int) map.get("page");
		int pageSize = (int) map.get("pageSize");
		String search = (String) map.get("search");
		
		resultMap.put("pageNavi", makePageNaviajax(page, pageSize,board_num, totCnt, search));
		
		return resultMap;
	}

	private String makePageNaviajax(int page, int pageSize,int board_num, int totCnt, String search){
		int cnt = totCnt / pageSize;
		int mod = totCnt % pageSize;
		
		if(mod > 0)
			cnt++;
		
		StringBuffer pageNaviStr = new StringBuffer();
		int prevPage = page == 1 ? 1 : page-1;
		int nextPage = page == cnt ? page : page + 1;
		
		pageNaviStr.append("<li><a href=\"javascript:void(0)\" class=\"postPageNavi\" data-page=\""+prevPage+"\" data-pageSize=\""+pageSize+"\" data-search=\""+search + "\" data-board_num=\""+board_num+"\" aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span></a></li>");
		
		for(int i = 1; i <=cnt; i++){
			String activeClass = "";
			if(i==page)
				activeClass = "class=\"active\"";
			
			pageNaviStr.append("<li "+activeClass + "><a href=\"javascript:void(0)\" class=\"postPageNavi\" data-page=\""+i+"\" data-pageSize=\""+pageSize+"\" data-search=\""+search+"\" data-board_num=\""+board_num+"\">"+i+"</a></li>");
		}
		
		pageNaviStr.append("<li><a href=\"javascript:void(0)\" class=\"postPageNavi\" data-page=\""+nextPage+"\" data-pageSize=\""+pageSize+"\" data-search=\""+search + "\" data-board_num=\""+board_num+"\" aria-label=\"Next\"><span aria-hidden=\"true\">&raquo;</span></a></li>");
		
		return pageNaviStr.toString();
	}

	@Override
	public int searchCopartnership(int post_num) {
		return postDao.searchCopartnership(post_num);
	}

	@Override
	public int getboardNum(int cship_num) {
		return postDao.getboardNum(cship_num);
	}
	
	/**
	* Method : insertPost
	* 최초작성일 : 2018. 10. 5.
	* 작성자 : PC09
	* 변경이력 :
	* @param postVo
	* @return
	* Method 설명 : 공지사항 새글쓰기(관리자)
	*/
	@Override
	public int insertPost(PostVo postVo) {
		return postDao.insertPost(postVo);
	}

	/**
	* Method : deletePost
	* 최초작성일 : 2018. 10. 5.
	* 작성자 : PC09
	* 변경이력 :
	* @param post_num
	* @return
	* Method 설명 : 공지사항 글삭제(관리자)
	*/
	@Override
	public int deletePost(int post_num) {
		return postDao.deletePost(post_num);
	}
}