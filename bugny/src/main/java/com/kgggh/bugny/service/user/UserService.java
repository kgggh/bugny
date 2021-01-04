package com.kgggh.bugny.service.user;



import com.kgggh.bugny.dto.UserDTO;

public interface UserService {
	
	public void logTime(String id)throws Exception; //로그인 시간
	public int register(UserDTO user)throws Exception; //회원가입
	public UserDTO login(UserDTO user)throws Exception; //로그인
	public int idCheck(String id) throws Exception; //아이디체크
	public void userUpdate(UserDTO user) throws Exception;

	

	
}
