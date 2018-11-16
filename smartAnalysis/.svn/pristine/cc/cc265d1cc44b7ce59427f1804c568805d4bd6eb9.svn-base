package kr.or.ddit.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.industry.model.IndustryVo;
import kr.or.ddit.member.dao.MemberDaoInf;
import kr.or.ddit.member.model.MemberVo;

@Service("memberService")
public class MemberService implements MemberServiceInf {
	
	@Resource(name="memberDao")
	private MemberDaoInf memberDao;

	@Override
	public List<MemberVo> selectAllMembers() {
		return memberDao.selectAllMembers();
	}

	@Override
	public MemberVo getOneMember(String mem_id) {
		return memberDao.getOneMember(mem_id);
	}

	@Override
	public MemberVo getOneMember(MemberVo memberVo) {
		return memberDao.getOneMember(memberVo);
	}

	@Override
	public int insertMember(MemberVo memberVo) {
		return memberDao.insertMember(memberVo);
	}

	@Override
	public int idcheck(String mem_id) {
		return memberDao.idcheck(mem_id);
	}

	@Override
	public int emailCheck(String mem_email) {
		return memberDao.emailCheck(mem_email);
	}

	@Override
	public MemberVo findId(String mem_email) {
		return memberDao.findId(mem_email);
	}

	@Override
	public int updateMem(MemberVo memberVo) {
		return memberDao.updateMem(memberVo);
	}
	
	@Override
	public Map<String, Object> getMemberPageList(Map<String, Object> map) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<MemberVo> pageList = memberDao.memberPageList(map);
		resultMap.put("pageList", pageList);
		
		int totCnt = memberDao.getMemberCnt();
		resultMap.put("totCnt", totCnt);
		
		int page = (int) map.get("page");
		int pageSize = (int) map.get("pageSize");
		
		resultMap.put("pageNavi", makePageNvai(page, pageSize, totCnt));
		
		return resultMap;
	}



	
	private String makePageNvai(int page, int pageSize, int totCnt){
		int cnt = totCnt/pageSize;
		int mod = totCnt%pageSize;

		if(mod>0){
			cnt++;
		}
		StringBuffer pageNaviStr = new StringBuffer();

		int prevPage = page ==1 ? 1: page-1;
		int nextPage = page == cnt ? page: page+1;

		pageNaviStr.append("<li><a href=\"/member/memberList?"
				+ "page="
				+ prevPage
				+ "&pageSize="
				+ pageSize
				+ "\" aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span></a></li>");

		for(int i = 1; i<=cnt; i++){
			String activeClass = "";
			if(i==page){
				activeClass = "class=\"active\"";
			}
			pageNaviStr.append("<li " + activeClass
					+ "><a href=\"/member/memberList?page=" + i + "&pageSize="
					+ pageSize +"\">" + i + "</a></li>");

		}
		pageNaviStr.append("<li><a href=\"/member/memberList?"
				+ "page="
				+ nextPage
				+ "&pageSize="
				+ pageSize
				+ "\" aria-label=\"Next\"><span aria-hidden=\"true\">&raquo;</span></a></li>");

		return pageNaviStr.toString();
	}







}
