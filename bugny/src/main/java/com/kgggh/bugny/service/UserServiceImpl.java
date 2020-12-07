package com.kgggh.bugny.service;



import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgggh.bugny.dao.UserDAO;
import com.kgggh.bugny.dto.UserDTO;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;
	
	@Override
	public void register(UserDTO user) throws Exception {
		userDAO.register(user);

	}
	
	@Override
	public UserDTO login(UserDTO user) throws Exception {
		return userDAO.login(user);
	}

	@Override
	public int idCheck(String userId) throws Exception {
		int result = userDAO.idCheck(userId);
		return result;
	}

	@Override
	public void loginDate(String logDate) throws Exception {
		userDAO.logDate(logDate);
		
	}

	

}
