package kr.or.ddit.rating.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.rating.model.RatingGradeVo;

public interface RatingServiceInf {
	
	/**
	 * Method : getRatingLists
	 * 최초작성일 : 2018. 9. 12.
	 * 작성자 : YSB
	 * 변경이력 :
	 * @param int
	 * @return
	 * Method 설명 : 평가지수 행정동별(dongRatingList)/시군구별(guRatingList)/광역시도별(siRatingList) 리스트
	 */
	public Map<String, Object> getRatingLists(int an_num);
	
	/**
	 * Method : getRatingGrade
	 * 최초작성일 : 2018. 9. 19.
	 * 작성자 : YSB
	 * 변경이력 :
	 * @param reg_code
	 * @return
	 * Method 설명 : 상권분석에서 평가등급..
	 */
	public RatingGradeVo getRatingGrade(long reg_code);
}
