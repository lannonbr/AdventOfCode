package org.lannonbr.test;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import javax.xml.bind.DatatypeConverter;

public class MD5 {

	MessageDigest md;
	
	public MD5(String str) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		md = MessageDigest.getInstance("MD5");
		
		long i = 0;
		for(;;) {
			String newStr = str + i;

			byte[] hash = md.digest(newStr.getBytes("UTF-8"));
			
			String hashStr = DatatypeConverter.printHexBinary(Arrays.copyOfRange(hash, 0, 6));
			
			String requiredSection = "000000";
			
			if(requiredSection.equals(hashStr.substring(0, 6))) {
				System.out.println(i);
				return;
			}
			i++;
		}
	}
	
	public static void main(String[] args) {
		try {
			new MD5("yzbqklnj");
		} catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
}
