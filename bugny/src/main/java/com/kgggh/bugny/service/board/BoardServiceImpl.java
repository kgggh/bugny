package com.kgggh.bugny.service.board;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgggh.bugny.dao.board.BoardDAO;
import com.kgggh.bugny.dto.BoardDTO;
import com.kgggh.bugny.dto.Criteria;
import com.kgggh.bugny.dto.SearchCriteria;



@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO ;
	
	@Override
	public int countBoard(SearchCriteria cri) throws Exception {
		return boardDAO.countBoard(cri);
				
	}
	
	@Override
	public void boardCreate(BoardDTO board)throws Exception {
		boardDAO.boardCreate(board);
	}

	@Override
	public BoardDTO boardDetail(BoardDTO board) throws Exception{
		return boardDAO.boardDetail(board);
	}

	@Override
	public List<BoardDTO> boardList(SearchCriteria cri) throws Exception{
		return	boardDAO.boardList(cri);
	}

	@Override
	public void boardUpdate(BoardDTO board) throws Exception {
		 boardDAO.boardUpdate(board);
	}

	@Override
	public void boardDelete(int board_idx) throws Exception {
		boardDAO.boardDelete(board_idx);
		
	}

	@Override
	public void boardHit(int board_idx) throws Exception {
		boardDAO.boardHit(board_idx);
		
	}

	
	



	

}
