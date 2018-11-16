package kr.or.ddit.open_close.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.or.ddit.open_close.model.Open_closeVo;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("open_closeDao")
public class Open_closeDao implements Open_closeDaoInf{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;

	@Override
	public List<Open_closeVo> getOpenCloseGuList(Map<String, Object> data) {
		return template.selectList("openclose.getOpenCloseGuList", data);
	}

	@Override
	public List<Open_closeVo> getOpenCloseSiList(Map<String, Object> data) {
		return template.selectList("openclose.getOpenCloseSiList", data);
	}
}
