package com.kgggh.bugny.dao.reqmusic;

import java.util.List;

import com.kgggh.bugny.dto.Criteria;
import com.kgggh.bugny.dto.ReqMusicDTO;


public interface ReqMusicDAO  {
	public int countReqMusic() throws Exception;
	public List<ReqMusicDTO> ReqMusiList(Criteria cri) throws Exception;
	public int ReqMusiCreate(ReqMusicDTO reqMusic) throws Exception;
	public int ReqMusiUpdate(ReqMusicDTO reqMusic) throws Exception;
	public int ReqMusiDelete(int req_idx) throws Exception;
	public List<ReqMusicDTO> testList(int start, int end) throws Exception;
 
	
}
