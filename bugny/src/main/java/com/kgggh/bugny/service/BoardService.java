package com.kgggh.bugny.service;

import java.util.List;

import com.kgggh.bugny.dto.BoardDTO;
import com.kgggh.bugny.util.Pagination;

public interface BoardService {
	
	public int countBoard() throws Exception;
	public List<BoardDTO> boardList(BoardDTO board)throws Exception;
	public void boardCreate(BoardDTO board)throws Exception;
	public BoardDTO boardDetail(BoardDTO board)throws Exception;
	public void boardUpdate(BoardDTO board)throws Exception;
	public void boardDelete(int board_idx) throws Exception;


	
}
