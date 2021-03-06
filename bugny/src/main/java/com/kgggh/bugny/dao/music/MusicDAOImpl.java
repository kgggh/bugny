package com.kgggh.bugny.dao.music;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgggh.bugny.dto.Criteria;
import com.kgggh.bugny.dto.MusicDTO;
import com.kgggh.bugny.dto.SearchCriteria;



@Repository("musicDAO")
public class MusicDAOImpl implements MusicDAO {

	@Autowired
	SqlSession sql;

	@Override
	public int countNewMusic(SearchCriteria cri) throws Exception {
		return sql.selectOne("music.countNewMusic",cri);
	}

	@Override
	public List<MusicDTO> musicNewest(SearchCriteria cri) throws Exception {
		return sql.selectList("music.musicNewest",cri);
	}

	@Override
	public int musicCreate(MusicDTO music) throws Exception {
		return sql.insert("music.musicCreate",music);
		
	}

	@Override
	public void musicDelete(int music_idx) throws Exception {
		sql.delete("music.musicDelete",music_idx);
		
	}

	@Override
	public int countTopMusic() throws Exception {
		return sql.selectOne("music.countTopMusic");
	}

	@Override
	public List<MusicDTO> musicTop(Criteria cri) throws Exception {
		return sql.selectList("music.musicTop",cri);
	}
	@Override
	public MusicDTO boardDetail(MusicDTO music) throws Exception {
		return sql.selectOne("music.musicDetail",music);
	}

	@Override
	public void musicHit(int music_idx) throws Exception {
		sql.update("music.musicHit",music_idx);
		
	}

	@Override
	public void musicUpdate(MusicDTO music) throws Exception {
		sql.update("music.musicUpdate",music);
		
	}

}
