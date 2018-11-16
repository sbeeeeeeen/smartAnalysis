package kr.or.ddit.pro.dao;

import java.util.List;

import kr.or.ddit.pro.model.ProVo;

public interface ProDaoInf {
	/**
	* Method : proNumSelect
	* 최초작성일 : 2018. 9. 13.
	* 작성자 : PC09
	* 변경이력 :
	* @param pro_num
	* @return
	* Method 설명 : pro_num에 맞는 ProVo 조회
	*/
	ProVo proNumSelect(int pro_num);
	
	/**
	* Method : proList
	* 최초작성일 : 2018. 9. 13.
	* 작성자 : PC09
	* 변경이력 :
	* @return
	* Method 설명 : 전문가 리스트 조회
	*/
	List<ProVo> proList();
	
	/**
	* Method : proMember
	* 최초작성일 : 2018. 9. 27.
	* 작성자 : PC09
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 회원ID로 proVo조회
	*/
	ProVo proMember(String mem_id);
}
