package com.kgggh.bugny.controller.reqmusic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kgggh.bugny.dto.Criteria;
import com.kgggh.bugny.dto.ReplyDTO;
import com.kgggh.bugny.dto.ReqMusicDTO;
import com.kgggh.bugny.service.reqmusic.ReqMusicService;
import com.kgggh.bugny.util.Pagination;
import com.kgggh.bugny.util.ReqPaging;

@Controller
public class ReqMusicController {
	@Autowired
	ReqMusicService reqMusicService;
	
	@GetMapping(value = "/reqMusicList")
	public String reqMusicList() throws Exception{
		return "music/music_request";
	}
	
	@ResponseBody
	@GetMapping(value = "/getReqList")
    public Map<String, Object> reqMusicList(Criteria cri) throws Exception {
		Pagination pagination = new Pagination();
		pagination.setCri(cri);
		pagination.setTotalCount(reqMusicService.countReqMusic());
		Map<String, Object> map = new HashMap<>();
		map.put("list", reqMusicService.ReqMusiList(cri));
		map.put("count", pagination.getTotalCount());
		map.put("page",pagination);
		map.put("pageNum",pagination.getStartPage());
		return map;
    }
	
	@ResponseBody
	@PostMapping(value = "/reqPageList")
    public Map<String, Object> reqMusicPage(@RequestParam("page")int page) throws Exception {
		Criteria cri = new Criteria();
		cri.setPage(page);
		Pagination pagination = new Pagination();
		pagination.setCri(cri);
		pagination.setTotalCount(reqMusicService.countReqMusic());
		Map<String, Object> map = new HashMap<>();
		map.put("list", reqMusicService.ReqMusiList(cri));
		map.put("count", pagination.getTotalCount());
		map.put("page",pagination);
		return map;
    }
	


}
