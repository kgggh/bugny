package com.kgggh.bugny.controller.board;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kgggh.bugny.dto.ReplyDTO;
import com.kgggh.bugny.service.board.BoardService;

@RestController
@RequestMapping(value = "/restBoard")
public class RestBoardController {
	
	@Autowired
	private BoardService boardService;

	@RequestMapping(value = "/replyList", method = RequestMethod.POST)
	public List<ReplyDTO> getReplyList(@RequestParam("board_idx") int board_idx) throws Exception {
		
		return boardService.replyList(board_idx);
		
	}
	
	@RequestMapping(value = "/replyCreate", method = RequestMethod.POST)
	public Map<String, Object> replyCreate(@RequestBody ReplyDTO reply) throws Exception {
		Map<String, Object> result = new HashMap<>();
		try {
			boardService.replyCreate(reply);
			result.put("status", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");	
		}
		return result;
	}
	
	@RequestMapping(value = "/replyUpdate", method = {RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> replyUpdate(@RequestBody ReplyDTO reply) throws Exception {

		Map<String, Object> result = new HashMap<>();
		try {
		boardService.replyUpdate(reply);
		result.put("status", "OK");
	
		} catch (Exception e) {
		e.printStackTrace();
		result.put("status", "False");
		}
		return result;
		}
	
	@RequestMapping(value = "/replyDelete", method = {RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> replyDelete(@RequestParam("reply_idx") int reply_idx) throws Exception {
		Map<String, Object> result = new HashMap<>();
		try {
		boardService.replyDelete(reply_idx);
		result.put("status", "OK");
		
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}
		return result;
		}
	
	
		

}

