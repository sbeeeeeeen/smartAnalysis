package kr.or.ddit.residential.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.or.ddit.residential.dao.ResidentialDaoInf;
import kr.or.ddit.residential.model.ResidentialVo;

import org.springframework.stereotype.Service;

@Service("residentialService")
public class ResidentialService implements ResidentialServiceInf{
	@Resource
	private ResidentialDaoInf residentialDao;

	@Override
	public ResidentialVo getResidentialVo(long reg_code) {
		return residentialDao.getResidentialVo(reg_code);
	}

	@Override
	public List<ResidentialVo> getResidential(Map<String, Object> map) {
		return residentialDao.getResidential(map);
	}

	@Override
	public List<ResidentialVo> getResidentialAgeList(long reg_code) {
		return residentialDao.getResidentialAgeList(reg_code);
	}

	@Override
	public int getMaxAge(long reg_code) {
		return residentialDao.getMaxAge(reg_code);
	}

	@Override
	public int getMaxDiv(long reg_code) {
		return residentialDao.getMaxDiv(reg_code);
	}

}
