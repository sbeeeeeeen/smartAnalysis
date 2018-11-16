package kr.or.ddit.company.dao;

import java.util.List;

import javax.annotation.Resource;

import kr.or.ddit.company.model.CompanyVo;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository(value="companyDao")
public class CompanyDao implements CompanyDaoInf {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;

	@Override
	public List<CompanyVo> getCompanyInfo(long reg_gucode) {
		return template.selectList("company.getCompanyInfo", reg_gucode);
	}

}
