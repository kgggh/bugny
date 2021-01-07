package com.kgggh.bugny.dao.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgggh.bugny.dto.BoardDTO;
import com.kgggh.bugny.dto.ReplyDTO;
import com.kgggh.bugny.dto.SearchCriteria;


@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO {

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
		sql.update("board.boardDelete",board_idx);
		
	}

	@Override
	public void boardHit(int board_idx) {
		sql.update("board.boardHit",board_idx);
		
	}

	@Override
	public List<ReplyDTO> replyList(int board_idx) throws Exception {
		return sql.selectList("reply.replyList",board_idx);
	}

	@Override
	public int replyCreate(ReplyDTO reply) throws Exception {
		return sql.insert("reply.replyCreate",reply);
	}

	@Override
	public int replyUpdate(ReplyDTO reply) throws Exception {
		return sql.update("reply.replyUpdate",reply);
	}

	@Override
	public int replyDelete(int reply_idx) throws Exception {
		return sql.delete("reply.replyDelete",reply_idx);
	}



	

}
