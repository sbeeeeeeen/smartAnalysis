package kr.or.ddit.cooperative.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.or.ddit.cooperative.model.CooperativeVo;
import kr.or.ddit.member.model.MemberVo;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository("cooperativeDao")
public class CooperativeDao implements CooperativeDaoInf{

	@Resource(name="sqlSessionTemplate")
	SqlSessionTemplate template;
	
	@Override
	public List<CooperativeVo> getCooperativeList(int cship_num) {
		return template.selectList("cooperative.getCooperativeList", cship_num);
	}

	@Override
	public int deleteCooperative(int coop_num) {
		return template.update("cooperative.deleteCooperative", coop_num);
	}

	@Override
	public int insertCooperative(CooperativeVo cooperativeVo) {
		return template.insert("cooperative.insertCooperative",cooperativeVo);
	}

	@Override
	public CooperativeVo getCooperativeVo(Map<String, Object> data) {
		return template.selectOne("cooperative.getCooperative", data);
	}

	@Override
	public List<MemberVo> getStandbyCooperative(int cship_num) {
		return template.selectList("cooperative.getStandbyCooperative", cship_num);
	}

	@Override
	public int updateCooperative(CooperativeVo cooperative) {
		return template.update("cooperative.updateCooperative", cooperative);
	}

	@Override
	public MemberVo getCooperativeMemberVo(int coop_num) {
		return template.selectOne("cooperative.getCooperativeMemberVo", coop_num);
	}

}
