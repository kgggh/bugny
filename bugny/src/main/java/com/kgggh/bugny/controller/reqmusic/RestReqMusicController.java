package com.kgggh.bugny.controller.reqmusic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kgggh.bugny.dto.ReqMusicDTO;
import com.kgggh.bugny.service.reqmusic.ReqMusicService;
import com.kgggh.bugny.util.ReqPaging;

@RestController
@RequestMapping(value = "/restReqMusic")
public class RestReqMusicController {
	
	@Autowired
	private ReqMusicService reqMusicService;

	
	@PostMapping(value = "/reqMusicCreate")
	public Map<String, Object> reqMusicCreate(@RequestBody ReqMusicDTO reqMusic) throws Exception {
		Map<String, Object> result = new HashMap<>();
		try {
			reqMusicService.ReqMusiCreate(reqMusic);
			result.put("status", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");	
		}
		return result;
	}
	
	@RequestMapping(value = "/reqMusicUpdate", method = {RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> reqMusicUpdate(@RequestBody ReqMusicDTO reqMusic) throws Exception {
		Map<String, Object> result = new HashMap<>();
		try {
			reqMusicService.ReqMusiUpdate(reqMusic);
		result.put("status", "OK");
		
		} catch (Exception e) {
		e.printStackTrace();
		result.put("status", "False");
		}
		return result;
		}
	
	@RequestMapping(value = "/reqMusicDelete", method = {RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> reqMusicDelete(@RequestParam("req_idx") int req_idx) throws Exception {
		Map<String, Object> result = new HashMap<>();
		try {
			reqMusicService.ReqMusiDelete(req_idx);
		result.put("status", "OK");
		
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}
		return result;
		}
	
	
	
	
}

