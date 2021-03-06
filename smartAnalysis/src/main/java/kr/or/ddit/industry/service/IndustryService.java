package kr.or.ddit.industry.service;

import java.util.List;

import javax.annotation.Resource;

import kr.or.ddit.industry.dao.IndustryDaoInf;
import kr.or.ddit.industry.model.IndustryVo;

import org.springframework.stereotype.Service;

@Service("industryService")
public class IndustryService implements IndustryServiceInf {
	
	@Resource(name="industryDao")
	IndustryDaoInf industryDao;
	
	@Override
	public List<IndustryVo> getInd_L() {
		return industryDao.getInd_L();
	}

	@Override
	public List<IndustryVo> getIndustryM(String lcode) {
		return industryDao.getIndustryM(lcode);
	}

	@Override
	public List<IndustryVo> getIndustryS(String mcode) {
		return industryDao.getIndustryS(mcode);
	}

	@Override
	public List<IndustryVo> getIndustryList(List<String> code) {
		return industryDao.getIndustryList(code);
	}

	@Override
	public String getIndustryStr(List<String> ind_codes) {
		String result = "";
		for(int i = 0; i<ind_codes.size(); i++){
			IndustryVo industry = industryDao.getIndustryVo(ind_codes.get(i));
			result += "<li data-id" + industry.getIND_CODE() + ">" + industry.getIND_L() + " > " + industry.getIND_M()
					+ " > " + industry.getIND_S() + "</li>";
		}
		return result;
	}

	@Override
	public IndustryVo getIndustryVo(String ind_code) {
		return industryDao.getIndustryVo(ind_code);
	}

}
