package com.kgggh.bugny.controller.reqmusic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@RequestMapping(value = "/reqMusicList",method = RequestMethod.GET)
	public String reqMusicList(Model model,Criteria cri) throws Exception{
		Pagination pagination = new Pagination();
		pagination.setCri(cri);
		pagination.setTotalCount(reqMusicService.countReqMusic());
	    List<ReqMusicDTO> list = reqMusicService.ReqMusiList(cri);
	    model.addAttribute("reqMusicList", list);
	    model.addAttribute("pagination", pagination);
	    model.addAttribute("req", new ReqMusicDTO());
		return "music/music_request";
	}
	
	@ResponseBody
	@RequestMapping(value = "/getReqList", method = RequestMethod.GET)
    public Map<String, Object> reqMusicList(Criteria cri,Model model) throws Exception {
		Pagination pagination = new Pagination();
		pagination.setCri(cri);
		pagination.setTotalCount(reqMusicService.countReqMusic());
		Map<String, Object> map = new HashMap<>();
		map.put("list", reqMusicService.ReqMusiList(cri));
		map.put("count", pagination.getTotalCount());
		map.put("page",pagination);
		return map;
    }
	
//	@ResponseBody
//	@RequestMapping(value = "/getReqList", method = RequestMethod.POST)
//	public Map<String, Object> reqMusicList (ReqMusicDTO reqMusic,@RequestParam(defaultValue = "1")int curPage
//								) throws Exception {
//		Map<String, Object> map = new HashMap<>();
//		int count = reqMusicService.countReqMusic();
//	
//		ReqPaging reqPaging = new ReqPaging(count, curPage);
//		int start = reqPaging.getPageBegin();
//		int end = reqPaging.getPageEnd();	
//		map.put("list",reqMusicService.testList(start,end));
//		map.put("page", reqPaging);
//		map.put("count",count);
//		return map;
//		
//	}


}
