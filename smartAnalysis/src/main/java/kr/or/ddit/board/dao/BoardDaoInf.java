package kr.or.ddit.board.dao;

import kr.or.ddit.board.model.BoardVo;

public interface BoardDaoInf {

	/**
	* Method : getBoardnum
	* 최초작성일 : 2018. 9. 13.
	* 작성자 : user
	* 변경이력 :
	* @param id
	* @return
	* Method 설명 : 협동조합 번호로 게시판 번호 조회
	*/
	public int getBoardnum(int id);
	
	/**
	* Method : insertBoard
	* 최초작성일 : 2018. 9. 14.
	* 작성자 : user
	* 변경이력 :
	* @param boardVo
	* @return
	* Method 설명 : 게시판 생성
	*/
	public int insertBoard(BoardVo boardVo);

	public BoardVo getBoard(int board_num);
}
