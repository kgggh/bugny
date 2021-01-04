package com.kgggh.bugny.dao.user;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kgggh.bugny.dto.UserDTO;

@Repository("userDAO")
public class UserDAOImpl implements UserDAO {

	@Autowired
	SqlSession sql;
	
	@Override
	public int register(UserDTO user) throws Exception {
		return sql.insert("user.register",user);
	}

	@Override
	public UserDTO login(UserDTO user) throws Exception {
		return sql.selectOne("user.login",user);
	}
	
	@Override
	public int idCheck(String id) throws Exception {
		 return sql.selectOne("user.idCheck",id);
		
	}

	@Override
	public void logTime(String id) throws Exception {
		sql.update("user.logTime",id);
		
	}

	@Override
	public void userUpdate(UserDTO user) {
		sql.update("user.userUpdate",user);
	}

	

	

	

}
