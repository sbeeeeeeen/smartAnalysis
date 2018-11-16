package kr.or.ddit.analysis_res.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.analysis_res.model.AnalysisCodeVo;
import kr.or.ddit.analysis_res.model.AnalysisRecVo;
import kr.or.ddit.analysis_res.model.AnalysisResVo;
import kr.or.ddit.analysis_res.model.AnalysisTableVo;

public interface AnalysisResDaoInf {
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
	 * @param acVo
	 * @return
	 * Method 설명 : insert 지역/업종 카운트 +1하고 지역코드 가져옴
	 */
	long insertAnalysisCode(Map<String, Object> data);
	
	/**
	 * Method : getAnalysisRec
	 * 최초작성일 : 2018. 9. 10.
	 * 작성자 : YSB
	 * 변경이력 :
	 * @param an_num
	 * @return
	 * Method 설명 : analysisresVo 가져오기
	 */
	AnalysisResVo getAnalysisRes(int an_num);
	
	/**
	 * Method : getAnalysisRec
	 * 최초작성일 : 2018. 9. 10.
	 * 작성자 : YSB
	 * 변경이력 :
	 * @param an_num
	 * @return
	 * Method 설명 : analysisrecVo 가져오기
	 */
	List<AnalysisRecVo> getAnalysisRec(int an_num);
	
	/**
	 * Method : getAnalysisTable
	 * 최초작성일 : 2018. 9. 10.
	 * 작성자 : YSB
	 * 변경이력 :
	 * @param an_num
	 * @return
	 * Method 설명 : anlaysiscodeVo list 가져오기
	 */
	List<AnalysisCodeVo> getAnalysisCode(int an_num);
	
	/**
	 * Method : getAnalysisResList
	 * 최초작성일 : 2018. 9. 11.
	 * 작성자 : YSB
	 * 변경이력 :
	 * @param data
	 * @return
	 * Method 설명 : 리스트 가져왕
	 */
	List<AnalysisTableVo> getAnalysisResList(Map<String, Object> data);
	
	/**
	 * Method : getAnalysisResCount
	 * 최초작성일 : 2018. 9. 11.
	 * 작성자 : YSB
	 * 변경이력 :
	 * @param mem_id
	 * @return
	 * Method 설명 : 분석이력 개수
	 */
	int getAnalysisResCount(Map<String, Object> map);
	
}
