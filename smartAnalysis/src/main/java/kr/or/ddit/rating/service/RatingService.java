package kr.or.ddit.rating.service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import kr.or.ddit.rating.dao.RatingDaoInf;
import kr.or.ddit.rating.model.RatingGradeVo;

import org.springframework.stereotype.Service;

@Service
public class RatingService implements RatingServiceInf {
	@Resource
	private RatingDaoInf ratingDao;

	@Override
	public Map<String, Object> getRatingLists(int an_num) {
		Map<String, Object> ratingLists = new HashMap<String, Object>();
		ratingLists.put("siRatingList", ratingDao.getsiRatingList(an_num));
		ratingLists.put("guRatingList", ratingDao.getguRatingList(an_num));
		ratingLists.put("dongRatingList", ratingDao.getdongRatingList(an_num));
		return ratingLists;
	}

	@Override
	public RatingGradeVo getRatingGrade(long reg_code) {
		return ratingDao.getRatingGrade(reg_code);
	}
	
	
}
