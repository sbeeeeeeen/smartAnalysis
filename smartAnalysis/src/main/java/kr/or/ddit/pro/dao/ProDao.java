package kr.or.ddit.pro.dao;

import java.util.List;

import javax.annotation.Resource;

import kr.or.ddit.pro.model.ProVo;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository(value="proDao")
public class ProDao implements ProDaoInf {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	@Override
	public ProVo proNumSelect(int pro_num) {
		return template.selectOne("pro.proNumSelect", pro_num);
	}

	@Override
	public List<ProVo> proList() {
		return template.selectList("pro.proList");
	}

	@Override
	public ProVo proMember(String mem_id) {
		return template.selectOne("pro.proMember", mem_id);
	}

}
