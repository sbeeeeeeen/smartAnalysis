package kr.or.ddit.company.dao;

import java.util.List;

import kr.or.ddit.company.model.CompanyVo;

public interface CompanyDaoInf {
	
	/**
	 * 
	 * Method : getCompanyInfo
	 * 최초작성일 : 2018. 10. 8.
	 * 작성자 : PC23
	 * 변경이력 :
	 * @param reg_gucode
	 * @return
	 * Method 설명 : 구 코드로 사업체수 및 종사자 수 자료 검색
	 */
	List<CompanyVo> getCompanyInfo(long reg_gucode);

}
