package com.kgggh.bugny.controller.music;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kgggh.bugny.dto.Criteria;
import com.kgggh.bugny.dto.MusicDTO;
import com.kgggh.bugny.dto.SearchCriteria;
import com.kgggh.bugny.dto.UserDTO;
import com.kgggh.bugny.service.music.MusicService;
import com.kgggh.bugny.util.Pagination;



@Controller
public class MusicController {
	private static final Logger log = LoggerFactory.getLogger(MusicController.class);
	
	@Autowired
	MusicService musicService;
	
	@RequestMapping("/musicNewest")
	public String musicNewest(SearchCriteria cri,Model model) throws Exception {
		log.info("최신음악 진입");
		Pagination pagination = new Pagination();
		pagination.setCri(cri);
		pagination.setTotalCount(musicService.countNewMusic(cri));
		List<MusicDTO> musicNewest = musicService.musicNewest(cri);
		model.addAttribute("musicNewest",musicNewest);
	    model.addAttribute("pagination", pagination);
	    
		return "music/music_newest";
	}
	
	@RequestMapping("/musicTop")
	public String musicTop(Criteria cri,Model model) throws Exception {
		log.info("인기음악 진입");
		Pagination pagination = new Pagination();
		pagination.setCri(cri);
		pagination.setTotalCount(musicService.countTopMusic());
		List<MusicDTO> musicTop = musicService.musicTop(cri);
		model.addAttribute("musicTop",musicTop);
	    model.addAttribute("pagination", pagination);
		return "music/music_Top";
	}
		
	@RequestMapping("/musicWriteP")
	public String musicWritePage(Model model,HttpSession session) {
		String id = (String) session.getAttribute("loginId");
		System.out.println(id);
		if(id.equals("admin")) {
			return "music/music_write";
		}else {
			model.addAttribute("msg","잘못된 경로입니다.다시 시도해주세요.");
			model.addAttribute("url","/home");
		return "redirect";
		}
	}
	
	//글상세페이지
	@RequestMapping("/musicDetail")
	public String boardDetail(MusicDTO music,@RequestParam("music_idx")int music_idx,Model model) throws Exception {
		log.info("게시글상세 페이지");
		musicService.musicHit(music_idx);
		music = musicService.musicDetail(music);
		model.addAttribute("musicDetail",music);
		return "music/music_detail";
	}
	
	
	@RequestMapping("/musicReq")
	public String musicRequest() {
		log.info("노래 요청 페이지");
		return "music/music_request";
	} 
	
	@RequestMapping("/musicWrite") //노래 등록
	public String musicWrite( MusicDTO music,Model model) throws Exception {
			musicService.musicCreate(music);
        return "redirect:/musicNewest";
	}
	
	
	
}
