package com.kgggh.bugny.service;

import java.sql.Date;

import com.kgggh.bugny.dto.UserDTO;

public interface UserService {
	
	public void loginDate(String logDate)throws Exception;
	public void register(UserDTO user)throws Exception;
	public UserDTO login(UserDTO user)throws Exception;
	public int idCheck(String userId) throws Exception;

	

	
}
