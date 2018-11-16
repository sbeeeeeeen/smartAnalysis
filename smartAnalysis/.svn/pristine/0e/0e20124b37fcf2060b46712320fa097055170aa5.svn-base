package kr.or.ddit.rectal.dao;

import javax.annotation.Resource;

import kr.or.ddit.rectal.model.RectalVo;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class RectalDao implements RectalDaoInf {
	@Resource(name="sqlSessionTemplate")
	SqlSessionTemplate template;

	@Override
	public RectalVo getRectalVo(long reg_code) {
		return template.selectOne("getRectalVo", reg_code);
	}
}
