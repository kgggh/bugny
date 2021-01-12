package com.kgggh.bugny.dao.music;

import java.util.List;

import com.kgggh.bugny.dto.Criteria;
import com.kgggh.bugny.dto.MusicDTO;
import com.kgggh.bugny.dto.SearchCriteria;

public interface MusicDAO  {
	public int countNewMusic(SearchCriteria cri) throws Exception;
	public int countTopMusic() throws Exception;
	public List<MusicDTO> musicNewest(SearchCriteria cri)throws Exception;
	public List<MusicDTO> musicTop(Criteria cri)throws Exception;
	public int musicCreate(MusicDTO music)throws Exception;
	public void musicDelete(int music_idx) throws Exception;
	public MusicDTO boardDetail(MusicDTO music)throws Exception;
	public void musicHit(int music_idx)throws Exception;
	public void musicUpdate(MusicDTO music)throws Exception;	

	
}
