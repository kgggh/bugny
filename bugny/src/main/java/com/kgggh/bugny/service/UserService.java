package com.kgggh.bugny.service;



import com.kgggh.bugny.dto.UserDTO;

public interface UserService {
	
	public void logTime(String logTime)throws Exception;
	public int register(UserDTO user)throws Exception;
	public UserDTO login(UserDTO user)throws Exception;
	public int idCheck(String id) throws Exception;
	public void userUpdate(UserDTO user) throws Exception;

	

	
}
