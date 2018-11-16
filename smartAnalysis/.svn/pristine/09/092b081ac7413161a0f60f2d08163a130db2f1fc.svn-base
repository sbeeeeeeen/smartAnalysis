package kr.or.ddit.facility.dao;

import java.util.List;

import javax.annotation.Resource;

import kr.or.ddit.facility.model.FacilityVo;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("facilityDao")
public class FacilityDao implements FacilityDaoInf {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;

	@Override
	public List<FacilityVo> getSchool(int reg_gucode) {
		return template.selectList("facility.getSchool", reg_gucode);
	}

	@Override
	public List<FacilityVo> getFacility(int reg_gucode) {
		return template.selectList("facility.getFacility", reg_gucode);
	}

	@Override
	public String getFaci_nm(int reg_gucode) {
		return template.selectOne("facility.getFaci_nm", reg_gucode);
	}

}
