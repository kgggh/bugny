package com.kgggh.bugny.util;

import java.security.MessageDigest;

public class SHA256Util {
	
	
	public static String encryptSHA256(String sha256) {
		return encrypt(sha256, "SHA-256");
	}
	
	//SHA-256 암호화
	public static String encrypt(String sha256, String messageDigest) {
		try {
			MessageDigest md = MessageDigest.getInstance(messageDigest);
			
	        byte[] passBytes = sha256.getBytes();
	        md.reset();
	        byte[] digested = md.digest(passBytes); 
	        StringBuffer sb = new StringBuffer();
	        for (int i = 0; i < digested.length; i++) sb.append(Integer.toString((digested[i]&0xff) + 0x100, 16).substring(1));
	        return sb.toString();
		} catch (Exception e) {
			return sha256;
		}
	 }
}
