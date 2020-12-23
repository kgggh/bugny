package com.kgggh.bugny.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgggh.bugny.dto.BoardDTO;
import com.kgggh.bugny.util.Pagination;


@Repository("boardDAO")
public class BoardUserDAOImpl implements BoardDAO {

	@Autowired
	SqlSession sql;

	@Override
	public int countBoard() throws Exception {
		return sql.selectOne("board.countBoard");
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
	public List<BoardDTO> boardList(BoardDTO board) {
		return sql.selectList("board.boardList");
	}

	@Override
	public void boardUpdate(BoardDTO board) throws Exception {
		sql.update("board.boardUpdate",board);
	}
	
	

	

}
