package kr.or.ddit.train.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.train.dao.TrainDaoInf;
import kr.or.ddit.train.model.TrainVo;
@Service("trainService")
public class TrainService implements TrainServiceInf {
	
	@Resource
	private TrainDaoInf trainDao;
	

	@Override
	public List<TrainVo> getTrain(long reg_code) {
		return trainDao.getTrain(reg_code);
	}



}
