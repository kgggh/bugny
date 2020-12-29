package com.kgggh.bugny.controller.board;


import java.io.File;
import java.io.IOException;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.kgggh.bugny.dto.BoardDTO;
import com.kgggh.bugny.service.BoardService;
import com.kgggh.bugny.util.FileUpload;

@Controller
public class BoardController {
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	BoardService boardService;
	
	
	@RequestMapping(value = "/boardPage", method = RequestMethod.GET)
	public String boardList(Model model,BoardDTO board) throws Exception {
		log.info("게시판 페이지");
		model.addAttribute("boardList",boardService.boardList(board));
		return "board/board_list";
	}
	
	//글쓰기페이지
	@RequestMapping("/boardWriteP")
	public String board_writePage() {
		log.info("게시글쓰기 페이지");
		return "board/board_write";
	}
	
	//글쓰기
	@RequestMapping("/boardWrite")
	public String boardCreate(BoardDTO board,Model model) throws Exception {
		boardService.boardCreate(board);
		model.addAttribute("msg","작성완료");
		model.addAttribute("url","/boardPage");
		
        return "redirect";
	}
	
	//글수정페이지
		@RequestMapping("/boardUpdateP")
		public String board_UpdatePage(Model model,BoardDTO board) throws Exception {
			log.info("게시글수정 페이지");
			board = boardService.boardDetail(board);
			model.addAttribute("boardUpdate",board);
			return "board/board_update";
		}
		
	//글수정
	@RequestMapping("/boardUpdate")
	public String boardUpdate(BoardDTO board,Model model) throws Exception {
		boardService.boardUpdate(board);
		System.out.println(">>>>>>>>board" + board);
		return "redirect:/boardPage";
	}
	
	//글상세페이지
	@RequestMapping("/boardDetail")
	public String boardDetail(BoardDTO board,@RequestParam("board_idx")int board_idx,Model model) throws Exception {
		log.info("게시글상세 페이지");
		board = boardService.boardDetail(board);
		model.addAttribute("boardDetail",board);
		return "board/board_detail";
	}
	
	@RequestMapping(value = "/fileUpload", method = RequestMethod.POST)
	public String fileUpload(Model model, MultipartRequest multipartRequest, HttpServletRequest request) throws IOException{
		MultipartFile imgfile = multipartRequest.getFile("Filedata");
		Calendar cal = Calendar.getInstance();
		String fileName = imgfile.getOriginalFilename();
		String fileType = fileName.substring(fileName.lastIndexOf("."), fileName.length());
		String replaceName = cal.getTimeInMillis() + fileType;  
		
		String path = request.getSession().getServletContext().getRealPath("/")+File.separator+"resources/upload";
		FileUpload.fileUpload(imgfile, path, replaceName);
		model.addAttribute("path", path);
		model.addAttribute("filename", replaceName);
		return "common/file_upload";
	}
	
	
}
