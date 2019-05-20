package com.music.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ValidationUtils {
	
	public static boolean isMobilePhoneNum(String phoneNum) {
		String regex = "^((13[0-9])|(14[5,7,9])|(15([0-3]|[5-9]))|(17[0,1,3,5,6,7,8])|(18[0-9])|(19[8|9]))\\d{8}$";
		if (phoneNum.length() != 11) {
			return false;
		}
		else {
			Pattern p = Pattern.compile(regex);
			Matcher m = p.matcher(phoneNum);
			return m.matches();
		}
	}
	
	public static boolean isIdCard(String idCard) {
		String regex = "^[1-9]\\d{5}(18|19|([23]\\d))\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{3}[0-9Xx]$";
		if (idCard.length() != 18) {
			return false;
		}
		else {
			Pattern p = Pattern.compile(regex);
			Matcher m = p.matcher(idCard);
			return m.matches();
		}
	}
}
