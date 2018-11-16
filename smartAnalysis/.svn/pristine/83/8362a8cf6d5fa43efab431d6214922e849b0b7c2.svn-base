package kr.or.ddit.rent.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.or.ddit.rent.model.RentVo;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository("rentDao")
public class RentDao implements RentDaoInf{
	
	@Resource(name="sqlSessionTemplate")
	SqlSessionTemplate template;

	@Override
	public List<RentVo> getRent(int reg_gucode) {
		return template.selectList("rent.getRent", reg_gucode);
	}
	
	@Override
	public List<RentVo> getRentDt(int reg_gucode) {
		return template.selectList("rent.getRentDt", reg_gucode);
	}

	@Override
	public List<RentVo> getRentStairs(Map<String, Object> map) {
		return template.selectList("rent.getRentStairs", map);
	}

	@Override
	public List<RentVo> getRentDateList(int reg_gucode) {
		return template.selectList("rent.getRentDateList", reg_gucode);
	}


}
