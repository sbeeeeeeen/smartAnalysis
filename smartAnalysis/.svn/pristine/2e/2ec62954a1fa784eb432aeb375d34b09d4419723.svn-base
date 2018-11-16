package kr.or.ddit.copartnership.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.copartnership.dao.CopartnershipDaoInf;
import kr.or.ddit.copartnership.model.CopartnershipViewVo;
import kr.or.ddit.copartnership.model.CopartnershipVo;

@Service("copartnershipService")
public class CopartnershipService implements CopartnershipServiceInf {
	
	@Resource(name="copartnershipDao")
	CopartnershipDaoInf copartnershipDao;
	
	@Override
	public List<CopartnershipVo> allCopartnership() {
		return copartnershipDao.allCopartnership();
	}

	@Override
	public List<CopartnershipVo> selectCopartnership(String search) {
		return copartnershipDao.selectCopartnership(search);
	}

	@Override
	public Map<String, Object> getCopartnershipPageList(Map<String, Object> map) {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		List<CopartnershipViewVo> copartnershipList = copartnershipDao.getCopartnershipPageList(map);
		resultMap.put("copartnershipList", copartnershipList);
		
		int totCnt = copartnershipDao.getCopartnershipTotCnt((String) map.get("search"));
		resultMap.put("totCnt", totCnt);
		
		int page = (int) map.get("page");
		int pageSize = (int) map.get("pageSize");
		String search = (String) map.get("search");
		
		resultMap.put("pageNavi", makePageNavi(page, pageSize, totCnt, search));
		
		return resultMap;
	}

	private String makePageNavi(int page, int pageSize, int totCnt, String search) {
		int cnt = totCnt / pageSize;
		int mod = totCnt % pageSize;
		
		if(mod > 0)
			cnt++;
		
		StringBuffer pageNaviStr = new StringBuffer();
		int prevPage = page == 1 ? 1 : page-1;
		int nextPage = page == cnt ? page : page + 1;
		
		pageNaviStr.append("<li><a href=\"javascript:void(0)\" class=\"copartnerPageNavi\" data-page=\""+prevPage+"\" data-pageSize=\""+pageSize+"\" data-search=\""+search + "\" aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span></a></li>");
		
		for(int i = 1; i <=cnt; i++){
			String activeClass = "";
			if(i==page)
				activeClass = "class=\"active\"";
			
			pageNaviStr.append("<li "+activeClass + "><a href=\"javascript:void(0)\" class=\"copartnerPageNavi\" data-page=\""+i+"\" data-pageSize=\""+pageSize+"\" data-search=\""+search+"\">"+i+"</a></li>");
			System.out.println(pageSize + "  " + search);
		}
		
		pageNaviStr.append("<li><a href=\"javascript:void(0)\" class=\"copartnerPageNavi\" data-page=\""+nextPage+"\" data-pageSize=\""+pageSize+"\" data-search=\""+search + "\" aria-label=\"Next\"><span aria-hidden=\"true\">&raquo;</span></a></li>");
		
		return pageNaviStr.toString();
	}

	@Override
	public CopartnershipVo getOneCopartnership(int id) {
		return copartnershipDao.getOneCopartnership(id);
	}

	@Override
	public int insertCopartnership(CopartnershipVo copartnershipVo) {
		return copartnershipDao.insertCopartnership(copartnershipVo);
	}

	@Override
	public List<CopartnershipVo> getJoinCopartnershipList(String mem_id) {
		return copartnershipDao.getJoinCopartnershipList(mem_id);
	}

}
