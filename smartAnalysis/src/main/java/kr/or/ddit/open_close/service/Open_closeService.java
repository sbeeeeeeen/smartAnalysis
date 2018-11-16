package kr.or.ddit.open_close.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.or.ddit.open_close.dao.Open_closeDaoInf;
import kr.or.ddit.open_close.model.Open_closeVo;

import org.springframework.stereotype.Service;

@Service
public class Open_closeService implements Open_closeServiceInf{
	@Resource(name="open_closeDao")
	private Open_closeDaoInf open_closeDao;

	@Override
	public Map<String, Object> getOpenCloseList(Map<String, Object> data) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("openCloseGuList", open_closeDao.getOpenCloseGuList(data));
		resultMap.put("openCloseSiList", open_closeDao.getOpenCloseSiList(data));
		return resultMap;
	}
	
	
}
