package com.kgggh.bugny.dao.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgggh.bugny.dto.BoardDTO;
import com.kgggh.bugny.dto.Criteria;
import com.kgggh.bugny.dto.SearchCriteria;


@Repository("boardDAO")
public class BoardUserDAOImpl implements BoardDAO {

	@Autowired
	SqlSession sql;

	@Override
	public int countBoard(SearchCriteria cri) throws Exception {
		return sql.selectOne("board.countBoard",cri);
	}

	@Override
	public int boardCreate(BoardDTO board) {
		return sql.insert("board.boardCreate",board);
	}

	@Override
	public BoardDTO boardDetail(BoardDTO board) {
		return sql.selectOne("board.boardDetail",board);
	}

	@Override
	public List<BoardDTO> boardList(SearchCriteria cri) {
		return sql.selectList("board.boardList",cri);
	}

	@Override
	public void boardUpdate(BoardDTO board) throws Exception {
		sql.update("board.boardUpdate",board);
	}

	@Override
	public void boardDelete(int board_idx) {
		sql.delete("board.boardDelete",board_idx);
		
	}

	@Override
	public void boardHit(int board_idx) {
		sql.update("board.boardHit",board_idx);
		
	}



	

}
