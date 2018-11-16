package kr.or.ddit.industry.dao;

import org.springframework.stereotype.Repository;

import java.util.List;

import javax.annotation.Resource;

import kr.or.ddit.industry.model.IndustryVo;

import org.mybatis.spring.SqlSessionTemplate;

@Repository("industryDao")
public class IndustryDao implements IndustryDaoInf {
	
	@Resource(name="sqlSessionTemplate")
	SqlSessionTemplate template;
	
	@Override
	public List<IndustryVo> getInd_L() {
		return template.selectList("industry.getInd_L");
	}

	@Override
	public List<IndustryVo> getIndustryM(String lcode) {
		return template.selectList("industry.getIndustryM", lcode);
	}

	@Override
	public List<IndustryVo> getIndustryS(String mcode) {
		return template.selectList("industry.getIndustryS", mcode);
	}

	@Override
	public List<IndustryVo> getIndustryList(List<String> code) {
		return template.selectList("industry.getIndustryList", code);
	}

	@Override
	public IndustryVo getIndustryVo(String ind_code) {
		return template.selectOne("industry.getIndustryVo", ind_code);
	}
}
