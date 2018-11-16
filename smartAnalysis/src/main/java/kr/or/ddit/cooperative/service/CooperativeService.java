package kr.or.ddit.cooperative.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.cooperative.dao.CooperativeDaoInf;
import kr.or.ddit.cooperative.model.CooperativeVo;
import kr.or.ddit.member.model.MemberVo;

@Service("cooperativeService")
public class CooperativeService implements CooperativeServiceInf{
	
	@Resource(name="cooperativeDao")
	CooperativeDaoInf cooperativeDao;
	
	@Override
	public List<CooperativeVo> getCooperativeList(int cship_num) {
		return cooperativeDao.getCooperativeList(cship_num);
	}

	@Override
	public int deleteCooperative(int coop_num) {
		return cooperativeDao.deleteCooperative(coop_num);
	}

	@Override
	public int insertCooperative(CooperativeVo cooperativeVo) {
		return cooperativeDao.insertCooperative(cooperativeVo);
	}

	@Override
	public CooperativeVo getCooperativeVo(Map<String, Object> data) {
		return cooperativeDao.getCooperativeVo(data);
	}

	@Override
	public List<MemberVo> getStandbyCooperative(int cship_num) {
		return cooperativeDao.getStandbyCooperative(cship_num);
	}

	@Override
	public int updateCooperative(CooperativeVo cooperative) {
		return cooperativeDao.updateCooperative(cooperative);
	}

	@Override
	public MemberVo getCooperativeMemberVo(int coop_num) {
		return cooperativeDao.getCooperativeMemberVo(coop_num);
	}

}
