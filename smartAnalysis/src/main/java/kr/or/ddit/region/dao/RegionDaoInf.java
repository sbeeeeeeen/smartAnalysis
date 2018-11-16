package kr.or.ddit.region.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.industry.model.IndustryVo;
import kr.or.ddit.region.model.RegionVo;

public interface RegionDaoInf {
	List<Map<String, Object>> searchRegion(String reg);
	/**
	 * 
	 * Method : getRegionVo
	 * 최초작성일 : 2018. 8. 31.
	 * 작성자 : PC23
	 * 변경이력 :
	 * @param reg_code
	 * @return
	 * Method 설명 : 지역구로 정보 가져오기
	 */
	List<RegionVo> getRegionVo(int reg_gu);
	
	List<RegionVo> getReg_gu();
	
	/**
	 * Method : getRegion
	 * 최초작성일 : 2018. 9. 14.
	 * 작성자 : YSB
	 * 변경이력 :
	 * @param reg_code
	 * @return
	 * Method 설명 : 코드 해당하는 regionvo 가져오기
	 */
	RegionVo getRegion(long reg_code);
	
	/**
	 * 
	 * Method : getRegGuCode
	 * 최초작성일 : 2018. 9. 18.
	 * 작성자 : PC23
	 * 변경이력 :
	 * @param reg_code
	 * @return
	 * Method 설명 : 동 코드로 구 코드 가져오기
	 */
	int getRegGuCode(long reg_code);
	
	/**
	 * 
	* Method : getRegCode
	* 최초작성일 : 2018. 10. 1.
	* 작성자 : PC20
	* 변경이력 :
	* @param reg_dong
	* @return
	* Method 설명 : 동 이름으로 주소 코드 찾는 메서드
	 */
	long getRegCode(String reg_dong);
}
