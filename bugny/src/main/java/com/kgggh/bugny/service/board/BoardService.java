package com.kgggh.bugny.service.board;

import java.util.List;

import com.kgggh.bugny.dto.BoardDTO;
import com.kgggh.bugny.dto.Criteria;
import com.kgggh.bugny.dto.SearchCriteria;

public interface BoardService {
	
	public int countBoard(SearchCriteria cri) throws Exception;
	public List<BoardDTO> boardList(SearchCriteria cri)throws Exception;
	public void boardCreate(BoardDTO board)throws Exception;
	public BoardDTO boardDetail(BoardDTO board)throws Exception;
	public void boardUpdate(BoardDTO board)throws Exception;
	public void boardDelete(int board_idx) throws Exception;
	public void boardHit(int board_idx) throws Exception;

	
}
