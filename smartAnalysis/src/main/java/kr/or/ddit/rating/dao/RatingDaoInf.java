package kr.or.ddit.rating.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import kr.or.ddit.rating.model.RatingGradeVo;
import kr.or.ddit.rating.model.RatingVo;

public interface RatingDaoInf {
	/**
	 * Method : getdongRatingList
	 * 최초작성일 : 2018. 9. 19.
	 * 작성자 : YSB
	 * 변경이력 :
	 * @param an_num
	 * @return
	 * Method 설명 : 동별 평가지수
	 */
	public List<RatingVo> getdongRatingList(int an_num);
	/**
	 * Method : getguRatingList
	 * 최초작성일 : 2018. 9. 19.
	 * 작성자 : YSB
	 * 변경이력 :
	 * @param an_num
	 * @return
	 * Method 설명 : 구별 평가지수
	 */
	public List<RatingVo> getguRatingList(int an_num);
	/**
	 * Method : getsiRatingList
	 * 최초작성일 : 2018. 9. 19.
	 * 작성자 : YSB
	 * 변경이력 :
	 * @param an_num
	 * @return
	 * Method 설명 : 시별 평가지수
	 */
	public List<RatingVo> getsiRatingList(int an_num);
	
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
