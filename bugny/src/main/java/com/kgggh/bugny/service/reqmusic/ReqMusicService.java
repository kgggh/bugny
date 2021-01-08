package com.kgggh.bugny.service.reqmusic;

import java.util.List;


import com.kgggh.bugny.dto.Criteria;
import com.kgggh.bugny.dto.ReqMusicDTO;


public interface ReqMusicService {
	
	public int countReqMusic() throws Exception;
	public List<ReqMusicDTO> ReqMusiList(Criteria cri) throws Exception;
	public int ReqMusiCreate(ReqMusicDTO reqMusic) throws Exception;
	public int ReqMusiUpdate(ReqMusicDTO reqMusic) throws Exception;
	public int ReqMusiDelete(int req_idx) throws Exception;


}
