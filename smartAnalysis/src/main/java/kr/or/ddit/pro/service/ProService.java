package kr.or.ddit.pro.service;

import java.util.List;

import javax.annotation.Resource;

import kr.or.ddit.pro.dao.ProDaoInf;
import kr.or.ddit.pro.model.ProVo;

import org.springframework.stereotype.Service;

@Service(value="proService")
public class ProService implements ProServiceInf {
	
	@Resource(name="proDao")
	private ProDaoInf proDao;

	@Override
	public ProVo proNumSelect(int pro_num) {
		return proDao.proNumSelect(pro_num);
	}

	@Override
	public List<ProVo> proList() {
		return proDao.proList();
	}

	@Override
	public ProVo proMember(String mem_id) {
		return proDao.proMember(mem_id);
	}

}
