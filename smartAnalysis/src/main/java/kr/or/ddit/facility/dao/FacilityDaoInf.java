package kr.or.ddit.facility.dao;

import java.util.List;

import kr.or.ddit.facility.model.FacilityVo;


public interface FacilityDaoInf {
	
	List<FacilityVo> getSchool(int reg_gucode);
	List<FacilityVo> getFacility(int reg_gucode);

	String getFaci_nm(int reg_gucode);
}
