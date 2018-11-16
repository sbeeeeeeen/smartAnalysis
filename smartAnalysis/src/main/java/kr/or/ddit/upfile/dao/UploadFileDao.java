package kr.or.ddit.upfile.dao;

import java.util.List;

import javax.annotation.Resource;

import kr.or.ddit.upfile.model.UploadFileVo;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("uploadFileDao")
public class UploadFileDao implements UploadFileDaoInf {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate template;

	/**
	 * 
	 * Method : selectUpfile
	 * 최초작성일 : 2018. 8. 29.
	 * 작성자 : PC23
	 * 변경이력 :
	 * @param file_div
	 * @return
	 * Method 설명 : 파일구분번호로 조회
	 */
	@Override
	public List<UploadFileVo> selectUpfile(String file_div) {
		return template.selectList("upfile.selectUpfile", file_div);
	}

}
