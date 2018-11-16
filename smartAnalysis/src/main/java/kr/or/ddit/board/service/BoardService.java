package kr.or.ddit.board.service;

import javax.annotation.Resource;

import kr.or.ddit.board.dao.BoardDaoInf;
import kr.or.ddit.board.model.BoardVo;

import org.springframework.stereotype.Service;

@Service("boardService")
public class BoardService implements BoardServiceInf{
	
	@Resource(name="boardDao")
	BoardDaoInf boardDao;
	
	@Override
	public int getBoardnum(int id) {
		return boardDao.getBoardnum(id);
	}

	@Override
	public int insertBoard(BoardVo boardVo) {
		return boardDao.insertBoard(boardVo);
	}

	@Override
	public BoardVo getBoard(int board_num) {
		return boardDao.getBoard(board_num);
	}

}
