package kr.or.ddit.utilization.service;

import java.util.List;

import kr.or.ddit.utilization.model.UtilizationVo;

public interface UtilizationServiceInf {
	
	/**
	 * 
	 * Method : getUtil
	 * 최초작성일 : 2018. 9. 3.
	 * 작성자 : PC23
	 * 변경이력 :
	 * @return
	 * Method 설명 : 상반기 지역현황
	 */
	List<UtilizationVo> getUtilSang(long reg_code);

	/**
	 * 
	 * Method : getUtilHa
	 * 최초작성일 : 2018. 9. 4.
	 * 작성자 : PC23
	 * 변경이력 :
	 * @param reg_code
	 * @return
	 * Method 설명 : 하반기 지역현황
	 */
	List<UtilizationVo> getUtilHa(long reg_code);
	
	/**
	 * 
	 * Method : getUpzongSang
	 * 최초작성일 : 2018. 9. 6.
	 * 작성자 : PC23
	 * 변경이력 :
	 * @param ind_code
	 * @return
	 * Method 설명 : 상반기 업종현황
	 */
	List<UtilizationVo> getUpzongSang(String ind_code);
	
	/**
	 * 
	 * Method : getUpzongHa
	 * 최초작성일 : 2018. 9. 6.
	 * 작성자 : PC23
	 * 변경이력 :
	 * @param ind_code
	 * @return
	 * Method 설명 : 하반기 업종현황
	 */
	List<UtilizationVo> getUpzongHa(String ind_code);


}
