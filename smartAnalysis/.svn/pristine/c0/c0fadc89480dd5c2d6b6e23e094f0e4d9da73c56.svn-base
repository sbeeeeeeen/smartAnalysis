package kr.or.ddit.rectal.service;

import javax.annotation.Resource;

import kr.or.ddit.rectal.dao.RectalDaoInf;
import kr.or.ddit.rectal.model.RectalVo;

import org.springframework.stereotype.Service;

@Service
public class RectalService implements RectalServiceInf {
	
	@Resource
	private RectalDaoInf rectalDao;

	@Override
	public RectalVo getRectalVo(long reg_code) {
		return rectalDao.getRectalVo(reg_code);
	}

}
