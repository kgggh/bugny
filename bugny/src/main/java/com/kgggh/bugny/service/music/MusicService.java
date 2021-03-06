package com.kgggh.bugny.service.music;

import java.util.List;

import com.kgggh.bugny.dto.Criteria;
import com.kgggh.bugny.dto.MusicDTO;
import com.kgggh.bugny.dto.SearchCriteria;

public interface MusicService {
	public int countNewMusic(SearchCriteria cri) throws Exception;
	public List<MusicDTO> musicNewest(SearchCriteria cri)throws Exception; //최신음악
	public void musicCreate(MusicDTO music)throws Exception;
	public void musicDelete(int music_idx) throws Exception;
	public List<MusicDTO> musicTop(Criteria cri)throws Exception;
	public int countTopMusic()throws Exception;
	public MusicDTO musicDetail(MusicDTO music)throws Exception;
	public void musicHit(int music_idx)throws Exception;
	public void musicUpdate(MusicDTO music)throws Exception;	
}
