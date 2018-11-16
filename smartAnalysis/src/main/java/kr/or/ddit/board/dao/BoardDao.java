package kr.or.ddit.board.dao;

import javax.annotation.Resource;

import kr.or.ddit.board.model.BoardVo;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("boardDao")
public class BoardDao implements BoardDaoInf{

	@Resource(name="sqlSessionTemplate")
	SqlSessionTemplate template;
	
	@Override
	public int getBoardnum(int id) {
		return template.selectOne("board.getBoardnum", id);
	}

	@Override
	public int insertBoard(BoardVo boardVo) {
		return template.insert("board.insertBoard",boardVo);
	}

	@Override
	public BoardVo getBoard(int post_num) {
		return template.selectOne("board.getBoard", post_num);
	}

}
