package com.kgggh.bugny.service.music;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgggh.bugny.dao.music.MusicDAO;
import com.kgggh.bugny.dto.Criteria;
import com.kgggh.bugny.dto.LikeMusicDTO;
import com.kgggh.bugny.dto.MusicDTO;
import com.kgggh.bugny.dto.SearchCriteria;


@Service("musicService")
public class MusicServiceImpl implements MusicService {

	@Autowired
	private MusicDAO musicDAO ;

	@Override
	public int countNewMusic(SearchCriteria cri) throws Exception {
		return musicDAO.countNewMusic(cri);
	}

	@Override
	public List<MusicDTO> musicNewest(SearchCriteria cri) throws Exception {
		return musicDAO.musicNewest(cri);
	}

	@Override
	public void musicCreate(MusicDTO music) throws Exception {
		musicDAO.musicCreate(music);
	}

	@Override
	public void musicDelete(int music_idx) throws Exception {
		musicDAO.musicDelete(music_idx);
	}

	@Override
	public List<MusicDTO> musicTop(Criteria cri) throws Exception {
		return musicDAO.musicTop(cri);
	}

	@Override
	public int countTopMusic() throws Exception {
		return musicDAO.countTopMusic();
	}
	
	
	@Override
    public void insertMusicLike(LikeMusicDTO liked) throws Exception {
		musicDAO.insertMusicLike(liked);
    }

    @Override
    public void deleteMusicLike(LikeMusicDTO liked) throws Exception {
    	musicDAO.deleteMusicLike(liked);
    }
    
    @Override
    public int getMusicLike(LikeMusicDTO liked) throws Exception {
            return musicDAO.getMusicLike(liked);
    }

	@Override
	public MusicDTO musicDetail(MusicDTO music) throws Exception {
		return musicDAO.boardDetail(music);
	}

	
	

}
