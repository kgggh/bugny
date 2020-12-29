package com.kgggh.bugny.dto;

import java.util.Date;

public class UserDTO {
	    private String id; // 아이디 
	    private String password; //비밀번호
	    private String name; //이름 
	    private Date birth; //생일 
	    private String email; // 이메일 
	    private String address; // 주소 
	    private String phone; // 핸드폰 
	    private String reg; //가입일 
	    private Date logTime; //로그인일자 
	    private String role; //권한
	    
		public UserDTO() {}

	
		public String getId() {
			return id;
		}


		public void setId(String id) {
			this.id = id;
		}


		public String getPassword() {
			return password;
		}


		public void setPassword(String password) {
			this.password = password;
		}


		public String getName() {
			return name;
		}


		public void setName(String name) {
			this.name = name;
		}


		public Date getBirth() {
			return birth;
		}


		public void setBirth(Date birth) {
			this.birth = birth;
		}


		public String getEmail() {
			return email;
		}


		public void setEmail(String email) {
			this.email = email;
		}


		public String getAddress() {
			return address;
		}


		public void setAddress(String address) {
			this.address = address;
		}


		public String getPhone() {
			return phone;
		}


		public void setPhone(String phone) {
			this.phone = phone;
		}


		public String getReg() {
			return reg;
		}


		public void setReg(String reg) {
			this.reg = reg;
		}


		public Date getLogTime() {
			return logTime;
		}


		public void setLogTime(Date logTime) {
			this.logTime = logTime;
		}


		public String getRole() {
			return role;
		}


		public void setRole(String role) {
			this.role = role;
		}


		@Override
		public String toString() {
			return "UserDTO [id=" + id + ", password=" + password + ", name=" + name + ", birth=" + birth + ", email="
					+ email + ", address=" + address + ", phone=" + phone + ", reg=" + reg + ", logTime=" + logTime
					+ ", role=" + role + "]";
		}
		
		
		
	    
	    
}
