package kr.or.ddit.residential.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.or.ddit.residential.model.ResidentialVo;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ResidentialDao implements ResidentialDaoInf{
	@Resource(name="sqlSessionTemplate")
	SqlSessionTemplate template;

	@Override
	public ResidentialVo getResidentialVo(long reg_code) {
		return template.selectOne("getResidentialVo", reg_code);
	}

	@Override
	public List<ResidentialVo> getResidential(Map<String, Object> map) {
		return template.selectList("residential.getResidential", map);
	}

	@Override
	public List<ResidentialVo> getResidentialAgeList(long reg_code) {
		return template.selectList("residential.getResidentialAgeList", reg_code);
	}

	@Override
	public int getMaxAge(long reg_code) {
		return template.selectOne("residential.getMaxAge", reg_code);
	}

	@Override
	public int getMaxDiv(long reg_code) {
		return template.selectOne("residential.getMaxDiv", reg_code);
	}
}
