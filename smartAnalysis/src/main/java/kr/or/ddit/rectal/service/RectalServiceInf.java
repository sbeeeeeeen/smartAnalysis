package kr.or.ddit.rectal.service;

import kr.or.ddit.rectal.model.RectalVo;

public interface RectalServiceInf {
	/**
	 * Method : getRectalVo
	 * 최초작성일 : 2018. 9. 14.
	 * 작성자 : YSB
	 * 변경이력 :
	 * @param reg_code
	 * @return
	 * Method 설명 : 지역코드 해당 직장인구 가져오기
	 */
	RectalVo getRectalVo(long reg_code);
}
