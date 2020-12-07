package com.kgggh.bugny.dao;


import com.kgggh.bugny.dto.UserDTO;

public interface UserDAO  {

	public void register(UserDTO user)throws Exception;
	public UserDTO login(UserDTO user)throws Exception;
	public int idCheck(String userId)throws Exception;
	public void logDate(String logDate)throws Exception;
	
}
