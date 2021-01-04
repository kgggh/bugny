package com.kgggh.bugny.dao.user;



import org.springframework.dao.DuplicateKeyException;

import com.kgggh.bugny.dto.UserDTO;

public interface UserDAO  {

	public int register(UserDTO user)throws Exception,DuplicateKeyException;
	public UserDTO login(UserDTO user)throws Exception;
	public int idCheck(String id)throws Exception;
	public void logTime(String logTime)throws Exception;
	public void userUpdate(UserDTO user)throws Exception;
}
