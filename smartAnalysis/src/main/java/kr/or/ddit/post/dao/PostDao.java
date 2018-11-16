package kr.or.ddit.post.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.post.model.PostVo;

@Repository(value = "postDao")
public class PostDao implements PostDaoInf {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate template;

	/**
	 * Method : postList 최초작성일 : 2018. 8. 30. 작성자 : PC09 변경이력 :
	 * 
	 * @return Method 설명 : 삭제여부='n'인 공지사항 게시글 조회
	 */
	@Override
	public List<PostVo> postList(int board_num) {
		return template.selectList("post.AllSelect", board_num);
	}

	/**
	 * Method : postCount 최초작성일 : 2018. 8. 30. 작성자 : PC09 변경이력 :
	 * 
	 * @return Method 설명 : 공지사항 게시글 개수 조회
	 */
	@Override
	public int postCount(int board_num) {
		return template.selectOne("post.postCount", board_num);
	}

	/**
	 * Method : postPageList 최초작성일 : 2018. 8. 30. 작성자 : PC09 변경이력 :
	 * 
	 * @param map
	 * @return Method 설명 : 공지사항 게시글 페이지 리스트 조회
	 */
	@Override
	public List<PostVo> postPageList(Map<String, Object> map) {
		return template.selectList("post.postPageList", map);
	}

	/**
	 * Method : searchPost 최초작성일 : 2018. 9. 3. 작성자 : PC09 변경이력 :
	 * 
	 * @param post_title
	 * @return Method 설명 : 검색 결과 조회
	 */
	@Override
	public List<PostVo> searchPost(PostVo postVo) {
		return template.selectList("post.searchPost", postVo);
	}

	/**
	 * Method : numPost 최초작성일 : 2018. 9. 4. 작성자 : PC09 변경이력 :
	 * 
	 * @param post_num
	 * @return Method 설명 : 게시글 번호로 게시글 조회
	 */
	@Override
	public PostVo numPost(int post_num) {
		return template.selectOne("post.numPost", post_num);
	}

	/**
	 * Method : insertOpinion 최초작성일 : 2018. 9. 5. 작성자 : PC09 변경이력 :
	 * 
	 * @param postVo
	 * @return Method 설명 : 개선의견 발송(성공하면 1, 실패하면 0)
	 */
	@Override
	public int insertOpinion(PostVo postVo) {
		return template.insert("post.insertOpinion", postVo);
	}

	@Override
	public int postsearchCount(Map<String, Object> map) {
		return template.selectOne("post.postsearchCount", map);
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
		return template.insert("post.insertPost", postVo);
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
		return template.update("post.deletePost", post_num);
	}

	@Override
	public int searchCopartnership(int post_num) {
		return template.selectOne("post.searchCopartnership", post_num);
	}

	@Override
	public int getboardNum(int cship_num) {
		return template.selectOne("post.getboardNum", cship_num);
	}
}
