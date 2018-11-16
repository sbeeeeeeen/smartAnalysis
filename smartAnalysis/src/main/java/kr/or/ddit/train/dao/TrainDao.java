package kr.or.ddit.train.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.train.model.TrainVo;
@Repository("trainDao")
public class TrainDao implements TrainDaoInf {
	
	@Resource(name="sqlSessionTemplate")
	SqlSessionTemplate template;

	@Override
	public List<TrainVo> getTrain(long reg_code) {
		return template.selectList("train.getTrain", reg_code);
	}


}
