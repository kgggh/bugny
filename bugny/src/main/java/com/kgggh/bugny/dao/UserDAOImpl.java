package com.kgggh.bugny.dao;

import java.sql.Date;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgggh.bugny.dto.UserDTO;

@Repository("userDAO")
public class UserDAOImpl implements UserDAO {

	@Autowired
	SqlSession sql;
	
	@Override
	public void register(UserDTO user) throws Exception {
		sql.insert("user.register",user);
	}

	@Override
	public UserDTO login(UserDTO user) throws Exception {
		return sql.selectOne("user.login",user);
	}
	
	@Override
	public int idCheck(String userId) throws Exception {
		int result = sql.selectOne("user.idCheck",userId);
		return result;
	}

	@Override
	public void logDate(String logDate) throws Exception {
		sql.update("user.logDate",logDate);
		
	}

	

	

	

}
