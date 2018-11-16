package kr.or.ddit.utilization.service;

import java.util.List;

import javax.annotation.Resource;

import kr.or.ddit.utilization.dao.UtilizationDaoInf;
import kr.or.ddit.utilization.model.UtilizationVo;

import org.springframework.stereotype.Service;
@Service("utilizaionService")
public class UtilizationService implements UtilizationServiceInf {

	@Resource(name="utilizationDao")
	private UtilizationDaoInf utilizationDao;
	
	@Override
	public List<UtilizationVo> getUtilSang(long reg_code) {
		return utilizationDao.getUtilSang(reg_code);
	}

	@Override
	public List<UtilizationVo> getUtilHa(long reg_code) {
		return utilizationDao.getUtilHa(reg_code);
	}

	@Override
	public List<UtilizationVo> getUpzongSang(String ind_code) {
		return utilizationDao.getUpzongSang(ind_code);
	}

	@Override
	public List<UtilizationVo> getUpzongHa(String ind_code) {
		return utilizationDao.getUpzongHa(ind_code);
	}

}
