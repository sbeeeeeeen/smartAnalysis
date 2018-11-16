package kr.or.ddit.company.service;

import java.util.List;

import javax.annotation.Resource;

import kr.or.ddit.company.dao.CompanyDaoInf;
import kr.or.ddit.company.model.CompanyVo;

import org.springframework.stereotype.Service;

@Service(value="companyService")
public class CompanyService implements CompanyServiceInf {
	
	@Resource(name="companyDao")
	private CompanyDaoInf companyDao;

	@Override
	public List<CompanyVo> getCompanyInfo(long reg_gucode) {
		return companyDao.getCompanyInfo(reg_gucode);
	}

}
