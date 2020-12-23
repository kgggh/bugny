package com.kgggh.bugny.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kgggh.bugny.dao.BoardDAO;
import com.kgggh.bugny.dto.BoardDTO;
import com.kgggh.bugny.util.Pagination;



@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO ;
	
	@Override
	public int countBoard() throws Exception {
		return boardDAO.countBoard();
				
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
	public List<BoardDTO> boardList(BoardDTO board) throws Exception{
		return	boardDAO.boardList(board);
	}

	@Override
	public void boardUpdate(BoardDTO board) throws Exception {
		 boardDAO.boardUpdate(board);
	}

	@Override
	public void boardDelete(int board_idx) throws Exception {
		// TODO Auto-generated method stub
		
	}


	

}
