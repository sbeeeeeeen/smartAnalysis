package kr.or.ddit.rent.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.or.ddit.rent.dao.RentDaoInf;
import kr.or.ddit.rent.model.RentVo;

import org.springframework.stereotype.Service;
@Service("rentService")
public class RentService implements RentServiceInf{
	
	@Resource
	private RentDaoInf rentDao;

	@Override
	public List<RentVo> getRent(int reg_gucode) {
		return rentDao.getRent(reg_gucode);
	}
	
	@Override
	public List<RentVo> getRentDt(int reg_gucode) {
		return rentDao.getRentDt(reg_gucode);
	}

	@Override
	public List<RentVo> getRentStairs(Map<String, Object> map) {
		return rentDao.getRentStairs(map);
	}

	@Override
	public List<RentVo> getRentDateList(int reg_gucode) {
		return rentDao.getRentDateList(reg_gucode);
	}


}
