package kr.or.ddit.utilization.dao;

import java.util.List;

import javax.annotation.Resource;

import kr.or.ddit.utilization.model.UtilizationVo;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository("utilizationDao")
public class UtilizationDao implements UtilizationDaoInf {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	@Override
	public List<UtilizationVo> getUtilSang(long reg_code) {
		return template.selectList("utilization.getUtilSang", reg_code);
	}

	@Override
	public List<UtilizationVo> getUtilHa(long reg_code) {
		return template.selectList("utilization.getUtilHa", reg_code);
	}

	@Override
	public List<UtilizationVo> getUpzongSang(String ind_code) {
		return template.selectList("utilization.getUpzongSang", ind_code);
	}

	@Override
	public List<UtilizationVo> getUpzongHa(String ind_code) {
		return template.selectList("utilization.getUpzongHa", ind_code);
	}

}
