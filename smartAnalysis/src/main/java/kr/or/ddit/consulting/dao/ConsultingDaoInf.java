package kr.or.ddit.consulting.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.consulting.model.ConsultingVo;

public interface ConsultingDaoInf {
	/**
	* Method : insertConsulting
	* 최초작성일 : 2018. 9. 13.
	* 작성자 : PC09
	* 변경이력 :
	* @param consultingVo
	* @return
	* Method 설명 : 컨설팅 신청(성공하면 1, 실패하면 0)
	*/
	int insertConsulting(ConsultingVo consultingVo);
	
	/**
	* Method : cstNumConsulting
	* 최초작성일 : 2018. 9. 14.
	* 작성자 : PC09
	* 변경이력 :
	* @param cst_num
	* @return
	* Method 설명 : 일정 번호에 맞는 컨설팅 조회(컨설턴트)
	*/
	ConsultingVo cstNumConsulting(int cst_num);
	
	/**
	* Method : cstNumMemberConsulting
	* 최초작성일 : 2018. 9. 18.
	* 작성자 : PC09
	* 변경이력 :
	* @param cst_num
	* @return
	* Method 설명 : 일정 번호에 맞는 컨설팅 조회(회원)
	*/
	ConsultingVo cstNumMemberConsulting(int cst_num);
	
	/**
	* Method : consultingPageList
	* 최초작성일 : 2018. 9. 14.
	* 작성자 : PC09
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 컨설팅 페이징 처리(컨설턴트)
	*/
	List<ConsultingVo> consultingPageList(Map<String, Object> map);
	
	/**
	* Method : consultingmemberPageList
	* 최초작성일 : 2018. 9. 18.
	* 작성자 : PC09
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 :컨설팅 페이징 처리(회원)
	*/
	List<ConsultingVo> consultingMemberPageList(Map<String, Object> map);
	
	/**
	* Method : consultingCnt
	* 최초작성일 : 2018. 9. 14.
	* 작성자 : PC09
	* 변경이력 :
	* @param cst_aprv
	* @return
	* Method 설명 : 컨설팅 게시글 개수
	*/
	int consultingCnt();
	
	/**
	* Method : consultingYN
	* 최초작성일 : 2018. 9. 15.
	* 작성자 : PC09
	* 변경이력 :
	* @param cst_num
	* @return
	* Method 설명 : 컨설팅 승인 업데이트
	*/
	int consultingYN(int cst_num);
	
	/**
	* Method : consultingPayYN
	* 최초작성일 : 2018. 9. 20.
	* 작성자 : PC09
	* 변경이력 :
	* @param cst_num
	* @return
	* Method 설명 : 컨설팅 결제여부 업데이트
	*/
	int consultingPayYN(int cst_num);
	
	/**
	* Method : deleteConsulting
	* 최초작성일 : 2018. 9. 27.
	* 작성자 : PC09
	* 변경이력 :
	* @param cst_num
	* @return
	* Method 설명 : 컨설팅 삭제
	*/
	int deleteConsulting(int cst_num);
	
	/**
	* Method : updateChannelId
	* 최초작성일 : 2018. 10. 10.
	* 작성자 : PC09
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : Member에 채널 아이디 업데이트
	*/
	int updateChannelId(Map<String, String> map);
	
	/**
	 * 
	 * Method : getChannelId
	 * 최초작성일 : 2018. 10. 15.
	 * 작성자 : PC23
	 * 변경이력 :
	 * @return
	 * Method 설명 : 아이디에 맞는 채널 번호 가져오기
	 */
	String getChannelId(String mem_id);
}
