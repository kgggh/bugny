package com.kgggh.bugny.service.reqmusic;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgggh.bugny.dao.reqmusic.ReqMusicDAO;
import com.kgggh.bugny.dto.Criteria;
import com.kgggh.bugny.dto.ReqMusicDTO;



@Service("reqMusicService")
public class ReqMusicServiceImpl implements ReqMusicService {
	
	@Autowired
	private ReqMusicDAO reqMusicDAO;
	
	@Override
	public int countReqMusic() throws Exception {
		return reqMusicDAO.countReqMusic();
	}

	@Override
	public List<ReqMusicDTO> ReqMusiList(Criteria cri) throws Exception {
		return reqMusicDAO.ReqMusiList(cri);
	}

	@Override
	public int ReqMusiCreate(ReqMusicDTO reqMusic) throws Exception {
		return reqMusicDAO.ReqMusiCreate(reqMusic);
	}

	@Override
	public int ReqMusiUpdate(ReqMusicDTO reqMusic) throws Exception {
		return reqMusicDAO.ReqMusiUpdate(reqMusic);
	}

	@Override
	public int ReqMusiDelete(int req_idx) throws Exception {
		return reqMusicDAO.ReqMusiDelete(req_idx);
	}


	

	

}
