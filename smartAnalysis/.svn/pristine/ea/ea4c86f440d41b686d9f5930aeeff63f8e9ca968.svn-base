package kr.or.ddit.floating.service;

import javax.annotation.Resource;

import kr.or.ddit.floating.dao.FloatingDaoInf;
import kr.or.ddit.floating.model.FloatingVo;

import org.springframework.stereotype.Service;

@Service
public class FloatingService implements FloatingServiceInf {
	
	@Resource
	private FloatingDaoInf floatingDao;

	@Override
	public FloatingVo getFloatingVo(long reg_code) {
		return floatingDao.getFloatingVo(reg_code);
	}

}
