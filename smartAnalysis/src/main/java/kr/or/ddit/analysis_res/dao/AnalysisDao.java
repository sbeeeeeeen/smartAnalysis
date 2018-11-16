package kr.or.ddit.analysis_res.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.or.ddit.analysis_res.model.AnalysisCodeVo;
import kr.or.ddit.analysis_res.model.AnalysisRecVo;
import kr.or.ddit.analysis_res.model.AnalysisResVo;
import kr.or.ddit.analysis_res.model.AnalysisTableVo;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("analysisDao")
public class AnalysisDao implements AnalysisResDaoInf{
	
	@Resource(name="sqlSessionTemplate")
	SqlSessionTemplate template;

	@Override
	public int insertAnalysisRes(AnalysisResVo anVo) {
		template.insert("analysis.insertAnalysisRes", anVo);
		return anVo.getAn_num();
	}

	@Override
	public int insertAnalysisRec(AnalysisRecVo arVo) {
		return template.insert("analysis.insertAnalysisRec", arVo);
	}

	@Override
	public long insertAnalysisCode(Map<String, Object> data) {
		template.insert("analysis.insertAnalysisCode", data);
		template.update("industry.updateIndustryCnt", data.get("ind_code"));
		template.update("region.updateRegionCnt", data.get("reg_code"));
		return (long)data.get("reg_code");
	}

	@Override
	public AnalysisResVo getAnalysisRes(int an_num) {
		return template.selectOne("analysis.getAnalysisRes", an_num);
	}

	@Override
	public List<AnalysisRecVo> getAnalysisRec(int an_num) {
		return template.selectList("analysis.getAnalysisRec", an_num);
	}

	@Override
	public List<AnalysisCodeVo> getAnalysisCode(int an_num) {
		return template.selectList("analysis.getAnalysisCode", an_num);
	}

	@Override
	public List<AnalysisTableVo> getAnalysisResList(Map<String, Object> data) {
		return template.selectList("analysis.getAnalysisResList", data);
	}

	@Override
	public int getAnalysisResCount(Map<String, Object> map) {
		return template.selectOne("analysis.getAnalysisResCount", map);
	}

}
