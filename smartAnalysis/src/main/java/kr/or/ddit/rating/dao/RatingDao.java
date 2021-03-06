package kr.or.ddit.rating.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.or.ddit.rating.model.RatingGradeVo;
import kr.or.ddit.rating.model.RatingVo;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("ratingDao")
public class RatingDao implements RatingDaoInf {
	
	@Resource(name="sqlSessionTemplate")
	SqlSessionTemplate template;

	@Override
	public List<RatingVo> getdongRatingList(int an_num) {
		return template.selectList("rating.getdongRatingList", an_num);
	}

	@Override
	public List<RatingVo> getguRatingList(int an_num) {
		return template.selectList("rating.getguRatingList", an_num);
	}

	@Override
	public List<RatingVo> getsiRatingList(int an_num) {
		return template.selectList("rating.getsiRatingList", an_num);
	}

	@Override
	public RatingGradeVo getRatingGrade(long reg_code) {
		return template.selectOne("rating.getRatingGrade", reg_code);
	}

	
	
	

}
