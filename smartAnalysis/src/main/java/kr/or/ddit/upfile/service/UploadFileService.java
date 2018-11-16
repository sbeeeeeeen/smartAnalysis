package kr.or.ddit.upfile.service;

import java.util.List;

import javax.annotation.Resource;

import kr.or.ddit.upfile.dao.UploadFileDaoInf;
import kr.or.ddit.upfile.model.UploadFileVo;

import org.springframework.stereotype.Service;
@Service("uploadFileService")
public class UploadFileService implements UploadFileServiceInf{

	@Resource(name="uploadFileDao")
	private UploadFileDaoInf uploadFileDao;
	
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
		return uploadFileDao.selectUpfile(file_div);
	}

}
