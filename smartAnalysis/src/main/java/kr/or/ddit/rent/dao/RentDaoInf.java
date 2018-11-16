package kr.or.ddit.rent.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.rent.model.RentVo;

public interface RentDaoInf {
	
	/**
	 * 
	 * Method : getRent
	 * 최초작성일 : 2018. 9. 18.
	 * 작성자 : PC23
	 * 변경이력 :
	 * @param map
	 * @return
	 * Method 설명 : 구 코드로 임대료 전체 자료 가져오기.
	 */
	public List<RentVo> getRent(int reg_gucode);
	
	public List<RentVo> getRentDt(int reg_gucode);
	/**
	 * 
	 * Method : getRentStairs
	 * 최초작성일 : 2018. 9. 19.
	 * 작성자 : PC23
	 * 변경이력 :
	 * @param map 
	 * @return
	 * Method 설명 : 층별로 리스트를 뽑기 위한 메서드
	 */
	List<RentVo> getRentStairs(Map<String,Object> map);
	
	/**
	 * 
	 * Method : getRentDateList
	 * 최초작성일 : 2018. 9. 19.
	 * 작성자 : PC23
	 * 변경이력 :
	 * @param reg_gucode
	 * @return
	 * Method 설명 : 임대료 자료 날짜 리스트 가져오기 위한 메서드
	 */
	List<RentVo> getRentDateList(int reg_gucode);
	
}
