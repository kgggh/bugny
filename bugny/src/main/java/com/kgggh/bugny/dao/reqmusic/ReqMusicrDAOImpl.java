package com.kgggh.bugny.dao.reqmusic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgggh.bugny.dto.Criteria;
import com.kgggh.bugny.dto.ReqMusicDTO;



@Repository("reqMusicDAO")
public class ReqMusicrDAOImpl implements ReqMusicDAO {

	@Autowired
	SqlSession sql;

	@Override
	public int countReqMusic() throws Exception {
		return sql.selectOne("reqMusic.reqCount");
	}

	@Override
	public List<ReqMusicDTO> ReqMusiList(Criteria cri) throws Exception {
		return sql.selectList("reqMusic.reqList",cri);
	}

	@Override
	public int ReqMusiCreate(ReqMusicDTO reqMusic) throws Exception {
		return sql.insert("reqMusic.reqCreate",reqMusic);
	}

	@Override
	public int ReqMusiUpdate(ReqMusicDTO reqMusic) throws Exception {
		return sql.update("reqMusic.reqUpdate",reqMusic);
	}

	@Override
	public int ReqMusiDelete(int req_idx) throws Exception {
		return sql.delete("reqMusic.reqDelete",req_idx);
	}

	@Override
	public List<ReqMusicDTO> testList(int start, int end) throws Exception {
		Map<String , Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		return sql.selectList("reqMusic.testList", map);
	}
	



	

}
