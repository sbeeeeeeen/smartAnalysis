package kr.or.ddit.post.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.post.model.PostVo;

public interface PostDaoInf {
	/**
	* Method : postList
	* 최초작성일 : 2018. 8. 30.
	* 작성자 : PC09
	* 변경이력 :
	* @return
	* Method 설명 : 공지사항 게시글 리스트 조회
	*/
	List<PostVo> postList(int board_num);
	
	/**
	* Method : postCount
	* 최초작성일 : 2018. 8. 30.
	* 작성자 : PC09
	* 변경이력 :
	* @return
	* Method 설명 : 전체 게시글 개수
	*/
	int postCount(int board_num);
	
	/**
	* Method : postPageList
	* 최초작성일 : 2018. 8. 30.
	* 작성자 : PC09
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 게시글 페이지 리스트 조회
	*/
	List<PostVo> postPageList(Map<String, Object> map);
	
	/**
	* Method : searchPost
	* 최초작성일 : 2018. 9. 12.
	* 작성자 : PC09
	* 변경이력 :
	* @param postVo
	* @return
	* Method 설명 : 게시글 조회
	*/
	List<PostVo> searchPost(PostVo postVo);
	
	/**
	* Method : numPost
	* 최초작성일 : 2018. 9. 4.
	* 작성자 : PC09
	* 변경이력 :
	* @param post_num
	* @return
	* Method 설명 : 게시글 번호로 게시글 조회
	*/
	PostVo numPost(int post_num);
	
	/**
	* Method : insertOpinion
	* 최초작성일 : 2018. 9. 5.
	* 작성자 : PC09
	* 변경이력 :
	* @param postVo
	* @return
	* Method 설명 : 개선의견 발송(성공하면 1, 실패하면 0)
	*/
	int insertOpinion(PostVo postVo);
	
	
	/**
	* Method : postsearchCount
	* 최초작성일 : 2018. 9. 13.
	* 작성자 : user
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 검색된 게시글의 수
	*/
	int postsearchCount(Map<String, Object> map);
	
	/**
	* Method : insertPost
	* 최초작성일 : 2018. 10. 5.
	* 작성자 : PC09
	* 변경이력 :
	* @param postVo
	* @return
	* Method 설명 : 공지사항 새글쓰기(관리자)
	*/
	int insertPost(PostVo postVo);
	
	/**
	* Method : deletePost
	* 최초작성일 : 2018. 10. 5.
	* 작성자 : PC09
	* 변경이력 :
	* @param post_num
	* @return
	* Method 설명 : 공지사항 글삭제(관리자)
	*/
	int deletePost(int post_num);
	
	/**
	* Method : searchCopartnership
	* 최초작성일 : 2018. 10. 5.
	* 작성자 : user
	* 변경이력 :
	* @param post_num
	* @return
	* Method 설명 : 게시글로 협동조합 조회
	*/
	int searchCopartnership(int post_num);
	
	/**
	* Method : getboardNum
	* 최초작성일 : 2018. 10. 8.
	* 작성자 : user
	* 변경이력 :
	* @param cship_num
	* @return
	* Method 설명 : 협동조합 번호로 게시판 조회
	*/
	int getboardNum(int cship_num);
}
