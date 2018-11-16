package kr.or.ddit.profit.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.profit.dao.ProfitDaoInf;
import kr.or.ddit.profit.model.ProfitVo;

@Service("profitService")
public class ProfitService implements ProfitServiceInf {
	
	@Resource(name="profitDao")
	private ProfitDaoInf profitDao;
	
	
	@Override
	public int insertProfit(ProfitVo profitVo) {
		return profitDao.insertProfit(profitVo);
	}


	@Override
	public ProfitVo getProfit(int an_num) {
		return profitDao.getProfit(an_num);
	}

}
