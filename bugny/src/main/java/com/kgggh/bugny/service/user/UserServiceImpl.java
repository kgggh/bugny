package com.kgggh.bugny.service.user;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgggh.bugny.dao.user.UserDAO;
import com.kgggh.bugny.dto.UserDTO;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;
	
	@Override
	public int register(UserDTO user) throws Exception {
		return userDAO.register(user);

	}
	
	@Override
	public UserDTO login(UserDTO user) throws Exception {
		return userDAO.login(user);
	}

	@Override
	public int idCheck(String id) throws Exception {
		return userDAO.idCheck(id);
		
	}

	@Override
	public void logTime(String id) throws Exception {
		userDAO.logTime(id);
		
	}

	@Override
	public void userUpdate(UserDTO user)throws Exception {
		userDAO.userUpdate(user);
	}


	

}
