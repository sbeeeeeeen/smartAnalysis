package kr.or.ddit.region.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.or.ddit.region.model.RegionVo;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("regionDao")
public class RegionDao implements RegionDaoInf {
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;


	/**
	 * 
	 * Method : getRegionVo
	 * 최초작성일 : 2018. 8. 31.
	 * 작성자 : PC23
	 * 변경이력 :
	 * @param reg_code
	 * @return
	 * Method 설명 : 지역번호로 정보 가져오기
	 */
	@Override
	public List<RegionVo> getRegionVo(int reg_gu) {
		return template.selectList("region.getRegionVo", reg_gu);
	}

	@Override
	public List<Map<String, Object>> searchRegion(String reg) {
		return template.selectList("region.searchRegion", reg);
	}

	@Override
	public List<RegionVo> getReg_gu() {
		return template.selectList("region.getReg_gu");
	}

	@Override
	public RegionVo getRegion(long reg_code) {
		return template.selectOne("region.getRegion", reg_code);
	}

	/**
	 * 
	 * Method : getRegGuCode
	 * 최초작성일 : 2018. 9. 18.
	 * 작성자 : PC23
	 * 변경이력 :
	 * @param reg_code
	 * @return
	 * Method 설명 : 동 코드로 구 코드 가져오기
	 */
	@Override
	public int getRegGuCode(long reg_code) {
		return template.selectOne("region.getRegGuCode", reg_code);
	}

	@Override
	public long getRegCode(String reg_dong) {
		return template.selectOne("region.getRegCode", reg_dong);
	}

}
