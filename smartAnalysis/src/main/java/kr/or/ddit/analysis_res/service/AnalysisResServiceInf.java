package kr.or.ddit.analysis_res.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.analysis_res.model.AnalysisCodeVo;
import kr.or.ddit.analysis_res.model.AnalysisRecVo;
import kr.or.ddit.analysis_res.model.AnalysisResVo;

public interface AnalysisResServiceInf {
	/**
	 * Method : insertAnalysisRes
	 * 최초작성일 : 2018. 9. 10.
	 * 작성자 : YSB
	 * 변경이력 :
	 * @param arVo
	 * @return
	 * Method 설명 : insert
	 */
	int insertAnalysisRes(AnalysisResVo anVo);
	
	/**
	 * Method : insertAnalysisRec
	 * 최초작성일 : 2018. 9. 10.
	 * 작성자 : YSB
	 * 변경이력 :
	 * @param arVo
	 * @return
	 * Method 설명 : insert
	 */
	int insertAnalysisRec(AnalysisRecVo arVo);
	
	/**
	 * Method : insertAnalysisCode
	 * 최초작성일 : 2018. 9. 10.
	 * 작성자 : YSB
	 * 변경이력 :
	 * @param data
	 * @return
	 * Method 설명 : insert 지역/업종 카운트 +1하고 지역코드 가져옴
	 */
	long insertAnalysisCode(Map<String, Object> data);
	
	/**
	 * Method : getAnalysisVos
	 * 최초작성일 : 2018. 9. 10.
	 * 작성자 : YSB
	 * 변경이력 :
	 * @param an_num
	 * @return
	 * Method 설명 : res 가져옴
	 */
	AnalysisResVo getAnalysisRes(int an_num);
	
	/**
	 * Method : getAnalysisRecList
	 * 최초작성일 : 2018. 9. 21.
	 * 작성자 : YSB
	 * 변경이력 :
	 * @param an_num
	 * @return
	 * Method 설명 : 
	 */
	List<AnalysisRecVo> getAnalysisRecList(int an_num);
	
	/**
	 * Method : getAnalysisCodeVo
	 * 최초작성일 : 2018. 9. 13.
	 * 작성자 : YSB
	 * 변경이력 :
	 * @param an_num
	 * @return
	 * Method 설명 : codeVo는 xml 파싱하는데 쓸거라서 따로
	 */
	List<AnalysisCodeVo> getAnalysisCodeVo(int an_num);
	
	/**
	 * Method : getAnalysisResList
	 * 최초작성일 : 2018. 9. 11.
	 * 작성자 : YSB
	 * 변경이력 :
	 * @param data
	 * @return
	 * Method 설명 : 리스트, 페이지네이션 가져오기
	 */
	Map<String, Object> getAnalysisResList(Map<String, Object> data);
	
}