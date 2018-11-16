package kr.or.ddit.profit.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.profit.model.ProfitVo;

@Repository("profitDao")
public class ProfitDao implements ProfitDaoInf {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;


	@Override
	public int insertProfit(ProfitVo profitVo) {
		int cnt = template.insert("profit.insertProfit", profitVo);
		return cnt;
	}


	@Override
	public ProfitVo getProfit(int an_num) {
		ProfitVo profitVo = template.selectOne("profit.getProfit", an_num);
		return profitVo;
	}

}
