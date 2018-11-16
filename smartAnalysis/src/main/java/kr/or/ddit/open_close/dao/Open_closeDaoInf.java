package kr.or.ddit.open_close.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.open_close.model.Open_closeVo;

public interface Open_closeDaoInf {
	/**
	 * Method : getOpenCloseList
	 * 최초작성일 : 2018. 9. 17.
	 * 작성자 : YSB
	 * 변경이력 :
	 * @param data
	 * @return
	 * Method 설명 : 해당 대분류 창폐업 리스트(구)
	 */
	List<Open_closeVo> getOpenCloseGuList(Map<String, Object> data);
	
	/**
	 * Method : getOpenCloseSiList
	 * 최초작성일 : 2018. 9. 17.
	 * 작성자 : YSB
	 * 변경이력 :
	 * @param data
	 * @return
	 * Method 설명 : 해당 대분류 창폐업 리스트(시)
	 */
	List<Open_closeVo> getOpenCloseSiList(Map<String, Object> data);
}
