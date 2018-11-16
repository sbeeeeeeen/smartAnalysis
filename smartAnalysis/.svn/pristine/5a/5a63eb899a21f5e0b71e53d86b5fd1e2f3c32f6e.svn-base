package kr.or.ddit.floating.dao;

import javax.annotation.Resource;

import kr.or.ddit.floating.model.FloatingVo;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class FloatingDao implements FloatingDaoInf {
	
	@Resource(name="sqlSessionTemplate")
	SqlSessionTemplate template;

	@Override
	public FloatingVo getFloatingVo(long reg_code) {
		return template.selectOne("getFloatingVo", reg_code);
	}
}
