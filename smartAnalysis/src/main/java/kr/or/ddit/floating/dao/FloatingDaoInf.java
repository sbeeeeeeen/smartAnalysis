package kr.or.ddit.floating.dao;

import kr.or.ddit.floating.model.FloatingVo;

public interface FloatingDaoInf {
	/**
	 * Method : getFloatingVo
	 * 최초작성일 : 2018. 9. 14.
	 * 작성자 : YSB
	 * 변경이력 :
	 * @param reg_code
	 * @return
	 * Method 설명 : 유동인구수 가져오기
	 */
	FloatingVo getFloatingVo(long reg_code);
}
