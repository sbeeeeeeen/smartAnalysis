package kr.or.ddit.member.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.or.ddit.industry.model.IndustryVo;
import kr.or.ddit.member.model.MemberVo;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("memberDao")
public class MemberDao implements MemberDaoInf {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;

	
	@Override
	public List<MemberVo> selectAllMembers() {
		return template.selectList("member.selectAllMembers");
	}

	@Override
	public MemberVo getOneMember(String mem_id) {
		MemberVo memberVo = template.selectOne("member.getOneMember", mem_id);
		return memberVo;
	}

	@Override
	public MemberVo getOneMember(MemberVo memberVo) {
		MemberVo vo = template.selectOne("member.getOneMemberVo", memberVo);
		return memberVo;
	}

	@Override
	public int insertMember(MemberVo memberVo) {
		int cnt = template.insert("member.insertMember", memberVo);
		return cnt;
	}

	@Override
	public int idcheck(String mem_id) {
		int cnt = template.selectOne("member.idcheck", mem_id);
		return cnt;
	}

	@Override
	public int emailCheck(String mem_email) {
		int cnt = template.selectOne("member.emailCheck", mem_email);
		return cnt;
	}

	@Override
	public MemberVo findId(String mem_email) {
		MemberVo memberVo = template.selectOne("member.findId", mem_email);
		return memberVo;
	}

	@Override
	public int updateMem(MemberVo memberVo) {
		int cnt = template.update("member.updateMem", memberVo);
		return cnt;
	}


	@Override
	public int getMemberCnt() {
		int cnt = template.selectOne("member.getMemberTotCnt");
		return cnt;
	}

	@Override
	public List<MemberVo> memberPageList(Map<String, Object> map) {
		return template.selectList("member.getMemberPageList", map);
	}









}
