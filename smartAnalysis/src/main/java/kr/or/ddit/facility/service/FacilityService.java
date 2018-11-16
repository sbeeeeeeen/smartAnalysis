package kr.or.ddit.facility.service;

import java.util.List;

import javax.annotation.Resource;

import kr.or.ddit.facility.dao.FacilityDaoInf;
import kr.or.ddit.facility.model.FacilityVo;

import org.springframework.stereotype.Service;

@Service("facilityService")
public class FacilityService implements FacilityServiceInf {

	@Resource
	private FacilityDaoInf facilityDao;

	@Override
	public List<FacilityVo> getSchool(int reg_gucode) {
		return facilityDao.getSchool(reg_gucode);
	}

	@Override
	public List<FacilityVo> getFacility(int reg_gucode) {
		return facilityDao.getFacility(reg_gucode);
	}

	@Override
	public String getFaci_nm(int reg_gucode) {
		return facilityDao.getFaci_nm(reg_gucode);
	}

}
