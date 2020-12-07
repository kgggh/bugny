package com.kgggh.bugny.dto;

import java.sql.Date;

public class UserDTO {
	    // 아이디 
	    private String id;
	    private String password; //비밀번호
	    private String name; //이름 
	    private Date birth; //생일 
	    private String email; // 이메일 
	    private String address; // 주소 
	    private String phone; // 핸드폰 
	    private Date reg; //가입일 
	    private String logdate; //로그인일자 
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
		public Date getReg() {
			return reg;
		}
		public void setReg(Date reg) {
			this.reg = reg;
		}
		public String getLogdate() {
			return logdate;
		}
		public void setLogdate(String logdate) {
			this.logdate = logdate;
		}
		@Override
		public String toString() {
			return "UserDTO [id=" + id + ", password=" + password + ", name=" + name + ", birth=" + birth + ", email="
					+ email + ", address=" + address + ", phone=" + phone + ", reg=" + reg + ", logdate=" + logdate
					+ "]";
		}
		
	    
	
	
}
