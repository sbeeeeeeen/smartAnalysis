package kr.or.ddit.profit.dao;

import kr.or.ddit.profit.model.ProfitVo;

public interface ProfitDaoInf {
	
	/**
	* Method : insertPro
	* 최초작성일 : 2018. 9. 19.
	* 작성자 : PC13
	* 변경이력 :
	* @param profitVo
	* @return
	* Method 설명 : 비용입력 
	*/
	int insertProfit (ProfitVo profitVo);
	
	/**
	* Method : getProfit
	* 최초작성일 : 2018. 9. 20.
	* 작성자 : PC13
	* 변경이력 :
	* @param an_num
	* @return
	* Method 설명 : 분석번호로 profitVo 조회
	*/
	ProfitVo getProfit (int an_num);

}
