package kr.or.ddit.residential.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.residential.model.ResidentialVo;

public interface ResidentialDaoInf {
	/**
	 * Method : getResidentialVo
	 * 최초작성일 : 2018. 9. 14.
	 * 작성자 : YSB
	 * 변경이력 :
	 * @param reg_code
	 * @return
	 * Method 설명 : 주거인구 가져오기
	 */
	ResidentialVo getResidentialVo(long reg_code);
	
	/**
	 * 
	 * Method : getResidential
	 * 최초작성일 : 2018. 9. 15.
	 * 작성자 : PC23
	 * 변경이력 :
	 * @param map
	 * @return
	 * Method 설명 : 키 reg_code, rst_div로 주거인구 정보 가져오는 메서드
	 */
	List<ResidentialVo> getResidential(Map<String, Object> map);
	
	List<ResidentialVo> getResidentialAgeList(long reg_code);
	
	int getMaxAge(long reg_code);
	int getMaxDiv(long reg_code);
	
}
