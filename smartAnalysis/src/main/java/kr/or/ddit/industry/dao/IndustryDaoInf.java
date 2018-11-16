package kr.or.ddit.industry.dao;

import java.util.List;

import kr.or.ddit.industry.model.IndustryVo;

public interface IndustryDaoInf {
	
	/**
	* Method : getInd_L
	* 최초작성일 : 2018. 9. 3.
	* 작성자 : user
	* 변경이력 :
	* @return
	* Method 설명 : 업종 대분류 조회
	*/
	List<IndustryVo> getInd_L();
	
	/**
	 * Method : getIndustryM
	 * 최초작성일 : 2018. 9. 10.
	 * 작성자 : YSB
	 * 변경이력 :
	 * @param lcode
	 * @return
	 * Method 설명 : 대분류 코드 해당 중분류 리스트 
	 */
	List<IndustryVo> getIndustryM(String lcode);
	
	/**
	 * Method : getIndustryS
	 * 최초작성일 : 2018. 9. 10.
	 * 작성자 : YSB
	 * 변경이력 :
	 * @param mcode
	 * @return
	 * Method 설명 : 중분류 코드 해당 소분류 리스트
	 */
	List<IndustryVo> getIndustryS(String mcode);
	
	/**
	 * Method : getIndustry
	 * 최초작성일 : 2018. 9. 10.
	 * 작성자 : YSB
	 * 변경이력 :
	 * @param code
	 * @return
	 * Method 설명 : 소분류 코드에 해당하는 업종 정보 리스트 가져오기
	 */
	List<IndustryVo> getIndustryList(List<String> code);
	
	/**
	 * Method : getIndustryVo
	 * 최초작성일 : 2018. 9. 10.
	 * 작성자 : YSB
	 * 변경이력 :
	 * @param ind_code
	 * @return
	 * Method 설명 : 코드에 해당하는 industryvo 가져오기
	 */
	IndustryVo getIndustryVo(String ind_code);
}
