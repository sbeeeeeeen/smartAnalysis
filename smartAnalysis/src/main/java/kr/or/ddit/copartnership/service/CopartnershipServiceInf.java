package kr.or.ddit.copartnership.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.copartnership.model.CopartnershipVo;

public interface CopartnershipServiceInf {

	/**
	* Method : allCopartnership
	* 최초작성일 : 2018. 8. 30.
	* 작성자 : LJH
	* 변경이력 :
	* @return
	* Method 설명 : 협동조합 리스트
	*/
	List<CopartnershipVo> allCopartnership();
	
	/**
	* Method : selectCopartnership
	* 최초작성일 : 2018. 8. 31.
	* 작성자 : LJH
	* 변경이력 :
	* @return
	* Method 설명 : 협동조합 리스트 조회
	*/
	List<CopartnershipVo> selectCopartnership(String search);
	
	/**
	* Method : getCopartnershipPageList
	* 최초작성일 : 2018. 9. 3.
	* 작성자 : user
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 협동조합 페이지 리스트 조회
	*/
	Map<String, Object> getCopartnershipPageList(Map<String, Object> map);

	/**
	* Method : getOneCopartnership
	* 최초작성일 : 2018. 9. 3.
	* 작성자 : user
	* 변경이력 :
	* @param id
	* @return
	* Method 설명 : 협동조합 번호로 조회
	*/
	CopartnershipVo getOneCopartnership(int id);

	/**
	* Method : insertCopartnership
	* 최초작성일 : 2018. 9. 14.
	* 작성자 : user
	* 변경이력 :
	* @param copartnershipVo
	* Method 설명 : 협동조합 생성
	*/
	int insertCopartnership(CopartnershipVo copartnershipVo);
	
	/**
	* Method : getJoinCopartnershipList
	* 최초작성일 : 2018. 9. 14.
	* 작성자 : user
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 회원이 가입한 협동조합 리스트 가져오기
	*/
	List<CopartnershipVo> getJoinCopartnershipList(String mem_id);
}